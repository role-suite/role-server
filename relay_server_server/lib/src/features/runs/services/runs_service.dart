import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/runs/data/runs_repository.dart';
import 'package:relay_server_server/src/features/runs/services/run_execution_policy.dart';
import 'package:relay_server_server/src/features/runs/services/run_payload_resolver.dart';
import 'package:relay_server_server/src/features/workspaces/services/workspace_access_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

class RunsService {
  RunsService({
    RunsRepository? repository,
    WorkspaceAccessService? workspaceAccessService,
  }) : _repository = repository ?? const RunsRepository(),
       _workspaceAccess = workspaceAccessService ?? WorkspaceAccessService(),
       _policy = RunExecutionPolicy(),
       _payloadResolver = const RunPayloadResolver();

  final RunsRepository _repository;
  final WorkspaceAccessService _workspaceAccess;
  final RunExecutionPolicy _policy;
  final RunPayloadResolver _payloadResolver;

  Future<List<RequestRunModel>> listRuns(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {
    await _workspaceAccess.requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    final rows = await _repository.listRunsByWorkspace(session, workspaceId);
    return rows.map(_toRunModel).toList();
  }

  Future<RequestRunDetailModel> getRun(
    Session session, {
    required int userId,
    required int workspaceId,
    required int runId,
  }) async {
    await _workspaceAccess.requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    final run = await _repository.findRunById(session, runId);
    if (run == null || run.workspaceId != workspaceId) {
      throw DomainException('Run not found', statusCode: 404);
    }
    final requestSnapshot = await _repository.findRequestSnapshotByRunId(
      session,
      run.id!,
    );
    final responseSnapshot = await _repository.findResponseSnapshotByRunId(
      session,
      run.id!,
    );
    return RequestRunDetailModel(
      run: _toRunModel(run),
      requestSnapshot: requestSnapshot == null
          ? null
          : _toRequestSnapshotModel(requestSnapshot),
      responseSnapshot: responseSnapshot == null
          ? null
          : _toResponseSnapshotModel(responseSnapshot),
    );
  }

  Future<RequestRunModel> cancelRun(
    Session session, {
    required int userId,
    required int workspaceId,
    required int runId,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    final run = await _repository.findRunById(session, runId);
    if (run == null || run.workspaceId != workspaceId) {
      throw DomainException('Run not found', statusCode: 404);
    }
    if (run.status == 'completed' || run.status == 'failed') {
      throw DomainException('Run is already finished', statusCode: 400);
    }
    run.status = 'cancelled';
    run.completedAt = DateTime.now().toUtc();
    run.durationMs = run.startedAt == null
        ? 0
        : run.completedAt!.difference(run.startedAt!).inMilliseconds;
    await _repository.updateRun(session, run);
    return _toRunModel(run);
  }

  Future<RequestRunDetailModel> createRun(
    Session session, {
    required int userId,
    required CreateRequestRunRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );

    final plan = await _resolveRequestPlan(session, request);
    final now = DateTime.now().toUtc();
    final run = await _repository.createRun(
      session,
      workspaceId: request.workspaceId,
      initiatedByUserId: userId,
      sourceType: plan.sourceType,
      sourceCollectionId: plan.sourceCollectionId,
      sourceEndpointId: plan.sourceEndpointId,
      status: 'running',
      startedAt: now,
    );

    await _repository.createRequestSnapshot(
      session,
      runId: run.id!,
      method: plan.method,
      url: plan.url,
      headersJson: jsonEncode(plan.headers),
      queryParamsJson: jsonEncode(plan.queryParams),
      bodyJson: plan.bodyJson,
      authJson: plan.authJson,
      resolvedVariablesJson: jsonEncode(plan.resolvedVariables),
      timeoutMs: plan.timeoutMs,
    );

    try {
      final response = await _execute(plan);
      await _repository.createResponseSnapshot(
        session,
        runId: run.id!,
        statusCode: response.statusCode,
        headersJson: jsonEncode(response.headers),
        bodyText: response.bodyText,
        bodyBase64: response.bodyBase64,
        sizeBytes: response.sizeBytes,
        truncated: response.truncated,
      );
      final completedAt = DateTime.now().toUtc();
      run.status = 'completed';
      run.completedAt = completedAt;
      run.durationMs = completedAt.difference(now).inMilliseconds;
      await _repository.updateRun(session, run);
    } on DomainException catch (e) {
      final completedAt = DateTime.now().toUtc();
      run.status = 'failed';
      run.completedAt = completedAt;
      run.durationMs = completedAt.difference(now).inMilliseconds;
      run.errorCode = e.code;
      run.errorMessage = e.message;
      run.errorJson = jsonEncode({
        'statusCode': e.statusCode,
        'message': e.message,
      });
      await _repository.updateRun(session, run);
    } catch (e) {
      final completedAt = DateTime.now().toUtc();
      run.status = 'failed';
      run.completedAt = completedAt;
      run.durationMs = completedAt.difference(now).inMilliseconds;
      run.errorCode = 'RUN_EXECUTION_FAILED';
      run.errorMessage = 'Request execution failed';
      run.errorJson = jsonEncode({'error': e.toString()});
      await _repository.updateRun(session, run);
    }

    return getRun(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
      runId: run.id!,
    );
  }

  Future<_ResolvedRunPlan> _resolveRequestPlan(
    Session session,
    CreateRequestRunRequest request,
  ) async {
    String sourceType = 'direct';
    int? sourceCollectionId = request.sourceCollectionId;
    int? sourceEndpointId = request.sourceEndpointId;
    String method = request.method?.trim().toUpperCase() ?? '';
    String url = request.url?.trim() ?? '';
    String? headersJson = request.headersJson;
    String? queryParamsJson = request.queryParamsJson;
    String? bodyJson = request.bodyJson;
    String? authJson = request.authJson;

    if (request.sourceEndpointId != null) {
      final endpoint = await _repository.findCollectionEndpointById(
        session,
        request.sourceEndpointId!,
      );
      if (endpoint == null) {
        throw DomainException('Source endpoint not found', statusCode: 404);
      }
      final collection = await _repository.findCollectionById(
        session,
        endpoint.collectionId,
      );
      if (collection == null || collection.workspaceId != request.workspaceId) {
        throw DomainException(
          'Source endpoint not in workspace',
          statusCode: 404,
        );
      }
      sourceType = 'endpoint';
      sourceCollectionId = collection.id;
      sourceEndpointId = endpoint.id;
      method = endpoint.method.trim().toUpperCase();
      url = endpoint.url.trim();
      headersJson = endpoint.headersJson;
      queryParamsJson = endpoint.queryParamsJson;
      bodyJson = endpoint.bodyJson;
      authJson = endpoint.authJson;
    }

    if (method.isEmpty || url.isEmpty) {
      throw DomainException('Run method and url are required', statusCode: 400);
    }
    if (!_policy.isAllowedHttpMethod(method)) {
      throw DomainException('Unsupported HTTP method', statusCode: 400);
    }

    final timeoutMs = _policy.normalizeTimeoutMs(request.timeoutMs);
    final headers = _payloadResolver.parseJsonMap(headersJson);
    final queryParams = _payloadResolver.parseJsonMap(queryParamsJson);
    final resolvedVariables = <String, String>{};

    if (request.environmentId != null) {
      final environment = await _repository.findEnvironmentById(
        session,
        request.environmentId!,
      );
      if (environment == null ||
          environment.workspaceId != request.workspaceId) {
        throw DomainException('Environment not found', statusCode: 404);
      }
      final variables = await _repository.listEnvironmentVariables(
        session,
        request.environmentId!,
      );
      for (final variable in variables) {
        if (variable.enabled) {
          resolvedVariables[variable.key] = variable.value;
        }
      }
    }

    final resolvedUrl = _payloadResolver.resolveTemplate(
      url,
      resolvedVariables,
    );
    _policy.validateUrlPolicy(resolvedUrl);

    final resolvedHeaders = {
      for (final entry in headers.entries)
        entry.key: _payloadResolver.resolveTemplate(
          entry.value,
          resolvedVariables,
        ),
    };
    final resolvedQuery = {
      for (final entry in queryParams.entries)
        entry.key: _payloadResolver.resolveTemplate(
          entry.value,
          resolvedVariables,
        ),
    };

    final resolvedBodyJson = bodyJson == null
        ? null
        : _payloadResolver.resolveTemplate(bodyJson, resolvedVariables);
    final resolvedAuthJson = authJson == null
        ? null
        : _payloadResolver.resolveTemplate(authJson, resolvedVariables);

    _payloadResolver.mergeAuthIntoHeaders(resolvedHeaders, resolvedAuthJson);

    return _ResolvedRunPlan(
      sourceType: sourceType,
      sourceCollectionId: sourceCollectionId,
      sourceEndpointId: sourceEndpointId,
      method: method,
      url: resolvedUrl,
      headers: resolvedHeaders,
      queryParams: resolvedQuery,
      bodyJson: resolvedBodyJson,
      authJson: resolvedAuthJson,
      resolvedVariables: resolvedVariables,
      timeoutMs: timeoutMs,
    );
  }

  Future<_ExecutionResult> _execute(_ResolvedRunPlan plan) async {
    final uri = Uri.parse(plan.url).replace(
      queryParameters: plan.queryParams.isEmpty ? null : plan.queryParams,
    );
    final client = HttpClient();
    client.connectionTimeout = Duration(milliseconds: plan.timeoutMs);

    try {
      final req = await client
          .openUrl(plan.method, uri)
          .timeout(Duration(milliseconds: plan.timeoutMs));
      for (final header in plan.headers.entries) {
        req.headers.set(header.key, header.value);
      }

      if (plan.bodyJson != null && plan.bodyJson!.isNotEmpty) {
        req.headers.set('content-type', 'application/json');
        req.add(utf8.encode(plan.bodyJson!));
      }

      final res = await req.close().timeout(
        Duration(milliseconds: plan.timeoutMs),
      );
      final bodyBytes = <int>[];
      final maxBytes = _policy.maxResponseBytes();
      var truncated = false;
      await for (final chunk in res) {
        if (bodyBytes.length + chunk.length > maxBytes) {
          final remaining = maxBytes - bodyBytes.length;
          if (remaining > 0) {
            bodyBytes.addAll(chunk.sublist(0, remaining));
          }
          truncated = true;
          break;
        }
        bodyBytes.addAll(chunk);
      }

      final headers = <String, String>{};
      res.headers.forEach((name, values) {
        headers[name] = values.join(',');
      });
      final bodyText = utf8.decode(bodyBytes, allowMalformed: true);
      return _ExecutionResult(
        statusCode: res.statusCode,
        headers: headers,
        bodyText: bodyText,
        bodyBase64: null,
        sizeBytes: bodyBytes.length,
        truncated: truncated,
      );
    } on TimeoutException {
      throw DomainException(
        'Run timed out',
        code: 'RUN_TIMEOUT',
        statusCode: 408,
      );
    } on SocketException {
      throw DomainException(
        'Unable to reach destination host',
        code: 'RUN_SOCKET_ERROR',
        statusCode: 502,
      );
    } finally {
      client.close(force: true);
    }
  }

  RequestRunModel _toRunModel(StoredRequestRun row) {
    return RequestRunModel(
      id: row.id!,
      workspaceId: row.workspaceId,
      initiatedByUserId: row.initiatedByUserId,
      status: row.status,
      sourceType: row.sourceType,
      sourceCollectionId: row.sourceCollectionId,
      sourceEndpointId: row.sourceEndpointId,
      startedAt: row.startedAt,
      completedAt: row.completedAt,
      durationMs: row.durationMs,
      error: row.errorCode == null && row.errorMessage == null
          ? null
          : RunErrorModel(
              code: row.errorCode ?? 'RUN_ERROR',
              message: row.errorMessage ?? 'Run failed',
              detailsJson: row.errorJson,
            ),
      createdAt: row.createdAt,
    );
  }

  RequestRunRequestSnapshotModel _toRequestSnapshotModel(
    StoredRequestRunRequestSnapshot row,
  ) {
    return RequestRunRequestSnapshotModel(
      runId: row.runId,
      method: row.method,
      url: row.url,
      headersJson: row.headersJson,
      queryParamsJson: row.queryParamsJson,
      bodyJson: row.bodyJson,
      authJson: row.authJson,
      resolvedVariablesJson: row.resolvedVariablesJson,
      timeoutMs: row.timeoutMs,
    );
  }

  RequestRunResponseSnapshotModel _toResponseSnapshotModel(
    StoredRequestRunResponseSnapshot row,
  ) {
    return RequestRunResponseSnapshotModel(
      runId: row.runId,
      statusCode: row.statusCode,
      headersJson: row.headersJson,
      bodyText: row.bodyText,
      bodyBase64: row.bodyBase64,
      sizeBytes: row.sizeBytes,
      truncated: row.truncated,
    );
  }
}

class _ResolvedRunPlan {
  _ResolvedRunPlan({
    required this.sourceType,
    required this.sourceCollectionId,
    required this.sourceEndpointId,
    required this.method,
    required this.url,
    required this.headers,
    required this.queryParams,
    required this.bodyJson,
    required this.authJson,
    required this.resolvedVariables,
    required this.timeoutMs,
  });

  final String sourceType;
  final int? sourceCollectionId;
  final int? sourceEndpointId;
  final String method;
  final String url;
  final Map<String, String> headers;
  final Map<String, String> queryParams;
  final String? bodyJson;
  final String? authJson;
  final Map<String, String> resolvedVariables;
  final int timeoutMs;
}

class _ExecutionResult {
  _ExecutionResult({
    required this.statusCode,
    required this.headers,
    required this.bodyText,
    required this.bodyBase64,
    required this.sizeBytes,
    required this.truncated,
  });

  final int statusCode;
  final Map<String, String> headers;
  final String? bodyText;
  final String? bodyBase64;
  final int sizeBytes;
  final bool truncated;
}

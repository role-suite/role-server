import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/guards/auth_guard.dart';
import 'package:relay_server_server/src/core/logging/endpoint_action_runner.dart';
import 'package:relay_server_server/src/features/runs/services/runs_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

class RunsEndpoint extends Endpoint {
  RunsEndpoint({RunsService? service}) : _service = service ?? RunsService();

  final RunsService _service;

  Future<List<RequestRunModel>> list(Session session, int workspaceId) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'runs',
      action: 'list',
      context: {'userId': userId, 'workspaceId': workspaceId},
      operation: () =>
          _service.listRuns(session, userId: userId, workspaceId: workspaceId),
    );
  }

  Future<RequestRunDetailModel> get(
    Session session,
    int workspaceId,
    int runId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'runs',
      action: 'get',
      context: {'userId': userId, 'workspaceId': workspaceId, 'runId': runId},
      operation: () => _service.getRun(
        session,
        userId: userId,
        workspaceId: workspaceId,
        runId: runId,
      ),
    );
  }

  Future<RequestRunDetailModel> create(
    Session session,
    CreateRequestRunRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'runs',
      action: 'create',
      context: {'userId': userId, 'workspaceId': request.workspaceId},
      operation: () =>
          _service.createRun(session, userId: userId, request: request),
    );
  }

  Future<RequestRunModel> cancel(Session session, int workspaceId, int runId) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'runs',
      action: 'cancel',
      context: {'userId': userId, 'workspaceId': workspaceId, 'runId': runId},
      operation: () => _service.cancelRun(
        session,
        userId: userId,
        workspaceId: workspaceId,
        runId: runId,
      ),
    );
  }
}

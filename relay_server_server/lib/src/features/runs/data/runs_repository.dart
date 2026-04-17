import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/generated/protocol.dart';

class RunsRepository {
  const RunsRepository();

  Future<StoredRequestRun> createRun(
    Session session, {
    required int workspaceId,
    required int initiatedByUserId,
    required String sourceType,
    int? sourceCollectionId,
    int? sourceEndpointId,
    required String status,
    DateTime? startedAt,
    DateTime? completedAt,
    int? durationMs,
    String? errorCode,
    String? errorMessage,
    String? errorJson,
  }) {
    return StoredRequestRun.db.insertRow(
      session,
      StoredRequestRun(
        workspaceId: workspaceId,
        initiatedByUserId: initiatedByUserId,
        sourceType: sourceType,
        sourceCollectionId: sourceCollectionId,
        sourceEndpointId: sourceEndpointId,
        status: status,
        startedAt: startedAt,
        completedAt: completedAt,
        durationMs: durationMs,
        errorCode: errorCode,
        errorMessage: errorMessage,
        errorJson: errorJson,
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<void> updateRun(Session session, StoredRequestRun run) {
    return StoredRequestRun.db.updateRow(session, run);
  }

  Future<StoredRequestRun?> findRunById(Session session, int runId) {
    return StoredRequestRun.db.findById(session, runId);
  }

  Future<List<StoredRequestRun>> listRunsByWorkspace(
    Session session,
    int workspaceId,
  ) {
    return StoredRequestRun.db.find(
      session,
      where: (t) => t.workspaceId.equals(workspaceId),
      orderBy: (t) => t.id,
      orderDescending: true,
    );
  }

  Future<StoredRequestRunRequestSnapshot> createRequestSnapshot(
    Session session, {
    required int runId,
    required String method,
    required String url,
    required String headersJson,
    required String queryParamsJson,
    String? bodyJson,
    String? authJson,
    required String resolvedVariablesJson,
    required int timeoutMs,
  }) {
    return StoredRequestRunRequestSnapshot.db.insertRow(
      session,
      StoredRequestRunRequestSnapshot(
        runId: runId,
        method: method,
        url: url,
        headersJson: headersJson,
        queryParamsJson: queryParamsJson,
        bodyJson: bodyJson,
        authJson: authJson,
        resolvedVariablesJson: resolvedVariablesJson,
        timeoutMs: timeoutMs,
      ),
    );
  }

  Future<StoredRequestRunResponseSnapshot> createResponseSnapshot(
    Session session, {
    required int runId,
    required int statusCode,
    required String headersJson,
    String? bodyText,
    String? bodyBase64,
    required int sizeBytes,
    required bool truncated,
  }) {
    return StoredRequestRunResponseSnapshot.db.insertRow(
      session,
      StoredRequestRunResponseSnapshot(
        runId: runId,
        statusCode: statusCode,
        headersJson: headersJson,
        bodyText: bodyText,
        bodyBase64: bodyBase64,
        sizeBytes: sizeBytes,
        truncated: truncated,
      ),
    );
  }

  Future<StoredRequestRunRequestSnapshot?> findRequestSnapshotByRunId(
    Session session,
    int runId,
  ) {
    return StoredRequestRunRequestSnapshot.db.findFirstRow(
      session,
      where: (t) => t.runId.equals(runId),
    );
  }

  Future<StoredRequestRunResponseSnapshot?> findResponseSnapshotByRunId(
    Session session,
    int runId,
  ) {
    return StoredRequestRunResponseSnapshot.db.findFirstRow(
      session,
      where: (t) => t.runId.equals(runId),
    );
  }

  Future<StoredCollectionEndpoint?> findCollectionEndpointById(
    Session session,
    int endpointId,
  ) {
    return StoredCollectionEndpoint.db.findById(session, endpointId);
  }

  Future<StoredCollection?> findCollectionById(
    Session session,
    int collectionId,
  ) {
    return StoredCollection.db.findById(session, collectionId);
  }

  Future<StoredEnvironment?> findEnvironmentById(
    Session session,
    int environmentId,
  ) {
    return StoredEnvironment.db.findById(session, environmentId);
  }

  Future<List<StoredEnvironmentVariable>> listEnvironmentVariables(
    Session session,
    int environmentId,
  ) {
    return StoredEnvironmentVariable.db.find(
      session,
      where: (t) => t.environmentId.equals(environmentId),
      orderBy: (t) => t.position,
    );
  }
}

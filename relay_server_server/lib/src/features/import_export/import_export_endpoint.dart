import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/guards/auth_guard.dart';
import 'package:relay_server_server/src/core/logging/endpoint_action_runner.dart';
import 'package:relay_server_server/src/features/import_export/services/import_export_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

class ImportExportEndpoint extends Endpoint {
  ImportExportEndpoint({ImportExportService? service})
    : _service = service ?? ImportExportService();

  final ImportExportService _service;

  Future<List<ImportExportJobModel>> listJobs(
    Session session,
    int workspaceId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'importExport',
      action: 'listJobs',
      context: {'userId': userId, 'workspaceId': workspaceId},
      operation: () => _service.listJobs(
        session,
        userId: userId,
        workspaceId: workspaceId,
      ),
    );
  }

  Future<ImportExportJobModel> getJobById(
    Session session,
    int workspaceId,
    int jobId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'importExport',
      action: 'getJobById',
      context: {'userId': userId, 'workspaceId': workspaceId, 'jobId': jobId},
      operation: () => _service.getJobById(
        session,
        userId: userId,
        workspaceId: workspaceId,
        jobId: jobId,
      ),
    );
  }

  Future<ImportExportJobModel> createExport(
    Session session,
    CreateWorkspaceExportRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'importExport',
      action: 'createExport',
      context: {'userId': userId, 'workspaceId': request.workspaceId},
      operation: () =>
          _service.createExportJob(session, userId: userId, request: request),
    );
  }

  Future<ImportExportJobModel> createImport(
    Session session,
    CreateWorkspaceImportRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'importExport',
      action: 'createImport',
      context: {'userId': userId, 'workspaceId': request.workspaceId},
      operation: () =>
          _service.createImportJob(session, userId: userId, request: request),
    );
  }
}

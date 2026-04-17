import 'dart:convert';

import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/import_export/data/import_export_repository.dart';
import 'package:relay_server_server/src/features/workspaces/services/workspace_access_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

class ImportExportService {
  ImportExportService({
    ImportExportRepository? repository,
    WorkspaceAccessService? workspaceAccessService,
  }) : _repository = repository ?? const ImportExportRepository(),
       _workspaceAccess = workspaceAccessService ?? WorkspaceAccessService();

  final ImportExportRepository _repository;
  final WorkspaceAccessService _workspaceAccess;

  Future<List<ImportExportJobModel>> listJobs(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {
    await _workspaceAccess.requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    final rows = await _repository.listByWorkspace(session, workspaceId);
    return rows.map(_toModel).toList();
  }

  Future<ImportExportJobModel> getJobById(
    Session session, {
    required int userId,
    required int workspaceId,
    required int jobId,
  }) async {
    await _workspaceAccess.requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    final row = await _repository.findById(session, jobId);
    if (row == null || row.workspaceId != workspaceId) {
      throw DomainException('Import/export job not found', statusCode: 404);
    }
    return _toModel(row);
  }

  Future<ImportExportJobModel> createExportJob(
    Session session, {
    required int userId,
    required CreateWorkspaceExportRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    final format = (request.format?.trim().isNotEmpty == true)
        ? request.format!.trim()
        : 'json';
    if (format != 'json') {
      throw DomainException('Only json format is supported', statusCode: 400);
    }
    final summaryJson = jsonEncode({
      'type': 'export',
      'includeCollections': request.includeCollections ?? true,
      'includeEnvironments': request.includeEnvironments ?? true,
      'status': 'completed',
    });
    final row = await _repository.createJob(
      session,
      workspaceId: request.workspaceId,
      type: 'export',
      format: format,
      summaryJson: summaryJson,
      createdByUserId: userId,
    );
    return _toModel(row);
  }

  Future<ImportExportJobModel> createImportJob(
    Session session, {
    required int userId,
    required CreateWorkspaceImportRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    if (request.payloadJson.trim().isEmpty) {
      throw DomainException('Import payload is required', statusCode: 400);
    }
    final format = (request.format?.trim().isNotEmpty == true)
        ? request.format!.trim()
        : 'json';
    if (format != 'json') {
      throw DomainException('Only json format is supported', statusCode: 400);
    }

    try {
      jsonDecode(request.payloadJson);
    } catch (_) {
      throw DomainException(
        'Import payload must be valid json',
        statusCode: 400,
      );
    }

    final summaryJson = jsonEncode({
      'type': 'import',
      'status': 'completed',
      'bytes': request.payloadJson.length,
    });
    final row = await _repository.createJob(
      session,
      workspaceId: request.workspaceId,
      type: 'import',
      format: format,
      summaryJson: summaryJson,
      createdByUserId: userId,
    );
    return _toModel(row);
  }

  ImportExportJobModel _toModel(StoredImportExportJob row) {
    return ImportExportJobModel(
      id: row.id!,
      workspaceId: row.workspaceId,
      type: row.type,
      status: row.status,
      format: row.format,
      summaryJson: row.summaryJson,
      createdByUserId: row.createdByUserId,
      createdAt: row.createdAt,
      completedAt: row.completedAt,
    );
  }
}

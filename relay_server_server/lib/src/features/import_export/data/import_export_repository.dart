import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/generated/protocol.dart';

class ImportExportRepository {
  const ImportExportRepository();

  Future<List<StoredImportExportJob>> listByWorkspace(
    Session session,
    int workspaceId,
  ) {
    return StoredImportExportJob.db.find(
      session,
      where: (t) => t.workspaceId.equals(workspaceId),
      orderBy: (t) => t.id,
      orderDescending: true,
    );
  }

  Future<StoredImportExportJob?> findById(Session session, int jobId) {
    return StoredImportExportJob.db.findById(session, jobId);
  }

  Future<StoredImportExportJob> createJob(
    Session session, {
    required int workspaceId,
    required String type,
    required String format,
    required String summaryJson,
    required int createdByUserId,
  }) {
    final now = DateTime.now().toUtc();
    return StoredImportExportJob.db.insertRow(
      session,
      StoredImportExportJob(
        workspaceId: workspaceId,
        type: type,
        status: 'completed',
        format: format,
        summaryJson: summaryJson,
        createdByUserId: createdByUserId,
        createdAt: now,
        completedAt: now,
      ),
    );
  }
}

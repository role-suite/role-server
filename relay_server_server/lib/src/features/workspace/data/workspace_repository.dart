import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/features/workspace/data/in_memory_workspace_store.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

/// Persists workspace per user in the database ([StoredWorkspace] table),
/// or in-memory when [InMemoryWorkspaceStore.useInMemory] is true (no Postgres).
/// Used by [WorkspaceEndpoint] and the /workspace REST route.
abstract final class WorkspaceRepository {
  WorkspaceRepository._();

  /// Returns the stored workspace for [userId], or null if none.
  static Future<WorkspaceBundle?> getByUserId(Session session, int userId) async {
    if (InMemoryWorkspaceStore.useInMemory) {
      return InMemoryWorkspaceStore.getByUserId(userId);
    }
    final row = await StoredWorkspace.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    return row?.data;
  }

  /// Overwrites the stored workspace for [userId]. Inserts or updates the row.
  static Future<void> setForUserId(
    Session session,
    int userId,
    WorkspaceBundle bundle,
  ) async {
    if (InMemoryWorkspaceStore.useInMemory) {
      await InMemoryWorkspaceStore.setForUserId(userId, bundle);
      return;
    }
    final now = DateTime.now().toUtc();
    final existing = await StoredWorkspace.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    if (existing != null) {
      existing.data = bundle;
      existing.updatedAt = now;
      await StoredWorkspace.db.updateRow(session, existing);
    } else {
      await StoredWorkspace.db.insertRow(
        session,
        StoredWorkspace(userId: userId, data: bundle, updatedAt: now),
      );
    }
  }
}

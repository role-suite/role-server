import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/generated/protocol.dart';

class WorkspaceAccessRepository {
  const WorkspaceAccessRepository();

  Future<StoredWorkspaceMembership?> findMembership(
    Session session, {
    required int userId,
    required int workspaceId,
  }) {
    return StoredWorkspaceMembership.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.workspaceId.equals(workspaceId),
    );
  }
}

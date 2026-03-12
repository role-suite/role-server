import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/session_helper.dart';
import 'package:relay_server_server/src/features/workspace/data/workspace_repository.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

/// Endpoint for syncing Röle workspace (collections + requests + environments).
/// Delegates storage to [WorkspaceRepository] (database) and user identity to [SessionHelper].
class WorkspaceEndpoint extends Endpoint {
  /// Pull the current user's workspace from the server.
  Future<WorkspaceBundle?> pullWorkspace(Session session) async {
    final userId = SessionHelper.getUserId(session);
    return WorkspaceRepository.getByUserId(session, userId);
  }

  /// Push (overwrite) the current user's workspace on the server.
  Future<void> pushWorkspace(Session session, WorkspaceBundle bundle) async {
    final userId = SessionHelper.getUserId(session);
    await WorkspaceRepository.setForUserId(session, userId, bundle);
  }
}

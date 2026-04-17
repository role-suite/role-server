import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/guards/workspace_guard.dart';
import 'package:relay_server_server/src/features/workspaces/data/workspace_access_repository.dart';

class WorkspaceAccessService {
  WorkspaceAccessService({WorkspaceAccessRepository? repository})
    : _repository = repository ?? const WorkspaceAccessRepository();

  final WorkspaceAccessRepository _repository;

  Future<String> requireMembershipRole(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {
    final membership = await _repository.findMembership(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    WorkspaceGuard.requireMembership(membership != null);
    return membership!.role;
  }

  Future<void> requireWriterRole(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {
    final role = await requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    WorkspaceGuard.requireWriterRole(role);
  }

  Future<void> requireOwnerRole(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {
    final role = await requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    WorkspaceGuard.requireOwnerRole(role);
  }
}

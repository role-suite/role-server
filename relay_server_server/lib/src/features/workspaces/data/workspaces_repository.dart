import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/generated/protocol.dart';

class WorkspacesRepository {
  const WorkspacesRepository();

  Future<List<StoredWorkspaceMembership>> listMembershipsByUser(
    Session session,
    int userId,
  ) {
    return StoredWorkspaceMembership.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
  }

  Future<StoredWorkspaceMembership?> findMembership(
    Session session, {
    required int workspaceId,
    required int userId,
  }) {
    return StoredWorkspaceMembership.db.findFirstRow(
      session,
      where: (t) => t.workspaceId.equals(workspaceId) & t.userId.equals(userId),
    );
  }

  Future<List<StoredWorkspace>> listWorkspacesByIds(
    Session session,
    List<int> workspaceIds,
  ) {
    if (workspaceIds.isEmpty) return Future.value(const <StoredWorkspace>[]);
    return StoredWorkspace.db.find(
      session,
      where: (t) => t.id.inSet(workspaceIds.toSet()),
    );
  }

  Future<StoredWorkspace?> findWorkspaceById(Session session, int workspaceId) {
    return StoredWorkspace.db.findById(session, workspaceId);
  }

  Future<StoredWorkspace> createWorkspace(
    Session session, {
    required String name,
    required String slug,
    required String type,
    required int createdByUserId,
  }) async {
    final now = DateTime.now().toUtc();
    return StoredWorkspace.db.insertRow(
      session,
      StoredWorkspace(
        name: name,
        slug: slug,
        type: type,
        createdByUserId: createdByUserId,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<StoredWorkspaceMembership> createMembership(
    Session session, {
    required int workspaceId,
    required int userId,
    required String role,
  }) {
    final now = DateTime.now().toUtc();
    return StoredWorkspaceMembership.db.insertRow(
      session,
      StoredWorkspaceMembership(
        workspaceId: workspaceId,
        userId: userId,
        role: role,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<List<StoredWorkspaceMembership>> listMembershipsByWorkspace(
    Session session,
    int workspaceId,
  ) {
    return StoredWorkspaceMembership.db.find(
      session,
      where: (t) => t.workspaceId.equals(workspaceId),
    );
  }

  Future<StoredAuthUser?> findUserById(Session session, int userId) {
    return StoredAuthUser.db.findById(session, userId);
  }

  Future<StoredAuthUser?> findUserByEmail(Session session, String email) {
    return StoredAuthUser.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );
  }

  Future<void> updateMembershipRole(
    Session session, {
    required int workspaceId,
    required int userId,
    required String role,
  }) async {
    final row = await findMembership(
      session,
      workspaceId: workspaceId,
      userId: userId,
    );
    if (row == null) return;
    row.role = role;
    row.updatedAt = DateTime.now().toUtc();
    await StoredWorkspaceMembership.db.updateRow(session, row);
  }

  Future<void> deleteMembership(
    Session session, {
    required int workspaceId,
    required int userId,
  }) async {
    final row = await findMembership(
      session,
      workspaceId: workspaceId,
      userId: userId,
    );
    if (row == null) return;
    await StoredWorkspaceMembership.db.deleteRow(session, row);
  }

  Future<int> countOwners(Session session, int workspaceId) async {
    return StoredWorkspaceMembership.db.count(
      session,
      where: (t) => t.workspaceId.equals(workspaceId) & t.role.equals('owner'),
    );
  }

  Future<StoredWorkspaceInvitation> createInvitation(
    Session session, {
    required int workspaceId,
    required String email,
    required String role,
    required String invitationTokenHash,
    required int createdByUserId,
    required DateTime expiresAt,
  }) {
    return StoredWorkspaceInvitation.db.insertRow(
      session,
      StoredWorkspaceInvitation(
        workspaceId: workspaceId,
        email: email,
        role: role,
        status: 'pending',
        invitationTokenHash: invitationTokenHash,
        createdByUserId: createdByUserId,
        expiresAt: expiresAt,
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<StoredWorkspaceInvitation?> findInvitationByTokenHash(
    Session session,
    String tokenHash,
  ) {
    return StoredWorkspaceInvitation.db.findFirstRow(
      session,
      where: (t) => t.invitationTokenHash.equals(tokenHash),
    );
  }

  Future<void> markInvitationAccepted(
    Session session,
    StoredWorkspaceInvitation invitation,
  ) async {
    invitation.status = 'accepted';
    invitation.acceptedAt = DateTime.now().toUtc();
    await StoredWorkspaceInvitation.db.updateRow(session, invitation);
  }

  Future<void> updateWorkspaceTypeAndName(
    Session session, {
    required int workspaceId,
    required String type,
    required String name,
  }) async {
    final workspace = await StoredWorkspace.db.findById(session, workspaceId);
    if (workspace == null) return;
    workspace.type = type;
    workspace.name = name;
    workspace.updatedAt = DateTime.now().toUtc();
    await StoredWorkspace.db.updateRow(session, workspace);
  }

  Future<StoredWorkspaceEvent> createEvent(
    Session session, {
    required int workspaceId,
    required int actorUserId,
    required String entity,
    required String action,
    int? entityId,
    String? payloadJson,
  }) {
    return StoredWorkspaceEvent.db.insertRow(
      session,
      StoredWorkspaceEvent(
        workspaceId: workspaceId,
        actorUserId: actorUserId,
        entity: entity,
        action: action,
        entityId: entityId,
        payloadJson: payloadJson,
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }

  Future<List<StoredWorkspaceEvent>> listEvents(
    Session session, {
    required int workspaceId,
    required int limit,
  }) {
    return StoredWorkspaceEvent.db.find(
      session,
      where: (t) => t.workspaceId.equals(workspaceId),
      orderBy: (t) => t.id,
      limit: limit,
    );
  }
}

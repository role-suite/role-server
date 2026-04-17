import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/workspaces/data/workspaces_repository.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

class WorkspacesService {
  WorkspacesService({WorkspacesRepository? repository})
    : _repository = repository ?? const WorkspacesRepository();

  final WorkspacesRepository _repository;

  Future<List<WorkspaceModel>> listForUser(Session session, int userId) async {
    final memberships = await _repository.listMembershipsByUser(
      session,
      userId,
    );
    if (memberships.isEmpty) return const <WorkspaceModel>[];
    final byWorkspace = {for (final m in memberships) m.workspaceId: m};
    final workspaces = await _repository.listWorkspacesByIds(
      session,
      byWorkspace.keys.toList(),
    );
    return workspaces
        .where((w) => w.id != null && byWorkspace.containsKey(w.id!))
        .map((w) {
          final membership = byWorkspace[w.id!]!;
          return WorkspaceModel(
            id: w.id!,
            name: w.name,
            slug: w.slug,
            type: w.type,
            role: membership.role,
            createdAt: w.createdAt,
            updatedAt: w.updatedAt,
          );
        })
        .toList();
  }

  Future<WorkspaceModel> getByIdForUser(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {
    final membership = await _repository.findMembership(
      session,
      workspaceId: workspaceId,
      userId: userId,
    );
    if (membership == null) {
      throw DomainException('Workspace access denied', statusCode: 403);
    }
    final workspace = await _repository.findWorkspaceById(session, workspaceId);
    if (workspace == null) {
      throw DomainException('Workspace not found', statusCode: 404);
    }
    return WorkspaceModel(
      id: workspace.id!,
      name: workspace.name,
      slug: workspace.slug,
      type: workspace.type,
      role: membership.role,
      createdAt: workspace.createdAt,
      updatedAt: workspace.updatedAt,
    );
  }

  Future<WorkspaceModel> createForUser(
    Session session, {
    required int userId,
    required CreateWorkspaceRequest request,
  }) async {
    final name = request.name.trim();
    if (name.isEmpty) {
      throw DomainException('Workspace name is required', statusCode: 400);
    }
    final workspace = await _repository.createWorkspace(
      session,
      name: name,
      slug: _slugify(name),
      type: (request.type ?? 'personal').trim(),
      createdByUserId: userId,
    );
    await _repository.createMembership(
      session,
      workspaceId: workspace.id!,
      userId: userId,
      role: 'owner',
    );
    await _repository.createEvent(
      session,
      workspaceId: workspace.id!,
      actorUserId: userId,
      entity: 'workspace',
      action: 'created',
      entityId: workspace.id,
      payloadJson: jsonEncode({'name': workspace.name}),
    );

    return WorkspaceModel(
      id: workspace.id!,
      name: workspace.name,
      slug: workspace.slug,
      type: workspace.type,
      role: 'owner',
      createdAt: workspace.createdAt,
      updatedAt: workspace.updatedAt,
    );
  }

  Future<List<WorkspaceMemberModel>> listMembers(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {
    await _requireMembership(session, userId: userId, workspaceId: workspaceId);
    final memberships = await _repository.listMembershipsByWorkspace(
      session,
      workspaceId,
    );
    final out = <WorkspaceMemberModel>[];
    for (final m in memberships) {
      final user = await _repository.findUserById(session, m.userId);
      if (user == null) continue;
      out.add(
        WorkspaceMemberModel(
          userId: user.id!,
          name: user.name,
          email: user.email,
          role: m.role,
          joinedAt: m.createdAt,
        ),
      );
    }
    return out;
  }

  Future<WorkspaceInvitationIssueModel> createInvitation(
    Session session, {
    required int actorUserId,
    required CreateWorkspaceInvitationRequest request,
  }) async {
    await _requireOwner(
      session,
      userId: actorUserId,
      workspaceId: request.workspaceId,
    );
    final email = request.email.trim().toLowerCase();
    if (email.isEmpty) {
      throw DomainException('Invitation email is required', statusCode: 400);
    }
    final role = _normalizeRole(request.role);
    final invitationToken = _randomToken();
    final invitation = await _repository.createInvitation(
      session,
      workspaceId: request.workspaceId,
      email: email,
      role: role,
      invitationTokenHash: _hash(invitationToken),
      createdByUserId: actorUserId,
      expiresAt: DateTime.now().toUtc().add(const Duration(days: 7)),
    );

    await _repository.createEvent(
      session,
      workspaceId: request.workspaceId,
      actorUserId: actorUserId,
      entity: 'workspace_invitation',
      action: 'created',
      entityId: invitation.id,
      payloadJson: jsonEncode({'email': email, 'role': role}),
    );

    return WorkspaceInvitationIssueModel(
      invitation: _toInvitationModel(invitation),
      invitationToken: invitationToken,
    );
  }

  Future<WorkspaceModel> acceptInvitation(
    Session session, {
    required int userId,
    required AcceptWorkspaceInvitationRequest request,
  }) async {
    final invitation = await _repository.findInvitationByTokenHash(
      session,
      _hash(request.invitationToken),
    );
    if (invitation == null || invitation.status != 'pending') {
      throw DomainException('Invitation is invalid', statusCode: 404);
    }
    if (invitation.expiresAt.isBefore(DateTime.now().toUtc())) {
      throw DomainException('Invitation has expired', statusCode: 400);
    }

    final user = await _repository.findUserById(session, userId);
    if (user == null) {
      throw DomainException('Authenticated user not found', statusCode: 404);
    }
    if (user.email.toLowerCase() != invitation.email.toLowerCase()) {
      throw DomainException(
        'Invitation email does not match authenticated user',
        statusCode: 403,
      );
    }

    final existing = await _repository.findMembership(
      session,
      workspaceId: invitation.workspaceId,
      userId: userId,
    );
    if (existing == null) {
      await _repository.createMembership(
        session,
        workspaceId: invitation.workspaceId,
        userId: userId,
        role: invitation.role,
      );
    }

    await _repository.markInvitationAccepted(session, invitation);
    await _repository.createEvent(
      session,
      workspaceId: invitation.workspaceId,
      actorUserId: userId,
      entity: 'workspace_member',
      action: 'joined',
      entityId: userId,
      payloadJson: jsonEncode({'role': invitation.role}),
    );

    return getByIdForUser(
      session,
      userId: userId,
      workspaceId: invitation.workspaceId,
    );
  }

  Future<WorkspaceMemberModel> updateMemberRole(
    Session session, {
    required int actorUserId,
    required UpdateWorkspaceMemberRoleRequest request,
  }) async {
    await _requireOwner(
      session,
      userId: actorUserId,
      workspaceId: request.workspaceId,
    );
    final targetMembership = await _repository.findMembership(
      session,
      workspaceId: request.workspaceId,
      userId: request.memberUserId,
    );
    if (targetMembership == null) {
      throw DomainException('Workspace member not found', statusCode: 404);
    }
    if (targetMembership.role == 'owner') {
      throw DomainException('Owner role cannot be changed', statusCode: 400);
    }
    final role = _normalizeRole(request.role);
    await _repository.updateMembershipRole(
      session,
      workspaceId: request.workspaceId,
      userId: request.memberUserId,
      role: role,
    );

    final user = await _repository.findUserById(session, request.memberUserId);
    if (user == null) {
      throw DomainException('User not found', statusCode: 404);
    }

    await _repository.createEvent(
      session,
      workspaceId: request.workspaceId,
      actorUserId: actorUserId,
      entity: 'workspace_member',
      action: 'role_updated',
      entityId: request.memberUserId,
      payloadJson: jsonEncode({'role': role}),
    );

    return WorkspaceMemberModel(
      userId: user.id!,
      name: user.name,
      email: user.email,
      role: role,
      joinedAt: targetMembership.createdAt,
    );
  }

  Future<void> removeMember(
    Session session, {
    required int actorUserId,
    required int workspaceId,
    required int memberUserId,
  }) async {
    await _requireOwner(session, userId: actorUserId, workspaceId: workspaceId);
    if (memberUserId == actorUserId) {
      throw DomainException(
        'Use leave endpoint to remove yourself',
        statusCode: 400,
      );
    }
    final targetMembership = await _repository.findMembership(
      session,
      workspaceId: workspaceId,
      userId: memberUserId,
    );
    if (targetMembership == null) {
      throw DomainException('Workspace member not found', statusCode: 404);
    }
    if (targetMembership.role == 'owner') {
      final ownerCount = await _repository.countOwners(session, workspaceId);
      if (ownerCount <= 1) {
        throw DomainException(
          'Cannot remove the last workspace owner',
          statusCode: 400,
        );
      }
    }
    await _repository.deleteMembership(
      session,
      workspaceId: workspaceId,
      userId: memberUserId,
    );
    await _repository.createEvent(
      session,
      workspaceId: workspaceId,
      actorUserId: actorUserId,
      entity: 'workspace_member',
      action: 'removed',
      entityId: memberUserId,
    );
  }

  Future<void> leaveWorkspace(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {
    final membership = await _requireMembership(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    if (membership.role == 'owner') {
      final ownerCount = await _repository.countOwners(session, workspaceId);
      if (ownerCount <= 1) {
        throw DomainException(
          'Cannot leave as the last workspace owner',
          statusCode: 400,
        );
      }
    }
    await _repository.deleteMembership(
      session,
      workspaceId: workspaceId,
      userId: userId,
    );
    await _repository.createEvent(
      session,
      workspaceId: workspaceId,
      actorUserId: userId,
      entity: 'workspace_member',
      action: 'left',
      entityId: userId,
    );
  }

  Future<WorkspaceModel> convertToTeam(
    Session session, {
    required int userId,
    required ConvertWorkspaceToTeamRequest request,
  }) async {
    await _requireOwner(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    final workspace = await _repository.findWorkspaceById(
      session,
      request.workspaceId,
    );
    if (workspace == null) {
      throw DomainException('Workspace not found', statusCode: 404);
    }
    if (workspace.type == 'team') {
      throw DomainException('Workspace is already a team', statusCode: 400);
    }

    final nextName = request.name?.trim();
    final name = (nextName == null || nextName.isEmpty)
        ? workspace.name
        : nextName;
    await _repository.updateWorkspaceTypeAndName(
      session,
      workspaceId: workspace.id!,
      type: 'team',
      name: name,
    );
    await _repository.createEvent(
      session,
      workspaceId: workspace.id!,
      actorUserId: userId,
      entity: 'workspace',
      action: 'converted_to_team',
      entityId: workspace.id,
      payloadJson: jsonEncode({'previousType': workspace.type, 'name': name}),
    );

    return getByIdForUser(
      session,
      userId: userId,
      workspaceId: workspace.id!,
    );
  }

  Future<List<WorkspaceEventModel>> listUpdates(
    Session session, {
    required int userId,
    required WorkspaceUpdatesQuery query,
  }) async {
    await _requireMembership(
      session,
      userId: userId,
      workspaceId: query.workspaceId,
    );
    final limit = query.limit == null ? 50 : query.limit!.clamp(1, 200);
    final events = await _repository.listEvents(
      session,
      workspaceId: query.workspaceId,
      limit: limit,
    );

    return events
        .where(
          (e) =>
              query.sinceId == null || (e.id != null && e.id! > query.sinceId!),
        )
        .map(
          (e) => WorkspaceEventModel(
            id: e.id!,
            workspaceId: e.workspaceId,
            actorUserId: e.actorUserId,
            entity: e.entity,
            action: e.action,
            entityId: e.entityId,
            payloadJson: e.payloadJson,
            createdAt: e.createdAt,
          ),
        )
        .toList();
  }

  Future<StoredWorkspaceMembership> _requireMembership(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {
    final membership = await _repository.findMembership(
      session,
      workspaceId: workspaceId,
      userId: userId,
    );
    if (membership == null) {
      throw DomainException('Workspace access denied', statusCode: 403);
    }
    return membership;
  }

  Future<void> _requireOwner(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {
    final membership = await _requireMembership(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    if (membership.role != 'owner') {
      throw DomainException('Workspace owner role required', statusCode: 403);
    }
  }

  WorkspaceInvitationModel _toInvitationModel(
    StoredWorkspaceInvitation invitation,
  ) {
    return WorkspaceInvitationModel(
      id: invitation.id!,
      workspaceId: invitation.workspaceId,
      email: invitation.email,
      role: invitation.role,
      status: invitation.status,
      expiresAt: invitation.expiresAt,
      createdAt: invitation.createdAt,
      acceptedAt: invitation.acceptedAt,
    );
  }

  String _normalizeRole(String role) {
    final value = role.trim();
    if (value != 'owner' && value != 'admin' && value != 'member') {
      throw DomainException('Invalid workspace role', statusCode: 400);
    }
    return value;
  }

  String _slugify(String value) {
    final lower = value.trim().toLowerCase();
    final dashed = lower.replaceAll(RegExp(r'[^a-z0-9]+'), '-');
    return dashed
        .replaceAll(RegExp(r'-+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');
  }

  String _randomToken() {
    final random = Random.secure();
    final bytes = List<int>.generate(32, (_) => random.nextInt(256));
    return base64UrlEncode(bytes);
  }

  String _hash(String token) {
    return sha256.convert(utf8.encode(token)).toString();
  }
}

import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/guards/auth_guard.dart';
import 'package:relay_server_server/src/core/logging/endpoint_action_runner.dart';
import 'package:relay_server_server/src/features/environments/services/environments_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

class EnvironmentsEndpoint extends Endpoint {
  EnvironmentsEndpoint({EnvironmentsService? service})
    : _service = service ?? EnvironmentsService();

  final EnvironmentsService _service;

  Future<List<EnvironmentModel>> list(Session session, int workspaceId) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'environments',
      action: 'list',
      context: {'userId': userId, 'workspaceId': workspaceId},
      operation: () => _service.listForWorkspace(
        session,
        userId: userId,
        workspaceId: workspaceId,
      ),
    );
  }

  Future<EnvironmentModel> get(
    Session session,
    int workspaceId,
    int environmentId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'environments',
      action: 'get',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'environmentId': environmentId,
      },
      operation: () => _service.getById(
        session,
        userId: userId,
        workspaceId: workspaceId,
        environmentId: environmentId,
      ),
    );
  }

  Future<EnvironmentModel> create(
    Session session,
    CreateEnvironmentRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'environments',
      action: 'create',
      context: {'userId': userId, 'workspaceId': request.workspaceId},
      operation: () =>
          _service.create(session, userId: userId, request: request),
    );
  }

  Future<EnvironmentModel> update(
    Session session,
    UpdateEnvironmentRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'environments',
      action: 'update',
      context: {
        'userId': userId,
        'workspaceId': request.workspaceId,
        'environmentId': request.environmentId,
      },
      operation: () =>
          _service.update(session, userId: userId, request: request),
    );
  }

  Future<void> remove(Session session, int workspaceId, int environmentId) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'environments',
      action: 'remove',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'environmentId': environmentId,
      },
      operation: () => _service.remove(
        session,
        userId: userId,
        workspaceId: workspaceId,
        environmentId: environmentId,
      ),
    );
  }

  Future<List<EnvironmentVariableModel>> listVariables(
    Session session,
    int workspaceId,
    int environmentId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'environments',
      action: 'listVariables',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'environmentId': environmentId,
      },
      operation: () => _service.listVariables(
        session,
        userId: userId,
        workspaceId: workspaceId,
        environmentId: environmentId,
      ),
    );
  }

  Future<EnvironmentVariableModel> createVariable(
    Session session,
    CreateEnvironmentVariableRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'environments',
      action: 'createVariable',
      context: {
        'userId': userId,
        'workspaceId': request.workspaceId,
        'environmentId': request.environmentId,
      },
      operation: () =>
          _service.createVariable(session, userId: userId, request: request),
    );
  }

  Future<EnvironmentVariableModel> updateVariable(
    Session session,
    UpdateEnvironmentVariableRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'environments',
      action: 'updateVariable',
      context: {
        'userId': userId,
        'workspaceId': request.workspaceId,
        'environmentId': request.environmentId,
        'variableId': request.variableId,
      },
      operation: () =>
          _service.updateVariable(session, userId: userId, request: request),
    );
  }

  Future<void> removeVariable(
    Session session,
    int workspaceId,
    int environmentId,
    int variableId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'environments',
      action: 'removeVariable',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'environmentId': environmentId,
        'variableId': variableId,
      },
      operation: () => _service.removeVariable(
        session,
        userId: userId,
        workspaceId: workspaceId,
        environmentId: environmentId,
        variableId: variableId,
      ),
    );
  }
}

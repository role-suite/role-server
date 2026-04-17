import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/environments/data/environments_repository.dart';
import 'package:relay_server_server/src/features/workspaces/services/workspace_access_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

class EnvironmentsService {
  EnvironmentsService({
    EnvironmentsRepository? repository,
    WorkspaceAccessService? workspaceAccessService,
  }) : _repository = repository ?? const EnvironmentsRepository(),
       _workspaceAccess = workspaceAccessService ?? WorkspaceAccessService();

  final EnvironmentsRepository _repository;
  final WorkspaceAccessService _workspaceAccess;

  Future<List<EnvironmentModel>> listForWorkspace(
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
    return rows.map(_toEnvironmentModel).toList();
  }

  Future<EnvironmentModel> getById(
    Session session, {
    required int userId,
    required int workspaceId,
    required int environmentId,
  }) async {
    await _workspaceAccess.requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    final environment = await _requireEnvironmentInWorkspace(
      session,
      workspaceId: workspaceId,
      environmentId: environmentId,
    );
    return _toEnvironmentModel(environment);
  }

  Future<EnvironmentModel> create(
    Session session, {
    required int userId,
    required CreateEnvironmentRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    final name = request.name.trim();
    if (name.isEmpty) {
      throw DomainException('Environment name is required', statusCode: 400);
    }
    final existing = await _repository.findByWorkspaceAndName(
      session,
      workspaceId: request.workspaceId,
      name: name,
    );
    if (existing != null) {
      throw DomainException('Environment name already exists', statusCode: 409);
    }
    final row = await _repository.createEnvironment(
      session,
      workspaceId: request.workspaceId,
      name: name,
      createdByUserId: userId,
    );
    return _toEnvironmentModel(row);
  }

  Future<EnvironmentModel> update(
    Session session, {
    required int userId,
    required UpdateEnvironmentRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    final environment = await _requireEnvironmentInWorkspace(
      session,
      workspaceId: request.workspaceId,
      environmentId: request.environmentId,
    );
    final name = request.name.trim();
    if (name.isEmpty) {
      throw DomainException('Environment name is required', statusCode: 400);
    }
    final existing = await _repository.findByWorkspaceAndName(
      session,
      workspaceId: request.workspaceId,
      name: name,
    );
    if (existing != null && existing.id != environment.id) {
      throw DomainException('Environment name already exists', statusCode: 409);
    }
    environment.name = name;
    await _repository.updateEnvironment(session, environment);
    return _toEnvironmentModel(environment);
  }

  Future<void> remove(
    Session session, {
    required int userId,
    required int workspaceId,
    required int environmentId,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    final environment = await _requireEnvironmentInWorkspace(
      session,
      workspaceId: workspaceId,
      environmentId: environmentId,
    );
    await _repository.deleteEnvironment(session, environment);
  }

  Future<List<EnvironmentVariableModel>> listVariables(
    Session session, {
    required int userId,
    required int workspaceId,
    required int environmentId,
  }) async {
    await _workspaceAccess.requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    await _requireEnvironmentInWorkspace(
      session,
      workspaceId: workspaceId,
      environmentId: environmentId,
    );
    final rows = await _repository.listVariables(session, environmentId);
    return rows.map(_toVariableModel).toList();
  }

  Future<EnvironmentVariableModel> createVariable(
    Session session, {
    required int userId,
    required CreateEnvironmentVariableRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    await _requireEnvironmentInWorkspace(
      session,
      workspaceId: request.workspaceId,
      environmentId: request.environmentId,
    );
    final key = request.key.trim();
    if (key.isEmpty) {
      throw DomainException(
        'Environment variable key is required',
        statusCode: 400,
      );
    }
    final existing = await _repository.findVariableByKey(
      session,
      environmentId: request.environmentId,
      key: key,
    );
    if (existing != null) {
      throw DomainException(
        'Environment variable key already exists',
        statusCode: 409,
      );
    }
    final row = await _repository.createVariable(
      session,
      environmentId: request.environmentId,
      key: key,
      value: request.value,
      enabled: request.enabled ?? true,
      isSecret: request.isSecret ?? false,
      position: request.position ?? 0,
      createdByUserId: userId,
    );
    return _toVariableModel(row);
  }

  Future<EnvironmentVariableModel> updateVariable(
    Session session, {
    required int userId,
    required UpdateEnvironmentVariableRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    await _requireEnvironmentInWorkspace(
      session,
      workspaceId: request.workspaceId,
      environmentId: request.environmentId,
    );
    final variable = await _repository.findVariableById(
      session,
      request.variableId,
    );
    if (variable == null || variable.environmentId != request.environmentId) {
      throw DomainException('Environment variable not found', statusCode: 404);
    }
    if (request.key != null) {
      final key = request.key!.trim();
      if (key.isEmpty) {
        throw DomainException(
          'Environment variable key cannot be empty',
          statusCode: 400,
        );
      }
      final existing = await _repository.findVariableByKey(
        session,
        environmentId: request.environmentId,
        key: key,
      );
      if (existing != null && existing.id != variable.id) {
        throw DomainException(
          'Environment variable key already exists',
          statusCode: 409,
        );
      }
      variable.key = key;
    }
    if (request.value != null) variable.value = request.value!;
    if (request.enabled != null) variable.enabled = request.enabled!;
    if (request.isSecret != null) variable.isSecret = request.isSecret!;
    if (request.position != null) variable.position = request.position!;
    await _repository.updateVariable(session, variable);
    return _toVariableModel(variable);
  }

  Future<void> removeVariable(
    Session session, {
    required int userId,
    required int workspaceId,
    required int environmentId,
    required int variableId,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    await _requireEnvironmentInWorkspace(
      session,
      workspaceId: workspaceId,
      environmentId: environmentId,
    );
    final variable = await _repository.findVariableById(session, variableId);
    if (variable == null || variable.environmentId != environmentId) {
      throw DomainException('Environment variable not found', statusCode: 404);
    }
    await _repository.deleteVariable(session, variable);
  }

  Future<StoredEnvironment> _requireEnvironmentInWorkspace(
    Session session, {
    required int workspaceId,
    required int environmentId,
  }) async {
    final environment = await _repository.findEnvironmentById(
      session,
      environmentId,
    );
    if (environment == null || environment.workspaceId != workspaceId) {
      throw DomainException('Environment not found', statusCode: 404);
    }
    return environment;
  }

  EnvironmentModel _toEnvironmentModel(StoredEnvironment row) {
    return EnvironmentModel(
      id: row.id!,
      workspaceId: row.workspaceId,
      name: row.name,
      createdByUserId: row.createdByUserId,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  EnvironmentVariableModel _toVariableModel(StoredEnvironmentVariable row) {
    return EnvironmentVariableModel(
      id: row.id!,
      environmentId: row.environmentId,
      key: row.key,
      value: row.value,
      enabled: row.enabled,
      isSecret: row.isSecret,
      position: row.position,
      createdByUserId: row.createdByUserId,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
}

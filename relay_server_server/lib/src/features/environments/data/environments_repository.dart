import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/generated/protocol.dart';

class EnvironmentsRepository {
  const EnvironmentsRepository();

  Future<List<StoredEnvironment>> listByWorkspace(
    Session session,
    int workspaceId,
  ) {
    return StoredEnvironment.db.find(
      session,
      where: (t) => t.workspaceId.equals(workspaceId),
      orderBy: (t) => t.id,
    );
  }

  Future<StoredEnvironment?> findEnvironmentById(
    Session session,
    int environmentId,
  ) {
    return StoredEnvironment.db.findById(session, environmentId);
  }

  Future<StoredEnvironment?> findByWorkspaceAndName(
    Session session, {
    required int workspaceId,
    required String name,
  }) {
    return StoredEnvironment.db.findFirstRow(
      session,
      where: (t) => t.workspaceId.equals(workspaceId) & t.name.equals(name),
    );
  }

  Future<StoredEnvironment> createEnvironment(
    Session session, {
    required int workspaceId,
    required String name,
    required int createdByUserId,
  }) {
    final now = DateTime.now().toUtc();
    return StoredEnvironment.db.insertRow(
      session,
      StoredEnvironment(
        workspaceId: workspaceId,
        name: name,
        createdByUserId: createdByUserId,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<void> updateEnvironment(
    Session session,
    StoredEnvironment environment,
  ) {
    environment.updatedAt = DateTime.now().toUtc();
    return StoredEnvironment.db.updateRow(session, environment);
  }

  Future<void> deleteEnvironment(
    Session session,
    StoredEnvironment environment,
  ) {
    return StoredEnvironment.db.deleteRow(session, environment);
  }

  Future<List<StoredEnvironmentVariable>> listVariables(
    Session session,
    int environmentId,
  ) {
    return StoredEnvironmentVariable.db.find(
      session,
      where: (t) => t.environmentId.equals(environmentId),
      orderBy: (t) => t.position,
    );
  }

  Future<StoredEnvironmentVariable?> findVariableById(
    Session session,
    int variableId,
  ) {
    return StoredEnvironmentVariable.db.findById(session, variableId);
  }

  Future<StoredEnvironmentVariable?> findVariableByKey(
    Session session, {
    required int environmentId,
    required String key,
  }) {
    return StoredEnvironmentVariable.db.findFirstRow(
      session,
      where: (t) => t.environmentId.equals(environmentId) & t.key.equals(key),
    );
  }

  Future<StoredEnvironmentVariable> createVariable(
    Session session, {
    required int environmentId,
    required String key,
    required String value,
    required bool enabled,
    required bool isSecret,
    required int position,
    required int createdByUserId,
  }) {
    final now = DateTime.now().toUtc();
    return StoredEnvironmentVariable.db.insertRow(
      session,
      StoredEnvironmentVariable(
        environmentId: environmentId,
        key: key,
        value: value,
        enabled: enabled,
        isSecret: isSecret,
        position: position,
        createdByUserId: createdByUserId,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<void> updateVariable(
    Session session,
    StoredEnvironmentVariable variable,
  ) {
    variable.updatedAt = DateTime.now().toUtc();
    return StoredEnvironmentVariable.db.updateRow(session, variable);
  }

  Future<void> deleteVariable(
    Session session,
    StoredEnvironmentVariable variable,
  ) {
    return StoredEnvironmentVariable.db.deleteRow(session, variable);
  }
}

import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/features/environments/data/in_memory_environment_store.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

/// CRUD for environments per user. Used by [EnvironmentsEndpoint].
/// Uses in-memory store when [InMemoryEnvironmentStore.useInMemory] is true (no Postgres).
abstract final class EnvironmentRepository {
  EnvironmentRepository._();

  static Future<List<EnvironmentModel>> listByUserId(
    Session session,
    int userId,
  ) async {
    if (InMemoryEnvironmentStore.useInMemory) {
      return InMemoryEnvironmentStore.listByUserId(userId);
    }
    final rows = await StoredEnvironment.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
    return rows
        .map((r) => EnvironmentModel(name: r.name, variables: r.variables))
        .toList();
  }

  static Future<EnvironmentModel?> getByName(
    Session session,
    int userId,
    String name,
  ) async {
    if (InMemoryEnvironmentStore.useInMemory) {
      return InMemoryEnvironmentStore.getByName(userId, name);
    }
    final row = await StoredEnvironment.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.name.equals(name),
    );
    if (row == null) return null;
    return EnvironmentModel(name: row.name, variables: row.variables);
  }

  static Future<void> create(
    Session session,
    int userId,
    EnvironmentModel environment,
  ) async {
    if (InMemoryEnvironmentStore.useInMemory) {
      await InMemoryEnvironmentStore.create(userId, environment);
      return;
    }
    await StoredEnvironment.db.insertRow(
      session,
      StoredEnvironment(
        userId: userId,
        name: environment.name,
        variables: environment.variables,
      ),
    );
  }

  static Future<void> update(
    Session session,
    int userId,
    EnvironmentModel environment,
  ) async {
    if (InMemoryEnvironmentStore.useInMemory) {
      await InMemoryEnvironmentStore.update(userId, environment);
      return;
    }
    final row = await StoredEnvironment.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.name.equals(environment.name),
    );
    if (row == null) return;
    row.variables = environment.variables;
    await StoredEnvironment.db.updateRow(session, row);
  }

  static Future<void> delete(
    Session session,
    int userId,
    String name,
  ) async {
    if (InMemoryEnvironmentStore.useInMemory) {
      await InMemoryEnvironmentStore.delete(userId, name);
      return;
    }
    final row = await StoredEnvironment.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.name.equals(name),
    );
    if (row != null) await StoredEnvironment.db.deleteRow(session, row);
  }
}

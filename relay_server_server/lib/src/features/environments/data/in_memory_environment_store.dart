import 'dart:io';

import 'package:relay_server_server/src/generated/protocol.dart';

/// In-memory environment storage when running without PostgreSQL (RELAY_USE_IN_MEMORY=1).
abstract final class InMemoryEnvironmentStore {
  InMemoryEnvironmentStore._();

  static bool get useInMemory {
    return Platform.environment['RELAY_USE_IN_MEMORY'] == '1' ||
        Platform.environment['RELAY_USE_IN_MEMORY'] == 'true';
  }

  /// userId -> list of EnvironmentModel (by name)
  static final Map<int, List<EnvironmentModel>> _byUser = {};

  static Future<List<EnvironmentModel>> listByUserId(int userId) async {
    final list = _byUser[userId] ?? [];
    return List.from(list);
  }

  static Future<EnvironmentModel?> getByName(int userId, String name) async {
    final list = _byUser[userId] ?? [];
    try {
      return list.firstWhere((e) => e.name == name);
    } catch (_) {
      return null;
    }
  }

  static Future<void> create(int userId, EnvironmentModel environment) async {
    final list = _byUser.putIfAbsent(userId, () => []);
    if (list.any((e) => e.name == environment.name)) return;
    list.add(environment);
  }

  static Future<void> update(int userId, EnvironmentModel environment) async {
    final list = _byUser[userId] ?? [];
    final i = list.indexWhere((e) => e.name == environment.name);
    if (i >= 0) {
      list[i] = environment;
    }
  }

  static Future<void> delete(int userId, String name) async {
    final list = _byUser[userId];
    if (list == null) return;
    list.removeWhere((e) => e.name == name);
  }
}

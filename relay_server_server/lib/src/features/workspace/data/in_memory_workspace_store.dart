import 'dart:io';

import 'package:relay_server_server/src/generated/protocol.dart';

/// In-memory workspace storage for running without PostgreSQL/Docker.
/// Data is lost when the server stops. Use when [useInMemory] is true
/// (set env RELAY_USE_IN_MEMORY=1).
abstract final class InMemoryWorkspaceStore {
  InMemoryWorkspaceStore._();

  static final Map<int, WorkspaceBundle> _store = {};

  /// Use in-memory storage when true (e.g. env RELAY_USE_IN_MEMORY=1).
  static bool get useInMemory {
    return Platform.environment['RELAY_USE_IN_MEMORY'] == '1' ||
        Platform.environment['RELAY_USE_IN_MEMORY'] == 'true';
  }

  static Future<WorkspaceBundle?> getByUserId(int userId) async {
    return _store[userId];
  }

  static Future<void> setForUserId(int userId, WorkspaceBundle bundle) async {
    _store[userId] = bundle;
  }
}

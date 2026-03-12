import 'dart:io';

import 'package:relay_server_server/src/generated/protocol.dart';

/// In-memory request storage when running without PostgreSQL (RELAY_USE_IN_MEMORY=1).
abstract final class InMemoryRequestStore {
  InMemoryRequestStore._();

  static bool get useInMemory {
    return Platform.environment['RELAY_USE_IN_MEMORY'] == '1' ||
        Platform.environment['RELAY_USE_IN_MEMORY'] == 'true';
  }

  /// userId -> list of ApiRequestModel (by request id)
  static final Map<int, List<ApiRequestModel>> _byUser = {};

  static Future<List<ApiRequestModel>> listByCollection(
    int userId,
    String collectionId,
  ) async {
    final list = _byUser[userId] ?? [];
    return list.where((r) => r.collectionId == collectionId).toList();
  }

  static Future<ApiRequestModel?> getById(int userId, String requestId) async {
    final list = _byUser[userId] ?? [];
    try {
      return list.firstWhere((r) => r.id == requestId);
    } catch (_) {
      return null;
    }
  }

  static Future<void> create(int userId, ApiRequestModel request) async {
    final list = _byUser.putIfAbsent(userId, () => []);
    list.removeWhere((r) => r.id == request.id);
    list.add(request);
  }

  static Future<void> update(int userId, ApiRequestModel request) async {
    final list = _byUser[userId] ?? [];
    final i = list.indexWhere((r) => r.id == request.id);
    if (i >= 0) {
      list[i] = request;
    }
  }

  static Future<void> delete(int userId, String requestId) async {
    final list = _byUser[userId];
    if (list == null) return;
    list.removeWhere((r) => r.id == requestId);
  }
}

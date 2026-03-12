import 'dart:io';

import 'package:relay_server_server/src/generated/protocol.dart';

/// In-memory collection storage when running without PostgreSQL (RELAY_USE_IN_MEMORY=1).
abstract final class InMemoryCollectionStore {
  InMemoryCollectionStore._();

  static bool get useInMemory {
    return Platform.environment['RELAY_USE_IN_MEMORY'] == '1' ||
        Platform.environment['RELAY_USE_IN_MEMORY'] == 'true';
  }

  /// userId -> list of CollectionModel (by collectionId)
  static final Map<int, List<CollectionModel>> _byUser = {};

  static Future<List<CollectionModel>> listByUserId(int userId) async {
    final list = _byUser[userId] ?? [];
    return List.from(list);
  }

  static Future<CollectionModel?> getById(int userId, String collectionId) async {
    final list = _byUser[userId] ?? [];
    try {
      return list.firstWhere((c) => c.id == collectionId);
    } catch (_) {
      return null;
    }
  }

  static Future<void> create(int userId, CollectionModel collection) async {
    final list = _byUser.putIfAbsent(userId, () => []);
    if (list.any((c) => c.id == collection.id)) return;
    list.add(collection);
  }

  static Future<void> update(int userId, CollectionModel collection) async {
    final list = _byUser[userId] ?? [];
    final i = list.indexWhere((c) => c.id == collection.id);
    if (i >= 0) {
      list[i] = collection;
    }
  }

  static Future<void> delete(int userId, String collectionId) async {
    final list = _byUser[userId];
    if (list == null) return;
    list.removeWhere((c) => c.id == collectionId);
  }
}

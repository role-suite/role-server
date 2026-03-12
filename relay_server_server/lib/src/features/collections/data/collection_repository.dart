import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/features/collections/data/in_memory_collection_store.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

/// CRUD for collections per user. Used by [CollectionsEndpoint].
/// Uses in-memory store when [InMemoryCollectionStore.useInMemory] is true (no Postgres).
abstract final class CollectionRepository {
  CollectionRepository._();

  static Future<List<CollectionModel>> listByUserId(
    Session session,
    int userId,
  ) async {
    if (InMemoryCollectionStore.useInMemory) {
      return InMemoryCollectionStore.listByUserId(userId);
    }
    final rows = await StoredCollection.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );
    return rows
        .map((r) => CollectionModel(
              id: r.collectionId,
              name: r.name,
              description: r.description,
              createdAt: r.createdAt,
              updatedAt: r.updatedAt,
            ))
        .toList();
  }

  static Future<CollectionModel?> getById(
    Session session,
    int userId,
    String collectionId,
  ) async {
    if (InMemoryCollectionStore.useInMemory) {
      return InMemoryCollectionStore.getById(userId, collectionId);
    }
    final row = await StoredCollection.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.collectionId.equals(collectionId),
    );
    if (row == null) return null;
    return CollectionModel(
      id: row.collectionId,
      name: row.name,
      description: row.description,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  static Future<void> create(
    Session session,
    int userId,
    CollectionModel collection,
  ) async {
    if (InMemoryCollectionStore.useInMemory) {
      await InMemoryCollectionStore.create(userId, collection);
      return;
    }
    await StoredCollection.db.insertRow(
      session,
      StoredCollection(
        userId: userId,
        collectionId: collection.id,
        name: collection.name,
        description: collection.description,
        createdAt: collection.createdAt,
        updatedAt: collection.updatedAt,
      ),
    );
  }

  static Future<void> update(
    Session session,
    int userId,
    CollectionModel collection,
  ) async {
    if (InMemoryCollectionStore.useInMemory) {
      await InMemoryCollectionStore.update(userId, collection);
      return;
    }
    final row = await StoredCollection.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.collectionId.equals(collection.id),
    );
    if (row == null) return;
    row.name = collection.name;
    row.description = collection.description;
    row.updatedAt = collection.updatedAt;
    await StoredCollection.db.updateRow(session, row);
  }

  static Future<void> delete(
    Session session,
    int userId,
    String collectionId,
  ) async {
    if (InMemoryCollectionStore.useInMemory) {
      await InMemoryCollectionStore.delete(userId, collectionId);
      return;
    }
    final row = await StoredCollection.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.collectionId.equals(collectionId),
    );
    if (row != null) await StoredCollection.db.deleteRow(session, row);
  }
}

import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/generated/protocol.dart';

class CollectionsRepository {
  const CollectionsRepository();

  Future<List<StoredCollection>> listByWorkspace(
    Session session,
    int workspaceId,
  ) {
    return StoredCollection.db.find(
      session,
      where: (t) => t.workspaceId.equals(workspaceId),
      orderBy: (t) => t.id,
    );
  }

  Future<StoredCollection?> findById(Session session, int collectionId) {
    return StoredCollection.db.findById(session, collectionId);
  }

  Future<StoredCollection> createCollection(
    Session session, {
    required int workspaceId,
    required String name,
    String? description,
    required int createdByUserId,
  }) {
    final now = DateTime.now().toUtc();
    return StoredCollection.db.insertRow(
      session,
      StoredCollection(
        workspaceId: workspaceId,
        name: name,
        description: description,
        createdByUserId: createdByUserId,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<void> updateCollection(
    Session session,
    StoredCollection collection,
  ) {
    collection.updatedAt = DateTime.now().toUtc();
    return StoredCollection.db.updateRow(session, collection);
  }

  Future<void> deleteCollection(Session session, StoredCollection collection) {
    return StoredCollection.db.deleteRow(session, collection);
  }

  Future<List<StoredCollectionFolder>> listFolders(
    Session session,
    int collectionId,
  ) {
    return StoredCollectionFolder.db.find(
      session,
      where: (t) => t.collectionId.equals(collectionId),
      orderBy: (t) => t.position,
    );
  }

  Future<StoredCollectionFolder?> findFolderById(
    Session session,
    int folderId,
  ) {
    return StoredCollectionFolder.db.findById(session, folderId);
  }

  Future<StoredCollectionFolder> createFolder(
    Session session, {
    required int collectionId,
    int? parentFolderId,
    required String name,
    required int position,
    required int createdByUserId,
  }) {
    final now = DateTime.now().toUtc();
    return StoredCollectionFolder.db.insertRow(
      session,
      StoredCollectionFolder(
        collectionId: collectionId,
        parentFolderId: parentFolderId,
        name: name,
        position: position,
        createdByUserId: createdByUserId,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<void> updateFolder(Session session, StoredCollectionFolder folder) {
    folder.updatedAt = DateTime.now().toUtc();
    return StoredCollectionFolder.db.updateRow(session, folder);
  }

  Future<void> deleteFolder(Session session, StoredCollectionFolder folder) {
    return StoredCollectionFolder.db.deleteRow(session, folder);
  }

  Future<List<StoredCollectionEndpoint>> listEndpoints(
    Session session,
    int collectionId,
  ) {
    return StoredCollectionEndpoint.db.find(
      session,
      where: (t) => t.collectionId.equals(collectionId),
      orderBy: (t) => t.position,
    );
  }

  Future<StoredCollectionEndpoint?> findEndpointById(
    Session session,
    int endpointId,
  ) {
    return StoredCollectionEndpoint.db.findById(session, endpointId);
  }

  Future<StoredCollectionEndpoint> createEndpoint(
    Session session, {
    required int collectionId,
    int? folderId,
    required String name,
    required String method,
    required String url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    required int position,
    required int createdByUserId,
  }) {
    final now = DateTime.now().toUtc();
    return StoredCollectionEndpoint.db.insertRow(
      session,
      StoredCollectionEndpoint(
        collectionId: collectionId,
        folderId: folderId,
        name: name,
        method: method,
        url: url,
        headersJson: headersJson,
        queryParamsJson: queryParamsJson,
        bodyJson: bodyJson,
        authJson: authJson,
        position: position,
        createdByUserId: createdByUserId,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<void> updateEndpoint(
    Session session,
    StoredCollectionEndpoint endpoint,
  ) {
    endpoint.updatedAt = DateTime.now().toUtc();
    return StoredCollectionEndpoint.db.updateRow(session, endpoint);
  }

  Future<void> deleteEndpoint(
    Session session,
    StoredCollectionEndpoint endpoint,
  ) {
    return StoredCollectionEndpoint.db.deleteRow(session, endpoint);
  }

  Future<List<StoredCollectionEndpointExample>> listEndpointExamples(
    Session session,
    int endpointId,
  ) {
    return StoredCollectionEndpointExample.db.find(
      session,
      where: (t) => t.endpointId.equals(endpointId),
      orderBy: (t) => t.position,
    );
  }

  Future<StoredCollectionEndpointExample?> findExampleById(
    Session session,
    int exampleId,
  ) {
    return StoredCollectionEndpointExample.db.findById(session, exampleId);
  }

  Future<StoredCollectionEndpointExample> createExample(
    Session session, {
    required int endpointId,
    required String name,
    required int statusCode,
    String? headersJson,
    String? body,
    required int position,
    required int createdByUserId,
  }) {
    final now = DateTime.now().toUtc();
    return StoredCollectionEndpointExample.db.insertRow(
      session,
      StoredCollectionEndpointExample(
        endpointId: endpointId,
        name: name,
        statusCode: statusCode,
        headersJson: headersJson,
        body: body,
        position: position,
        createdByUserId: createdByUserId,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<void> updateExample(
    Session session,
    StoredCollectionEndpointExample example,
  ) {
    example.updatedAt = DateTime.now().toUtc();
    return StoredCollectionEndpointExample.db.updateRow(session, example);
  }

  Future<void> deleteExample(
    Session session,
    StoredCollectionEndpointExample example,
  ) {
    return StoredCollectionEndpointExample.db.deleteRow(session, example);
  }
}

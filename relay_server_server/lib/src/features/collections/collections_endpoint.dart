import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/guards/auth_guard.dart';
import 'package:relay_server_server/src/core/logging/endpoint_action_runner.dart';
import 'package:relay_server_server/src/features/collections/services/collections_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

class CollectionsEndpoint extends Endpoint {
  CollectionsEndpoint({CollectionsService? service})
    : _service = service ?? CollectionsService();

  final CollectionsService _service;

  Future<List<CollectionModel>> list(Session session, int workspaceId) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'list',
      context: {'userId': userId, 'workspaceId': workspaceId},
      operation: () => _service.listForWorkspace(
        session,
        userId: userId,
        workspaceId: workspaceId,
      ),
    );
  }

  Future<CollectionModel> get(
    Session session,
    int workspaceId,
    int collectionId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'get',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'collectionId': collectionId,
      },
      operation: () => _service.getById(
        session,
        userId: userId,
        workspaceId: workspaceId,
        collectionId: collectionId,
      ),
    );
  }

  Future<CollectionModel> create(
    Session session,
    CreateCollectionRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'create',
      context: {'userId': userId, 'workspaceId': request.workspaceId},
      operation: () =>
          _service.create(session, userId: userId, request: request),
    );
  }

  Future<CollectionModel> update(
    Session session,
    UpdateCollectionRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'update',
      context: {
        'userId': userId,
        'workspaceId': request.workspaceId,
        'collectionId': request.collectionId,
      },
      operation: () =>
          _service.update(session, userId: userId, request: request),
    );
  }

  Future<void> remove(Session session, int workspaceId, int collectionId) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'remove',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'collectionId': collectionId,
      },
      operation: () => _service.remove(
        session,
        userId: userId,
        workspaceId: workspaceId,
        collectionId: collectionId,
      ),
    );
  }

  Future<List<CollectionFolderModel>> listFolders(
    Session session,
    int workspaceId,
    int collectionId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'listFolders',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'collectionId': collectionId,
      },
      operation: () => _service.listFolders(
        session,
        userId: userId,
        workspaceId: workspaceId,
        collectionId: collectionId,
      ),
    );
  }

  Future<CollectionFolderModel> createFolder(
    Session session,
    CreateCollectionFolderRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'createFolder',
      context: {
        'userId': userId,
        'workspaceId': request.workspaceId,
        'collectionId': request.collectionId,
      },
      operation: () =>
          _service.createFolder(session, userId: userId, request: request),
    );
  }

  Future<CollectionFolderModel> updateFolder(
    Session session,
    UpdateCollectionFolderRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'updateFolder',
      context: {
        'userId': userId,
        'workspaceId': request.workspaceId,
        'collectionId': request.collectionId,
        'folderId': request.folderId,
      },
      operation: () =>
          _service.updateFolder(session, userId: userId, request: request),
    );
  }

  Future<void> removeFolder(
    Session session,
    int workspaceId,
    int collectionId,
    int folderId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'removeFolder',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'collectionId': collectionId,
        'folderId': folderId,
      },
      operation: () => _service.removeFolder(
        session,
        userId: userId,
        workspaceId: workspaceId,
        collectionId: collectionId,
        folderId: folderId,
      ),
    );
  }

  Future<List<CollectionEndpointModel>> listEndpoints(
    Session session,
    int workspaceId,
    int collectionId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'listEndpoints',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'collectionId': collectionId,
      },
      operation: () => _service.listEndpoints(
        session,
        userId: userId,
        workspaceId: workspaceId,
        collectionId: collectionId,
      ),
    );
  }

  Future<CollectionEndpointModel> createEndpoint(
    Session session,
    CreateCollectionEndpointRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'createEndpoint',
      context: {
        'userId': userId,
        'workspaceId': request.workspaceId,
        'collectionId': request.collectionId,
      },
      operation: () =>
          _service.createEndpoint(session, userId: userId, request: request),
    );
  }

  Future<CollectionEndpointModel> updateEndpoint(
    Session session,
    UpdateCollectionEndpointRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'updateEndpoint',
      context: {
        'userId': userId,
        'workspaceId': request.workspaceId,
        'collectionId': request.collectionId,
        'endpointId': request.endpointId,
      },
      operation: () =>
          _service.updateEndpoint(session, userId: userId, request: request),
    );
  }

  Future<void> removeEndpoint(
    Session session,
    int workspaceId,
    int collectionId,
    int endpointId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'removeEndpoint',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'collectionId': collectionId,
        'endpointId': endpointId,
      },
      operation: () => _service.removeEndpoint(
        session,
        userId: userId,
        workspaceId: workspaceId,
        collectionId: collectionId,
        endpointId: endpointId,
      ),
    );
  }

  Future<List<CollectionEndpointExampleModel>> listEndpointExamples(
    Session session,
    int workspaceId,
    int collectionId,
    int endpointId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'listEndpointExamples',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'collectionId': collectionId,
        'endpointId': endpointId,
      },
      operation: () => _service.listEndpointExamples(
        session,
        userId: userId,
        workspaceId: workspaceId,
        collectionId: collectionId,
        endpointId: endpointId,
      ),
    );
  }

  Future<CollectionEndpointExampleModel> createEndpointExample(
    Session session,
    CreateCollectionEndpointExampleRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'createEndpointExample',
      context: {
        'userId': userId,
        'workspaceId': request.workspaceId,
        'collectionId': request.collectionId,
        'endpointId': request.endpointId,
      },
      operation: () => _service.createEndpointExample(
        session,
        userId: userId,
        request: request,
      ),
    );
  }

  Future<CollectionEndpointExampleModel> updateEndpointExample(
    Session session,
    UpdateCollectionEndpointExampleRequest request,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'updateEndpointExample',
      context: {
        'userId': userId,
        'workspaceId': request.workspaceId,
        'collectionId': request.collectionId,
        'endpointId': request.endpointId,
        'exampleId': request.exampleId,
      },
      operation: () => _service.updateEndpointExample(
        session,
        userId: userId,
        request: request,
      ),
    );
  }

  Future<void> removeEndpointExample(
    Session session,
    int workspaceId,
    int collectionId,
    int endpointId,
    int exampleId,
  ) {
    final userId = AuthGuard.requireUserId(session);
    return EndpointActionRunner.run(
      session,
      endpoint: 'collections',
      action: 'removeEndpointExample',
      context: {
        'userId': userId,
        'workspaceId': workspaceId,
        'collectionId': collectionId,
        'endpointId': endpointId,
        'exampleId': exampleId,
      },
      operation: () => _service.removeEndpointExample(
        session,
        userId: userId,
        workspaceId: workspaceId,
        collectionId: collectionId,
        endpointId: endpointId,
        exampleId: exampleId,
      ),
    );
  }
}

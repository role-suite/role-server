import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/collections/data/collections_repository.dart';
import 'package:relay_server_server/src/features/workspaces/services/workspace_access_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

class CollectionsService {
  CollectionsService({
    CollectionsRepository? repository,
    WorkspaceAccessService? workspaceAccessService,
  }) : _repository = repository ?? const CollectionsRepository(),
       _workspaceAccess = workspaceAccessService ?? WorkspaceAccessService();

  final CollectionsRepository _repository;
  final WorkspaceAccessService _workspaceAccess;

  Future<List<CollectionModel>> listForWorkspace(
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
    return rows.map(_toCollectionModel).toList();
  }

  Future<CollectionModel> getById(
    Session session, {
    required int userId,
    required int workspaceId,
    required int collectionId,
  }) async {
    await _workspaceAccess.requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    final collection = await _requireCollectionInWorkspace(
      session,
      workspaceId: workspaceId,
      collectionId: collectionId,
    );
    return _toCollectionModel(collection);
  }

  Future<CollectionModel> create(
    Session session, {
    required int userId,
    required CreateCollectionRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    if (request.name.trim().isEmpty) {
      throw DomainException('Collection name is required', statusCode: 400);
    }
    final row = await _repository.createCollection(
      session,
      workspaceId: request.workspaceId,
      name: request.name.trim(),
      description: request.description?.trim().isEmpty == true
          ? null
          : request.description,
      createdByUserId: userId,
    );
    return _toCollectionModel(row);
  }

  Future<CollectionModel> update(
    Session session, {
    required int userId,
    required UpdateCollectionRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    final collection = await _requireCollectionInWorkspace(
      session,
      workspaceId: request.workspaceId,
      collectionId: request.collectionId,
    );
    if (request.name != null) {
      final name = request.name!.trim();
      if (name.isEmpty) {
        throw DomainException(
          'Collection name cannot be empty',
          statusCode: 400,
        );
      }
      collection.name = name;
    }
    if (request.description != null) {
      collection.description = request.description;
    }
    await _repository.updateCollection(session, collection);
    return _toCollectionModel(collection);
  }

  Future<void> remove(
    Session session, {
    required int userId,
    required int workspaceId,
    required int collectionId,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    final collection = await _requireCollectionInWorkspace(
      session,
      workspaceId: workspaceId,
      collectionId: collectionId,
    );
    await _repository.deleteCollection(session, collection);
  }

  Future<List<CollectionFolderModel>> listFolders(
    Session session, {
    required int userId,
    required int workspaceId,
    required int collectionId,
  }) async {
    await _workspaceAccess.requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: workspaceId,
      collectionId: collectionId,
    );
    final rows = await _repository.listFolders(session, collectionId);
    return rows.map(_toFolderModel).toList();
  }

  Future<CollectionFolderModel> createFolder(
    Session session, {
    required int userId,
    required CreateCollectionFolderRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: request.workspaceId,
      collectionId: request.collectionId,
    );
    if (request.name.trim().isEmpty) {
      throw DomainException('Folder name is required', statusCode: 400);
    }
    if (request.parentFolderId != null) {
      final parent = await _repository.findFolderById(
        session,
        request.parentFolderId!,
      );
      if (parent == null || parent.collectionId != request.collectionId) {
        throw DomainException('Parent folder not found', statusCode: 404);
      }
    }
    final row = await _repository.createFolder(
      session,
      collectionId: request.collectionId,
      parentFolderId: request.parentFolderId,
      name: request.name.trim(),
      position: request.position ?? 0,
      createdByUserId: userId,
    );
    return _toFolderModel(row);
  }

  Future<CollectionFolderModel> updateFolder(
    Session session, {
    required int userId,
    required UpdateCollectionFolderRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: request.workspaceId,
      collectionId: request.collectionId,
    );
    final folder = await _repository.findFolderById(session, request.folderId);
    if (folder == null || folder.collectionId != request.collectionId) {
      throw DomainException('Collection folder not found', statusCode: 404);
    }
    if (request.parentFolderId != null) {
      if (request.parentFolderId == folder.id) {
        throw DomainException(
          'Folder cannot be its own parent',
          statusCode: 400,
        );
      }
      final parent = await _repository.findFolderById(
        session,
        request.parentFolderId!,
      );
      if (parent == null || parent.collectionId != request.collectionId) {
        throw DomainException('Parent folder not found', statusCode: 404);
      }
      folder.parentFolderId = request.parentFolderId;
    }
    if (request.name != null) {
      final name = request.name!.trim();
      if (name.isEmpty) {
        throw DomainException('Folder name cannot be empty', statusCode: 400);
      }
      folder.name = name;
    }
    if (request.position != null) folder.position = request.position!;
    await _repository.updateFolder(session, folder);
    return _toFolderModel(folder);
  }

  Future<void> removeFolder(
    Session session, {
    required int userId,
    required int workspaceId,
    required int collectionId,
    required int folderId,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: workspaceId,
      collectionId: collectionId,
    );
    final folder = await _repository.findFolderById(session, folderId);
    if (folder == null || folder.collectionId != collectionId) {
      throw DomainException('Collection folder not found', statusCode: 404);
    }
    await _repository.deleteFolder(session, folder);
  }

  Future<List<CollectionEndpointModel>> listEndpoints(
    Session session, {
    required int userId,
    required int workspaceId,
    required int collectionId,
  }) async {
    await _workspaceAccess.requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: workspaceId,
      collectionId: collectionId,
    );
    final rows = await _repository.listEndpoints(session, collectionId);
    return rows.map(_toEndpointModel).toList();
  }

  Future<CollectionEndpointModel> createEndpoint(
    Session session, {
    required int userId,
    required CreateCollectionEndpointRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: request.workspaceId,
      collectionId: request.collectionId,
    );
    if (request.name.trim().isEmpty || request.url.trim().isEmpty) {
      throw DomainException(
        'Endpoint name and url are required',
        statusCode: 400,
      );
    }
    final row = await _repository.createEndpoint(
      session,
      collectionId: request.collectionId,
      folderId: request.folderId,
      name: request.name.trim(),
      method: request.method.trim().toUpperCase(),
      url: request.url.trim(),
      headersJson: request.headersJson,
      queryParamsJson: request.queryParamsJson,
      bodyJson: request.bodyJson,
      authJson: request.authJson,
      position: request.position ?? 0,
      createdByUserId: userId,
    );
    return _toEndpointModel(row);
  }

  Future<CollectionEndpointModel> updateEndpoint(
    Session session, {
    required int userId,
    required UpdateCollectionEndpointRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: request.workspaceId,
      collectionId: request.collectionId,
    );
    final endpoint = await _repository.findEndpointById(
      session,
      request.endpointId,
    );
    if (endpoint == null || endpoint.collectionId != request.collectionId) {
      throw DomainException('Collection endpoint not found', statusCode: 404);
    }
    if (request.folderId != null) endpoint.folderId = request.folderId;
    if (request.name != null) endpoint.name = request.name!.trim();
    if (request.method != null) {
      endpoint.method = request.method!.trim().toUpperCase();
    }
    if (request.url != null) endpoint.url = request.url!.trim();
    if (request.headersJson != null) endpoint.headersJson = request.headersJson;
    if (request.queryParamsJson != null) {
      endpoint.queryParamsJson = request.queryParamsJson;
    }
    if (request.bodyJson != null) endpoint.bodyJson = request.bodyJson;
    if (request.authJson != null) endpoint.authJson = request.authJson;
    if (request.position != null) endpoint.position = request.position!;
    await _repository.updateEndpoint(session, endpoint);
    return _toEndpointModel(endpoint);
  }

  Future<void> removeEndpoint(
    Session session, {
    required int userId,
    required int workspaceId,
    required int collectionId,
    required int endpointId,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: workspaceId,
      collectionId: collectionId,
    );
    final endpoint = await _repository.findEndpointById(session, endpointId);
    if (endpoint == null || endpoint.collectionId != collectionId) {
      throw DomainException('Collection endpoint not found', statusCode: 404);
    }
    await _repository.deleteEndpoint(session, endpoint);
  }

  Future<List<CollectionEndpointExampleModel>> listEndpointExamples(
    Session session, {
    required int userId,
    required int workspaceId,
    required int collectionId,
    required int endpointId,
  }) async {
    await _workspaceAccess.requireMembershipRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: workspaceId,
      collectionId: collectionId,
    );
    final endpoint = await _repository.findEndpointById(session, endpointId);
    if (endpoint == null || endpoint.collectionId != collectionId) {
      throw DomainException('Collection endpoint not found', statusCode: 404);
    }
    final rows = await _repository.listEndpointExamples(session, endpointId);
    return rows.map(_toExampleModel).toList();
  }

  Future<CollectionEndpointExampleModel> createEndpointExample(
    Session session, {
    required int userId,
    required CreateCollectionEndpointExampleRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: request.workspaceId,
      collectionId: request.collectionId,
    );
    final endpoint = await _repository.findEndpointById(
      session,
      request.endpointId,
    );
    if (endpoint == null || endpoint.collectionId != request.collectionId) {
      throw DomainException('Collection endpoint not found', statusCode: 404);
    }
    if (request.name.trim().isEmpty) {
      throw DomainException('Example name is required', statusCode: 400);
    }
    final row = await _repository.createExample(
      session,
      endpointId: request.endpointId,
      name: request.name.trim(),
      statusCode: request.statusCode,
      headersJson: request.headersJson,
      body: request.body,
      position: request.position ?? 0,
      createdByUserId: userId,
    );
    return _toExampleModel(row);
  }

  Future<CollectionEndpointExampleModel> updateEndpointExample(
    Session session, {
    required int userId,
    required UpdateCollectionEndpointExampleRequest request,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: request.workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: request.workspaceId,
      collectionId: request.collectionId,
    );
    final endpoint = await _repository.findEndpointById(
      session,
      request.endpointId,
    );
    if (endpoint == null || endpoint.collectionId != request.collectionId) {
      throw DomainException('Collection endpoint not found', statusCode: 404);
    }
    final example = await _repository.findExampleById(
      session,
      request.exampleId,
    );
    if (example == null || example.endpointId != request.endpointId) {
      throw DomainException(
        'Collection endpoint example not found',
        statusCode: 404,
      );
    }
    if (request.name != null) example.name = request.name!.trim();
    if (request.statusCode != null) example.statusCode = request.statusCode!;
    if (request.headersJson != null) example.headersJson = request.headersJson;
    if (request.body != null) example.body = request.body;
    if (request.position != null) example.position = request.position!;
    await _repository.updateExample(session, example);
    return _toExampleModel(example);
  }

  Future<void> removeEndpointExample(
    Session session, {
    required int userId,
    required int workspaceId,
    required int collectionId,
    required int endpointId,
    required int exampleId,
  }) async {
    await _workspaceAccess.requireWriterRole(
      session,
      userId: userId,
      workspaceId: workspaceId,
    );
    await _requireCollectionInWorkspace(
      session,
      workspaceId: workspaceId,
      collectionId: collectionId,
    );
    final endpoint = await _repository.findEndpointById(session, endpointId);
    if (endpoint == null || endpoint.collectionId != collectionId) {
      throw DomainException('Collection endpoint not found', statusCode: 404);
    }
    final example = await _repository.findExampleById(session, exampleId);
    if (example == null || example.endpointId != endpointId) {
      throw DomainException(
        'Collection endpoint example not found',
        statusCode: 404,
      );
    }
    await _repository.deleteExample(session, example);
  }

  Future<StoredCollection> _requireCollectionInWorkspace(
    Session session, {
    required int workspaceId,
    required int collectionId,
  }) async {
    final collection = await _repository.findById(session, collectionId);
    if (collection == null || collection.workspaceId != workspaceId) {
      throw DomainException('Collection not found', statusCode: 404);
    }
    return collection;
  }

  CollectionModel _toCollectionModel(StoredCollection row) {
    return CollectionModel(
      id: row.id!,
      workspaceId: row.workspaceId,
      name: row.name,
      description: row.description,
      createdByUserId: row.createdByUserId,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  CollectionFolderModel _toFolderModel(StoredCollectionFolder row) {
    return CollectionFolderModel(
      id: row.id!,
      collectionId: row.collectionId,
      parentFolderId: row.parentFolderId,
      name: row.name,
      position: row.position,
      createdByUserId: row.createdByUserId,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  CollectionEndpointModel _toEndpointModel(StoredCollectionEndpoint row) {
    return CollectionEndpointModel(
      id: row.id!,
      collectionId: row.collectionId,
      folderId: row.folderId,
      name: row.name,
      method: row.method,
      url: row.url,
      headersJson: row.headersJson,
      queryParamsJson: row.queryParamsJson,
      bodyJson: row.bodyJson,
      authJson: row.authJson,
      position: row.position,
      createdByUserId: row.createdByUserId,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  CollectionEndpointExampleModel _toExampleModel(
    StoredCollectionEndpointExample row,
  ) {
    return CollectionEndpointExampleModel(
      id: row.id!,
      endpointId: row.endpointId,
      name: row.name,
      statusCode: row.statusCode,
      headersJson: row.headersJson,
      body: row.body,
      position: row.position,
      createdByUserId: row.createdByUserId,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
}

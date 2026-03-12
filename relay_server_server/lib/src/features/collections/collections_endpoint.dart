import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/session_helper.dart';
import 'package:relay_server_server/src/features/collections/data/collection_repository.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

/// CRUD endpoint for collections per user.
class CollectionsEndpoint extends Endpoint {
  Future<List<CollectionModel>> list(Session session) async {
    final userId = SessionHelper.getUserId(session);
    return CollectionRepository.listByUserId(session, userId);
  }

  Future<CollectionModel?> get(Session session, String collectionId) async {
    final userId = SessionHelper.getUserId(session);
    return CollectionRepository.getById(session, userId, collectionId);
  }

  Future<void> create(Session session, CollectionModel collection) async {
    final userId = SessionHelper.getUserId(session);
    await CollectionRepository.create(session, userId, collection);
  }

  Future<void> update(Session session, CollectionModel collection) async {
    final userId = SessionHelper.getUserId(session);
    await CollectionRepository.update(session, userId, collection);
  }

  Future<void> delete(Session session, String collectionId) async {
    final userId = SessionHelper.getUserId(session);
    await CollectionRepository.delete(session, userId, collectionId);
  }
}

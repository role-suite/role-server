import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/session_helper.dart';
import 'package:relay_server_server/src/features/requests/data/request_repository.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

/// CRUD endpoint for requests per user (scoped by collection).
class RequestsEndpoint extends Endpoint {
  Future<List<ApiRequestModel>> list(
    Session session,
    String collectionId,
  ) async {
    final userId = SessionHelper.getUserId(session);
    return RequestRepository.listByCollection(
      session,
      userId,
      collectionId,
    );
  }

  Future<ApiRequestModel?> get(Session session, String requestId) async {
    final userId = SessionHelper.getUserId(session);
    return RequestRepository.getById(session, userId, requestId);
  }

  Future<void> create(Session session, ApiRequestModel request) async {
    final userId = SessionHelper.getUserId(session);
    await RequestRepository.create(session, userId, request);
  }

  Future<void> update(Session session, ApiRequestModel request) async {
    final userId = SessionHelper.getUserId(session);
    await RequestRepository.update(session, userId, request);
  }

  Future<void> delete(Session session, String requestId) async {
    final userId = SessionHelper.getUserId(session);
    await RequestRepository.delete(session, userId, requestId);
  }
}

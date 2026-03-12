import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/features/requests/data/in_memory_request_store.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

/// CRUD for requests per user (scoped by collection). Used by [RequestsEndpoint].
/// Uses in-memory store when [InMemoryRequestStore.useInMemory] is true (no Postgres).
abstract final class RequestRepository {
  RequestRepository._();

  static Future<List<ApiRequestModel>> listByCollection(
    Session session,
    int userId,
    String collectionId,
  ) async {
    if (InMemoryRequestStore.useInMemory) {
      return InMemoryRequestStore.listByCollection(userId, collectionId);
    }
    final rows = await StoredRequest.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.collectionId.equals(collectionId),
    );
    return rows.map((r) => r.data).toList();
  }

  static Future<ApiRequestModel?> getById(
    Session session,
    int userId,
    String requestId,
  ) async {
    if (InMemoryRequestStore.useInMemory) {
      return InMemoryRequestStore.getById(userId, requestId);
    }
    final row = await StoredRequest.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.requestId.equals(requestId),
    );
    return row?.data;
  }

  static Future<void> create(
    Session session,
    int userId,
    ApiRequestModel request,
  ) async {
    if (InMemoryRequestStore.useInMemory) {
      await InMemoryRequestStore.create(userId, request);
      return;
    }
    await StoredRequest.db.insertRow(
      session,
      StoredRequest(
        userId: userId,
        collectionId: request.collectionId,
        requestId: request.id,
        data: request,
        createdAt: request.createdAt,
        updatedAt: request.updatedAt,
      ),
    );
  }

  static Future<void> update(
    Session session,
    int userId,
    ApiRequestModel request,
  ) async {
    if (InMemoryRequestStore.useInMemory) {
      await InMemoryRequestStore.update(userId, request);
      return;
    }
    final row = await StoredRequest.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.requestId.equals(request.id),
    );
    if (row == null) return;
    row.data = request;
    row.collectionId = request.collectionId;
    row.updatedAt = request.updatedAt;
    await StoredRequest.db.updateRow(session, row);
  }

  static Future<void> delete(
    Session session,
    int userId,
    String requestId,
  ) async {
    if (InMemoryRequestStore.useInMemory) {
      await InMemoryRequestStore.delete(userId, requestId);
      return;
    }
    final row = await StoredRequest.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.requestId.equals(requestId),
    );
    if (row != null) await StoredRequest.db.deleteRow(session, row);
  }
}

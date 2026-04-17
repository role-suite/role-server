import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/collections/data/collections_repository.dart';
import 'package:relay_server_server/src/features/collections/services/collections_service.dart';
import 'package:relay_server_server/src/features/workspaces/services/workspace_access_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import '../../test_helpers/mock_session.dart';

void main() {
  group('CollectionsService', () {
    final Session session = MockSession();

    test('create rejects empty name', () async {
      final service = CollectionsService(
        repository: _FakeCollectionsRepository(),
        workspaceAccessService: _AllowWorkspaceAccessService(),
      );

      expect(
        () => service.create(
          session,
          userId: 1,
          request: CreateCollectionRequest(workspaceId: 10, name: '   '),
        ),
        throwsA(
          isA<DomainException>().having((e) => e.statusCode, 'statusCode', 400),
        ),
      );
    });

    test('getById rejects unknown collection in workspace', () async {
      final service = CollectionsService(
        repository: _FakeCollectionsRepository(),
        workspaceAccessService: _AllowWorkspaceAccessService(),
      );

      expect(
        () => service.getById(
          session,
          userId: 1,
          workspaceId: 10,
          collectionId: 999,
        ),
        throwsA(
          isA<DomainException>().having((e) => e.statusCode, 'statusCode', 404),
        ),
      );
    });

    test('listForWorkspace maps repository rows', () async {
      final service = CollectionsService(
        repository: _FakeCollectionsRepository(
          rows: [
            StoredCollection(
              id: 1,
              workspaceId: 10,
              name: 'Core',
              description: null,
              createdByUserId: 1,
              createdAt: DateTime.now().toUtc(),
              updatedAt: DateTime.now().toUtc(),
            ),
          ],
        ),
        workspaceAccessService: _AllowWorkspaceAccessService(),
      );

      final result = await service.listForWorkspace(
        session,
        userId: 1,
        workspaceId: 10,
      );

      expect(result, hasLength(1));
      expect(result.first.name, 'Core');
      expect(result.first.workspaceId, 10);
    });
  });
}

class _AllowWorkspaceAccessService extends WorkspaceAccessService {
  @override
  Future<String> requireMembershipRole(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {
    return 'owner';
  }

  @override
  Future<void> requireWriterRole(
    Session session, {
    required int userId,
    required int workspaceId,
  }) async {}
}

class _FakeCollectionsRepository extends CollectionsRepository {
  _FakeCollectionsRepository({this.rows = const []});

  final List<StoredCollection> rows;

  @override
  Future<List<StoredCollection>> listByWorkspace(
    Session session,
    int workspaceId,
  ) async {
    return rows.where((r) => r.workspaceId == workspaceId).toList();
  }

  @override
  Future<StoredCollection?> findById(Session session, int collectionId) async {
    for (final row in rows) {
      if (row.id == collectionId) return row;
    }
    return null;
  }
}

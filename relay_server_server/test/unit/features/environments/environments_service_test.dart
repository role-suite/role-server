import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/environments/data/environments_repository.dart';
import 'package:relay_server_server/src/features/environments/services/environments_service.dart';
import 'package:relay_server_server/src/features/workspaces/services/workspace_access_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import '../../test_helpers/mock_session.dart';

void main() {
  group('EnvironmentsService', () {
    final Session session = MockSession();

    test('create rejects duplicate environment name', () async {
      final service = EnvironmentsService(
        repository: _FakeEnvironmentsRepository(
          existingEnvironment: StoredEnvironment(
            id: 5,
            workspaceId: 10,
            name: 'Dev',
            createdByUserId: 1,
            createdAt: DateTime.now().toUtc(),
            updatedAt: DateTime.now().toUtc(),
          ),
        ),
        workspaceAccessService: _AllowWorkspaceAccessService(),
      );

      expect(
        () => service.create(
          session,
          userId: 1,
          request: CreateEnvironmentRequest(workspaceId: 10, name: 'Dev'),
        ),
        throwsA(
          isA<DomainException>().having((e) => e.statusCode, 'statusCode', 409),
        ),
      );
    });

    test('createVariable rejects duplicate key', () async {
      final service = EnvironmentsService(
        repository: _FakeEnvironmentsRepository(
          environmentById: StoredEnvironment(
            id: 8,
            workspaceId: 10,
            name: 'Prod',
            createdByUserId: 1,
            createdAt: DateTime.now().toUtc(),
            updatedAt: DateTime.now().toUtc(),
          ),
          existingVariable: StoredEnvironmentVariable(
            id: 11,
            environmentId: 8,
            key: 'BASE_URL',
            value: 'https://x',
            enabled: true,
            isSecret: false,
            position: 0,
            createdByUserId: 1,
            createdAt: DateTime.now().toUtc(),
            updatedAt: DateTime.now().toUtc(),
          ),
        ),
        workspaceAccessService: _AllowWorkspaceAccessService(),
      );

      expect(
        () => service.createVariable(
          session,
          userId: 1,
          request: CreateEnvironmentVariableRequest(
            workspaceId: 10,
            environmentId: 8,
            key: 'BASE_URL',
            value: 'https://y',
          ),
        ),
        throwsA(
          isA<DomainException>().having((e) => e.statusCode, 'statusCode', 409),
        ),
      );
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

class _FakeEnvironmentsRepository extends EnvironmentsRepository {
  _FakeEnvironmentsRepository({
    this.existingEnvironment,
    this.environmentById,
    this.existingVariable,
  });

  final StoredEnvironment? existingEnvironment;
  final StoredEnvironment? environmentById;
  final StoredEnvironmentVariable? existingVariable;

  @override
  Future<StoredEnvironment?> findByWorkspaceAndName(
    Session session, {
    required int workspaceId,
    required String name,
  }) async {
    if (existingEnvironment != null &&
        existingEnvironment!.workspaceId == workspaceId &&
        existingEnvironment!.name == name) {
      return existingEnvironment;
    }
    return null;
  }

  @override
  Future<StoredEnvironment?> findEnvironmentById(
    Session session,
    int environmentId,
  ) async {
    if (environmentById?.id == environmentId) return environmentById;
    return null;
  }

  @override
  Future<StoredEnvironmentVariable?> findVariableByKey(
    Session session, {
    required int environmentId,
    required String key,
  }) async {
    if (existingVariable != null &&
        existingVariable!.environmentId == environmentId &&
        existingVariable!.key == key) {
      return existingVariable;
    }
    return null;
  }
}

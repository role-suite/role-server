import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/import_export/data/import_export_repository.dart';
import 'package:relay_server_server/src/features/import_export/services/import_export_service.dart';
import 'package:relay_server_server/src/features/workspaces/services/workspace_access_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import '../../test_helpers/mock_session.dart';

void main() {
  group('ImportExportService', () {
    final Session session = MockSession();

    test('createExportJob rejects unsupported format', () async {
      final service = ImportExportService(
        repository: _FakeImportExportRepository(),
        workspaceAccessService: _AllowWorkspaceAccessService(),
      );

      expect(
        () => service.createExportJob(
          session,
          userId: 1,
          request: CreateWorkspaceExportRequest(
            workspaceId: 10,
            format: 'yaml',
          ),
        ),
        throwsA(
          isA<DomainException>().having((e) => e.statusCode, 'statusCode', 400),
        ),
      );
    });

    test('createImportJob rejects invalid json payload', () async {
      final service = ImportExportService(
        repository: _FakeImportExportRepository(),
        workspaceAccessService: _AllowWorkspaceAccessService(),
      );

      expect(
        () => service.createImportJob(
          session,
          userId: 1,
          request: CreateWorkspaceImportRequest(
            workspaceId: 10,
            payloadJson: '{not-json}',
          ),
        ),
        throwsA(
          isA<DomainException>().having((e) => e.statusCode, 'statusCode', 400),
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

class _FakeImportExportRepository extends ImportExportRepository {}

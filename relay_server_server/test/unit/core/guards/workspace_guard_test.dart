import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/core/errors/error_code.dart';
import 'package:relay_server_server/src/core/guards/workspace_guard.dart';
import 'package:test/test.dart';

void main() {
  group('WorkspaceGuard', () {
    test('requireMembership throws when user is not a member', () {
      expect(
        () => WorkspaceGuard.requireMembership(false),
        throwsA(
          isA<DomainException>()
              .having((e) => e.code, 'code', ErrorCode.workspaceAccessDenied)
              .having((e) => e.statusCode, 'statusCode', 403),
        ),
      );
    });

    test('requireWriterRole rejects member role', () {
      expect(
        () => WorkspaceGuard.requireWriterRole('member'),
        throwsA(
          isA<DomainException>().having(
            (e) => e.code,
            'code',
            ErrorCode.workspaceWriterRoleRequired,
          ),
        ),
      );
    });

    test('requireOwnerRole accepts only owner role', () {
      expect(() => WorkspaceGuard.requireOwnerRole('owner'), returnsNormally);

      expect(
        () => WorkspaceGuard.requireOwnerRole('admin'),
        throwsA(
          isA<DomainException>().having(
            (e) => e.code,
            'code',
            ErrorCode.workspaceOwnerRoleRequired,
          ),
        ),
      );
    });
  });
}

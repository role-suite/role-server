import '../errors/domain_exception.dart';
import '../errors/error_code.dart';

abstract final class WorkspaceGuard {
  WorkspaceGuard._();

  static void requireMembership(bool isMember) {
    if (!isMember) {
      throw DomainException(
        'Workspace access denied',
        code: ErrorCode.workspaceAccessDenied,
        statusCode: 403,
      );
    }
  }

  static void requireWriterRole(String role) {
    if (role == 'member') {
      throw DomainException(
        'Only workspace owners and admins can perform this operation',
        code: ErrorCode.workspaceWriterRoleRequired,
        statusCode: 403,
      );
    }
  }

  static void requireOwnerRole(String role) {
    if (role != 'owner') {
      throw DomainException(
        'Workspace owner role required',
        code: ErrorCode.workspaceOwnerRoleRequired,
        statusCode: 403,
      );
    }
  }
}

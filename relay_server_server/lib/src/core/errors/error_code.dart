abstract final class ErrorCode {
  ErrorCode._();

  static const authenticationRequired = 'AUTHENTICATION_REQUIRED';
  static const invalidAuthenticatedUser = 'INVALID_AUTHENTICATED_USER';
  static const workspaceAccessDenied = 'WORKSPACE_ACCESS_DENIED';
  static const workspaceWriterRoleRequired = 'WORKSPACE_WRITER_ROLE_REQUIRED';
  static const workspaceOwnerRoleRequired = 'WORKSPACE_OWNER_ROLE_REQUIRED';
}

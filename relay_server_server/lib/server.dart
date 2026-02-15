import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

import 'src/core/api_key_auth.dart';
import 'src/features/workspace/workspace_route.dart';
import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

/// Sends registration verification code. For now logs to server; replace with real email (e.g. SMTP) in production.
void _sendRegistrationVerificationCode(
  Session session, {
  required UuidValue accountRequestId,
  required String email,
  required Transaction? transaction,
  required String verificationCode,
}) {
  session.log(
    '[EmailIDP] Registration verification code for $email: $verificationCode (requestId: $accountRequestId)',
  );
}

/// Sends password reset verification code. For now logs to server; replace with real email in production.
void _sendPasswordResetVerificationCode(
  Session session, {
  required String email,
  required UuidValue passwordResetRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  session.log(
    '[EmailIDP] Password reset code for $email: $verificationCode (requestId: $passwordResetRequestId)',
  );
}

/// The starting point of the Serverpod server.
void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: ApiKeyAuth.isRequired ? ApiKeyAuth.validateToken : null,
  );

  // Email-based login/register (role-client can use serverpod_auth_idp_flutter).
  pod.initializeAuthServices(
    tokenManagerBuilders: [
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      EmailIdpConfigFromPasswords(
        sendRegistrationVerificationCode: _sendRegistrationVerificationCode,
        sendPasswordResetVerificationCode: _sendPasswordResetVerificationCode,
      ),
    ],
  );

  pod.webServer.addRoute(WorkspaceRoute(), '/workspace');

  await pod.start();
}

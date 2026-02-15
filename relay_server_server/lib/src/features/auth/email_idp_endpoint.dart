import 'package:serverpod_auth_idp_server/providers/email.dart';

/// Exposes the email identity provider (register / login with email) on the server.
/// Configure in [server.dart] via [initializeAuthServices] with [EmailIdpConfig] or [EmailIdpConfigFromPasswords].
class EmailIdpEndpoint extends EmailIdpBaseEndpoint {}

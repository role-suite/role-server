import 'package:serverpod_auth_idp_server/core.dart' as auth_core;

/// Exposes JWT refresh (access + refresh tokens) for the auth module.
/// Required when using [JwtConfig] or [JwtConfigFromPasswords] in [initializeAuthServices].
class RefreshJwtTokensEndpoint extends auth_core.RefreshJwtTokensEndpoint {}

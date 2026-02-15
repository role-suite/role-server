import 'dart:io';

import 'package:serverpod/serverpod.dart';

/// API key (Bearer token) authentication for REST and RPC.
/// When [RELAY_API_KEYS] is set, only requests with a valid Bearer token are accepted;
/// the token is mapped to a stable integer user id (1-based index).
/// When not set, no auth is required and [getUserId] remains 0.
abstract final class ApiKeyAuth {
  static List<String>? _allowedKeys;

  static List<String> get _keys {
    _allowedKeys ??= () {
      final raw = Platform.environment['RELAY_API_KEYS'];
      if (raw == null || raw.trim().isEmpty) return <String>[];
      return raw.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    }();
    return _allowedKeys!;
  }

  /// True when API keys are configured; then a valid Bearer token is required.
  static bool get isRequired => _keys.isNotEmpty;

  /// Validates the Bearer token and returns [AuthenticationInfo] with a stable
  /// user id (1-based index), or null if invalid/missing.
  static Future<AuthenticationInfo?> validateToken(Session session, String token) async {
    if (token.isEmpty) return null;
    final keys = _keys;
    if (keys.isEmpty) return null;
    final index = keys.indexOf(token);
    if (index < 0) return null;
    final userIdentifier = '${index + 1}';
    return AuthenticationInfo(
      userIdentifier,
      const <Scope>{},
      authId: token,
    );
  }
}

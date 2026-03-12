import 'package:serverpod/serverpod.dart';

/// Shared session/auth helpers used across features.
/// User identity comes from:
/// - [ApiKeyAuth] when [RELAY_API_KEYS] is set (userIdentifier = "1", "2", …).
/// - Email auth (serverpod_auth_idp) when users sign in (userIdentifier = UUID string).
abstract final class SessionHelper {
  SessionHelper._();

  /// Returns a stable integer user id for the current session.
  /// API key auth: 1-based index. Email auth: derived from UUID (stable hash).
  static int getUserId(Session session) {
    final auth = session.authenticated;
    if (auth == null) return 0;
    final id = auth.userIdentifier;
    final parsed = int.tryParse(id);
    if (parsed != null && parsed > 0) return parsed;
    return _userIdFromUuid(id);
  }

  /// Derives a stable positive int from an auth user UUID string.
  static int _userIdFromUuid(String uuid) {
    final hex = uuid.replaceAll('-', '');
    if (hex.length < 8) return 1;
    final v = int.tryParse(hex.substring(0, 8), radix: 16) ?? 0;
    final positive = v & 0x7FFFFFFF;
    return positive == 0 ? 1 : positive;
  }
}

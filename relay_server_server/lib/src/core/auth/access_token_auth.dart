import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart';

abstract final class AccessTokenAuth {
  AccessTokenAuth._();

  static String get _secret {
    final envValue = Platform.environment['RELAY_AUTH_TOKEN_SECRET'];
    if (envValue == null || envValue.trim().isEmpty) {
      return 'dev-secret-change-me';
    }
    return envValue.trim();
  }

  static Future<AuthenticationInfo?> validateToken(
    Session session,
    String token,
  ) async {
    final userId = verifyAccessToken(token);
    if (userId == null) return null;
    return AuthenticationInfo('$userId', const <Scope>{}, authId: token);
  }

  static String createAccessToken(
    int userId, {
    Duration ttl = const Duration(minutes: 15),
  }) {
    final now = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
    final exp = now + ttl.inSeconds;
    final header = _base64UrlEncode(jsonEncode({'alg': 'HS256', 'typ': 'JWT'}));
    final payload = _base64UrlEncode(
      jsonEncode({'sub': userId, 'typ': 'access', 'iat': now, 'exp': exp}),
    );
    final unsigned = '$header.$payload';
    final signature = _sign(unsigned);
    return '$unsigned.$signature';
  }

  static int? verifyAccessToken(String token) {
    final parts = token.split('.');
    if (parts.length != 3) return null;
    final unsigned = '${parts[0]}.${parts[1]}';
    final expectedSignature = _sign(unsigned);
    if (!_secureEquals(parts[2], expectedSignature)) return null;

    try {
      final payloadText = utf8.decode(
        base64Url.decode(base64Url.normalize(parts[1])),
      );
      final payload = jsonDecode(payloadText);
      if (payload is! Map<String, dynamic>) return null;
      if (payload['typ'] != 'access') return null;
      final sub = payload['sub'];
      final exp = payload['exp'];
      if (sub is! int || exp is! int) return null;
      final now = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
      if (exp <= now) return null;
      if (sub <= 0) return null;
      return sub;
    } catch (_) {
      return null;
    }
  }

  static String _base64UrlEncode(String value) {
    return base64Url.encode(utf8.encode(value)).replaceAll('=', '');
  }

  static String _sign(String value) {
    final digest = Hmac(
      sha256,
      utf8.encode(_secret),
    ).convert(utf8.encode(value));
    return base64Url.encode(digest.bytes).replaceAll('=', '');
  }

  static bool _secureEquals(String a, String b) {
    final aBytes = utf8.encode(a);
    final bBytes = utf8.encode(b);
    if (aBytes.length != bBytes.length) return false;
    var result = 0;
    for (var i = 0; i < aBytes.length; i++) {
      result |= aBytes[i] ^ bBytes[i];
    }
    return result == 0;
  }
}

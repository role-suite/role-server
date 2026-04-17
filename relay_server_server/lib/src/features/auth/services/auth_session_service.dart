import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/auth/access_token_auth.dart';
import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/core/errors/error_code.dart';
import 'package:relay_server_server/src/features/auth/data/auth_session_repository.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

class AuthSessionService {
  AuthSessionService({AuthSessionRepository? repository})
    : _repository = repository ?? const AuthSessionRepository();

  final AuthSessionRepository _repository;

  Future<AuthTokenPair> createTokenPair(
    Session session, {
    required int userId,
    required int workspaceId,
    Duration accessTtl = const Duration(minutes: 15),
    Duration refreshTtl = const Duration(days: 7),
  }) async {
    final now = DateTime.now().toUtc();
    final accessTokenExpiresAt = now.add(accessTtl);
    final refreshTokenExpiresAt = now.add(refreshTtl);

    final accessToken = AccessTokenAuth.createAccessToken(
      userId,
      ttl: accessTtl,
    );
    final refreshToken = _randomToken();

    await _repository.create(
      session,
      userId: userId,
      workspaceId: workspaceId,
      refreshTokenHash: _hash(refreshToken),
      expiresAt: refreshTokenExpiresAt,
    );

    return AuthTokenPair(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessTokenExpiresAt: accessTokenExpiresAt,
      refreshTokenExpiresAt: refreshTokenExpiresAt,
    );
  }

  Future<StoredAuthSession> requireActiveSessionByRefreshToken(
    Session session,
    String refreshToken,
  ) async {
    final authSession = await _repository.findActiveByRefreshTokenHash(
      session,
      refreshTokenHash: _hash(refreshToken),
    );
    if (authSession == null) {
      throw DomainException(
        'Invalid refresh token',
        code: ErrorCode.authenticationRequired,
        statusCode: 401,
      );
    }
    return authSession;
  }

  Future<void> revokeSession(Session session, int sessionId) {
    return _repository.revokeById(session, sessionId);
  }

  String _hash(String value) {
    return sha256.convert(utf8.encode(value)).toString();
  }

  String _randomToken() {
    final random = Random.secure();
    final bytes = List<int>.generate(32, (_) => random.nextInt(256));
    return base64UrlEncode(bytes);
  }
}

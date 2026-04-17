import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/auth/data/auth_user_repository.dart';
import 'package:relay_server_server/src/features/auth/services/auth_service.dart';
import 'package:relay_server_server/src/features/auth/services/auth_session_service.dart';
import 'package:relay_server_server/src/features/auth/services/password_hasher.dart';
import 'package:relay_server_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import '../../test_helpers/mock_session.dart';

void main() {
  group('AuthService', () {
    final Session session = MockSession();

    test('register rejects duplicate email', () async {
      final service = AuthService(
        userRepository: _FakeAuthUserRepository(
          byEmail: StoredAuthUser(
            id: 1,
            email: 'test@example.com',
            name: 'User',
            passwordHash: 'hash',
            passwordSalt: 'salt',
            createdAt: DateTime.now().toUtc(),
            updatedAt: DateTime.now().toUtc(),
          ),
        ),
        sessionService: _FakeAuthSessionService(),
        passwordHasher: const PasswordHasher(),
      );

      expect(
        () => service.register(
          session,
          AuthRegisterRequest(
            name: 'New User',
            email: 'test@example.com',
            password: 'secret',
          ),
        ),
        throwsA(
          isA<DomainException>().having((e) => e.statusCode, 'statusCode', 409),
        ),
      );
    });

    test('login rejects invalid password', () async {
      final hasher = const PasswordHasher();
      final salt = 'fixed-salt';
      final stored = StoredAuthUser(
        id: 2,
        email: 'login@example.com',
        name: 'Login User',
        passwordHash: hasher.hashPassword('correct-password', salt),
        passwordSalt: salt,
        createdAt: DateTime.now().toUtc(),
        updatedAt: DateTime.now().toUtc(),
      );
      final service = AuthService(
        userRepository: _FakeAuthUserRepository(byEmail: stored),
        sessionService: _FakeAuthSessionService(),
        passwordHasher: hasher,
      );

      expect(
        () => service.login(
          session,
          AuthLoginRequest(email: 'login@example.com', password: 'wrong'),
        ),
        throwsA(
          isA<DomainException>().having((e) => e.statusCode, 'statusCode', 401),
        ),
      );
    });

    test('refresh rejects missing token', () async {
      final service = AuthService(
        userRepository: _FakeAuthUserRepository(),
        sessionService: _FakeAuthSessionService(),
      );

      expect(
        () => service.refresh(
          session,
          AuthRefreshRequest(refreshToken: '   '),
        ),
        throwsA(
          isA<DomainException>().having((e) => e.statusCode, 'statusCode', 400),
        ),
      );
    });
  });
}

class _FakeAuthUserRepository extends AuthUserRepository {
  _FakeAuthUserRepository({this.byEmail});

  final StoredAuthUser? byEmail;

  @override
  Future<StoredAuthUser?> findByEmail(Session session, String email) async {
    return byEmail;
  }

  @override
  Future<StoredAuthUser> create(
    Session session, {
    required String email,
    required String name,
    required String passwordHash,
    required String passwordSalt,
  }) async {
    return StoredAuthUser(
      id: 999,
      email: email,
      name: name,
      passwordHash: passwordHash,
      passwordSalt: passwordSalt,
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    );
  }
}

class _FakeAuthSessionService extends AuthSessionService {
  @override
  Future<AuthTokenPair> createTokenPair(
    Session session, {
    required int userId,
    required int workspaceId,
    Duration accessTtl = const Duration(minutes: 15),
    Duration refreshTtl = const Duration(days: 7),
  }) async {
    final now = DateTime.now().toUtc();
    return AuthTokenPair(
      accessToken: 'a',
      refreshToken: 'r',
      accessTokenExpiresAt: now.add(accessTtl),
      refreshTokenExpiresAt: now.add(refreshTtl),
    );
  }
}

import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/guards/auth_guard.dart';
import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/auth/data/auth_user_repository.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

import 'auth_session_service.dart';
import 'password_hasher.dart';

class AuthService {
  AuthService({
    AuthUserRepository? userRepository,
    AuthSessionService? sessionService,
    PasswordHasher? passwordHasher,
  }) : _userRepository = userRepository ?? const AuthUserRepository(),
       _sessionService = sessionService ?? AuthSessionService(),
       _passwordHasher = passwordHasher ?? const PasswordHasher();

  final AuthUserRepository _userRepository;
  final AuthSessionService _sessionService;
  final PasswordHasher _passwordHasher;

  Future<AuthTokenPair> register(
    Session session,
    AuthRegisterRequest request,
  ) async {
    final email = request.email.trim().toLowerCase();
    final name = request.name.trim();
    if (email.isEmpty || name.isEmpty || request.password.isEmpty) {
      throw DomainException(
        'Name, email, and password are required',
        statusCode: 400,
      );
    }

    final existing = await _userRepository.findByEmail(session, email);
    if (existing != null) {
      throw DomainException('Email is already registered', statusCode: 409);
    }

    final salt = _passwordHasher.createSalt();
    final hash = _passwordHasher.hashPassword(request.password, salt);
    final user = await _userRepository.create(
      session,
      email: email,
      name: name,
      passwordHash: hash,
      passwordSalt: salt,
    );

    return _sessionService.createTokenPair(
      session,
      userId: user.id!,
      workspaceId: 0,
    );
  }

  Future<AuthTokenPair> login(Session session, AuthLoginRequest request) async {
    final email = request.email.trim().toLowerCase();
    final user = await _userRepository.findByEmail(session, email);
    if (user == null) {
      throw DomainException('Invalid email or password', statusCode: 401);
    }

    final valid = _passwordHasher.verifyPassword(
      request.password,
      salt: user.passwordSalt,
      expectedHash: user.passwordHash,
    );
    if (!valid) {
      throw DomainException('Invalid email or password', statusCode: 401);
    }

    return _sessionService.createTokenPair(
      session,
      userId: user.id!,
      workspaceId: 0,
    );
  }

  Future<AuthTokenPair> refresh(
    Session session,
    AuthRefreshRequest request,
  ) async {
    if (request.refreshToken.trim().isEmpty) {
      throw DomainException('Refresh token is required', statusCode: 400);
    }

    final authSession = await _sessionService
        .requireActiveSessionByRefreshToken(
          session,
          request.refreshToken,
        );
    await _sessionService.revokeSession(session, authSession.id!);

    return _sessionService.createTokenPair(
      session,
      userId: authSession.userId,
      workspaceId: authSession.workspaceId,
    );
  }

  Future<void> logout(Session session, AuthRefreshRequest request) async {
    if (request.refreshToken.trim().isEmpty) return;
    final authSession = await _sessionService
        .requireActiveSessionByRefreshToken(
          session,
          request.refreshToken,
        );
    await _sessionService.revokeSession(session, authSession.id!);
  }

  Future<AuthUserModel> me(Session session) async {
    final userId = AuthGuard.requireUserId(session);
    final user = await _userRepository.findById(session, userId);
    if (user == null) {
      throw DomainException('Authenticated user not found', statusCode: 404);
    }
    return AuthUserModel(
      id: user.id!,
      email: user.email,
      name: user.name,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }
}

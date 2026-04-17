import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/logging/endpoint_action_runner.dart';
import 'package:relay_server_server/src/features/auth/services/auth_service.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

class AuthEndpoint extends Endpoint {
  AuthEndpoint({AuthService? authService})
    : _authService = authService ?? AuthService();

  final AuthService _authService;

  @unauthenticatedClientCall
  Future<AuthTokenPair> register(Session session, AuthRegisterRequest request) {
    return EndpointActionRunner.run(
      session,
      endpoint: 'auth',
      action: 'register',
      context: {'email': request.email.trim().toLowerCase()},
      operation: () => _authService.register(session, request),
    );
  }

  @unauthenticatedClientCall
  Future<AuthTokenPair> login(Session session, AuthLoginRequest request) {
    return EndpointActionRunner.run(
      session,
      endpoint: 'auth',
      action: 'login',
      context: {'email': request.email.trim().toLowerCase()},
      operation: () => _authService.login(session, request),
    );
  }

  @unauthenticatedClientCall
  Future<AuthTokenPair> refresh(Session session, AuthRefreshRequest request) {
    return EndpointActionRunner.run(
      session,
      endpoint: 'auth',
      action: 'refresh',
      operation: () => _authService.refresh(session, request),
    );
  }

  @unauthenticatedClientCall
  Future<void> logout(Session session, AuthRefreshRequest request) {
    return EndpointActionRunner.run(
      session,
      endpoint: 'auth',
      action: 'logout',
      operation: () => _authService.logout(session, request),
    );
  }

  Future<AuthUserModel> me(Session session) {
    return EndpointActionRunner.run(
      session,
      endpoint: 'auth',
      action: 'me',
      operation: () => _authService.me(session),
    );
  }
}

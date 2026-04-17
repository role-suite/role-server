import 'package:serverpod/serverpod.dart';

import '../auth/auth_context.dart';

abstract final class AuthGuard {
  AuthGuard._();

  static int requireUserId(Session session) {
    return AuthContext.fromSession(session).userId;
  }
}

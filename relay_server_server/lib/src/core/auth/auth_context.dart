import 'package:serverpod/serverpod.dart';

import '../errors/domain_exception.dart';
import '../errors/error_code.dart';

class AuthContext {
  AuthContext({required this.userId});

  final int userId;

  static AuthContext fromSession(Session session) {
    final authenticated = session.authenticated;
    if (authenticated == null) {
      throw DomainException(
        'Authentication required',
        code: ErrorCode.authenticationRequired,
        statusCode: 401,
      );
    }
    final userId = int.tryParse(authenticated.userIdentifier);
    if (userId == null || userId <= 0) {
      throw DomainException(
        'Invalid authenticated user id',
        code: ErrorCode.invalidAuthenticatedUser,
        statusCode: 401,
      );
    }
    return AuthContext(userId: userId);
  }
}

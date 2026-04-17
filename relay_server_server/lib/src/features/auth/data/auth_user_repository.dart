import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/generated/protocol.dart';

class AuthUserRepository {
  const AuthUserRepository();

  Future<StoredAuthUser?> findByEmail(Session session, String email) {
    return StoredAuthUser.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );
  }

  Future<StoredAuthUser?> findById(Session session, int userId) {
    return StoredAuthUser.db.findById(session, userId);
  }

  Future<StoredAuthUser> create(
    Session session, {
    required String email,
    required String name,
    required String passwordHash,
    required String passwordSalt,
  }) {
    final now = DateTime.now().toUtc();
    return StoredAuthUser.db.insertRow(
      session,
      StoredAuthUser(
        email: email,
        name: name,
        passwordHash: passwordHash,
        passwordSalt: passwordSalt,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }
}

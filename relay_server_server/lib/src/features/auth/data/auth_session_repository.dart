import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/generated/protocol.dart';

class AuthSessionRepository {
  const AuthSessionRepository();

  Future<StoredAuthSession> create(
    Session session, {
    required int userId,
    required int workspaceId,
    required String refreshTokenHash,
    required DateTime expiresAt,
  }) async {
    final now = DateTime.now().toUtc();
    return StoredAuthSession.db.insertRow(
      session,
      StoredAuthSession(
        userId: userId,
        workspaceId: workspaceId,
        refreshTokenHash: refreshTokenHash,
        expiresAt: expiresAt,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<StoredAuthSession?> findActiveByRefreshTokenHash(
    Session session, {
    required String refreshTokenHash,
  }) async {
    final record = await StoredAuthSession.db.findFirstRow(
      session,
      where: (t) =>
          t.refreshTokenHash.equals(refreshTokenHash) &
          t.revokedAt.equals(null),
    );
    if (record == null) return null;
    if (record.expiresAt.isBefore(DateTime.now().toUtc())) return null;
    return record;
  }

  Future<void> revokeById(Session session, int sessionId) async {
    final existing = await StoredAuthSession.db.findById(session, sessionId);
    if (existing == null || existing.revokedAt != null) return;
    existing.revokedAt = DateTime.now().toUtc();
    existing.updatedAt = existing.revokedAt!;
    await StoredAuthSession.db.updateRow(session, existing);
  }
}

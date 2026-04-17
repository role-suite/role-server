import 'package:relay_server_server/src/features/auth/services/password_hasher.dart';
import 'package:test/test.dart';

void main() {
  group('PasswordHasher', () {
    final hasher = PasswordHasher();

    test('creates different salts for each call', () {
      final saltA = hasher.createSalt();
      final saltB = hasher.createSalt();

      expect(saltA, isNot(equals(saltB)));
    });

    test('hash is deterministic for same password and salt', () {
      const password = 'secret-password';
      const salt = 'fixed-salt';

      final hashA = hasher.hashPassword(password, salt);
      final hashB = hasher.hashPassword(password, salt);

      expect(hashA, equals(hashB));
    });

    test('verifyPassword matches and rejects mismatches', () {
      const password = 'secret-password';
      final salt = hasher.createSalt();
      final hash = hasher.hashPassword(password, salt);

      expect(
        hasher.verifyPassword(password, salt: salt, expectedHash: hash),
        isTrue,
      );
      expect(
        hasher.verifyPassword('wrong-password', salt: salt, expectedHash: hash),
        isFalse,
      );
    });
  });
}

import 'package:relay_server_server/src/core/auth/access_token_auth.dart';
import 'package:test/test.dart';

void main() {
  group('AccessTokenAuth', () {
    test('creates and verifies access token', () {
      final token = AccessTokenAuth.createAccessToken(42);

      final userId = AccessTokenAuth.verifyAccessToken(token);

      expect(userId, 42);
    });

    test('rejects expired token', () {
      final token = AccessTokenAuth.createAccessToken(
        42,
        ttl: const Duration(seconds: -1),
      );

      final userId = AccessTokenAuth.verifyAccessToken(token);

      expect(userId, isNull);
    });

    test('rejects tampered token', () {
      final token = AccessTokenAuth.createAccessToken(42);
      final last = token[token.length - 1];
      final tampered =
          '${token.substring(0, token.length - 1)}${last == 'a' ? 'b' : 'a'}';

      final userId = AccessTokenAuth.verifyAccessToken(tampered);

      expect(userId, isNull);
    });
  });
}

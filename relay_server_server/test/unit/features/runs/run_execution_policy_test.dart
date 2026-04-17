import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/runs/services/run_execution_policy.dart';
import 'package:test/test.dart';

void main() {
  group('RunExecutionPolicy', () {
    test('normalizes timeout within bounds', () {
      final policy = RunExecutionPolicy(environment: const {});

      expect(policy.normalizeTimeoutMs(null), 10000);
      expect(policy.normalizeTimeoutMs(50), 100);
      expect(policy.normalizeTimeoutMs(500), 500);
      expect(policy.normalizeTimeoutMs(999999), 30000);
    });

    test('validates allowed http methods', () {
      final policy = RunExecutionPolicy(environment: const {});

      expect(policy.isAllowedHttpMethod('GET'), isTrue);
      expect(policy.isAllowedHttpMethod('POST'), isTrue);
      expect(policy.isAllowedHttpMethod('TRACE'), isFalse);
    });

    test('blocks localhost by default', () {
      final policy = RunExecutionPolicy(environment: const {});

      expect(
        () => policy.validateUrlPolicy('http://localhost:8080/test'),
        throwsA(isA<DomainException>()),
      );
    });

    test('allows localhost when private network enabled', () {
      final policy = RunExecutionPolicy(
        environment: const {'RELAY_RUNNER_ALLOW_PRIVATE_NETWORK': 'true'},
      );

      expect(
        () => policy.validateUrlPolicy('http://localhost:8080/test'),
        returnsNormally,
      );
    });

    test('parses response byte limit from environment', () {
      final defaultPolicy = RunExecutionPolicy(environment: const {});
      final tunedPolicy = RunExecutionPolicy(
        environment: const {'RELAY_RUNNER_MAX_RESPONSE_BYTES': '2048'},
      );

      expect(defaultPolicy.maxResponseBytes(), 1024 * 1024);
      expect(tunedPolicy.maxResponseBytes(), 2048);
    });
  });
}

import 'dart:convert';

import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/features/runs/services/run_payload_resolver.dart';
import 'package:test/test.dart';

void main() {
  group('RunPayloadResolver', () {
    final resolver = RunPayloadResolver();

    test('parseJsonMap parses string values', () {
      final parsed = resolver.parseJsonMap('{"a":"b","x":1}');

      expect(parsed, {'a': 'b', 'x': '1'});
    });

    test('parseJsonMap rejects non-map json', () {
      expect(
        () => resolver.parseJsonMap('[1,2,3]'),
        throwsA(isA<DomainException>()),
      );
    });

    test('resolveTemplate substitutes {{vars}}', () {
      final resolved = resolver.resolveTemplate(
        'https://{{host}}/v1/{{path}}',
        {'host': 'example.com', 'path': 'users'},
      );

      expect(resolved, 'https://example.com/v1/users');
    });

    test('mergeAuthIntoHeaders supports bearer auth', () {
      final headers = <String, String>{};
      final authJson = jsonEncode({'type': 'bearer', 'token': 'abc'});

      resolver.mergeAuthIntoHeaders(headers, authJson);

      expect(headers['authorization'], 'Bearer abc');
    });

    test('mergeAuthIntoHeaders supports basic auth', () {
      final headers = <String, String>{};
      final authJson = jsonEncode({
        'type': 'basic',
        'username': 'user',
        'password': 'pass',
      });

      resolver.mergeAuthIntoHeaders(headers, authJson);

      expect(headers['authorization'], isNotNull);
      expect(headers['authorization']!.startsWith('Basic '), isTrue);
    });
  });
}

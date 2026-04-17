import 'dart:convert';

import 'package:relay_server_server/src/core/errors/domain_exception.dart';

class RunPayloadResolver {
  const RunPayloadResolver();

  Map<String, String> parseJsonMap(String? source) {
    if (source == null || source.trim().isEmpty) return <String, String>{};
    final decoded = jsonDecode(source);
    if (decoded is! Map) {
      throw DomainException('Expected a JSON object', statusCode: 400);
    }
    return decoded.map(
      (key, value) => MapEntry(key.toString(), value?.toString() ?? ''),
    );
  }

  String resolveTemplate(String source, Map<String, String> variables) {
    var resolved = source;
    for (final entry in variables.entries) {
      resolved = resolved.replaceAll('{{${entry.key}}}', entry.value);
    }
    return resolved;
  }

  void mergeAuthIntoHeaders(Map<String, String> headers, String? authJson) {
    if (authJson == null || authJson.trim().isEmpty) return;
    final parsed = jsonDecode(authJson);
    if (parsed is! Map<String, dynamic>) return;

    final type = (parsed['type'] as String?)?.toLowerCase().trim();
    if (type == 'bearer') {
      final token = parsed['token'] as String?;
      if (token != null && token.isNotEmpty) {
        headers['authorization'] = 'Bearer $token';
      }
    } else if (type == 'basic') {
      final username = parsed['username'] as String?;
      final password = parsed['password'] as String?;
      if (username != null && password != null) {
        final encoded = base64Encode(utf8.encode('$username:$password'));
        headers['authorization'] = 'Basic $encoded';
      }
    }
  }
}

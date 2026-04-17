import 'dart:io';

import 'package:relay_server_server/src/core/errors/domain_exception.dart';

class RunExecutionPolicy {
  RunExecutionPolicy({Map<String, String>? environment})
    : _environment = environment ?? Platform.environment;

  final Map<String, String> _environment;

  bool isAllowedHttpMethod(String method) {
    const allowed = {
      'GET',
      'POST',
      'PUT',
      'PATCH',
      'DELETE',
      'HEAD',
      'OPTIONS',
    };
    return allowed.contains(method);
  }

  int normalizeTimeoutMs(int? input) {
    final value = input ?? 10000;
    if (value < 100) return 100;
    if (value > 30000) return 30000;
    return value;
  }

  int maxResponseBytes() {
    final value = _environment['RELAY_RUNNER_MAX_RESPONSE_BYTES'];
    final parsed = value == null ? null : int.tryParse(value.trim());
    if (parsed == null || parsed <= 0) return 1024 * 1024;
    return parsed;
  }

  void validateUrlPolicy(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || (uri.scheme != 'http' && uri.scheme != 'https')) {
      throw DomainException(
        'Only http and https urls are allowed',
        statusCode: 400,
      );
    }
    final host = uri.host.toLowerCase();
    if (host.isEmpty) {
      throw DomainException('Request url host is required', statusCode: 400);
    }
    if (allowPrivateNetwork()) return;

    if (host == 'localhost' || host.endsWith('.local')) {
      throw DomainException('Blocked destination host', statusCode: 403);
    }

    final ip = InternetAddress.tryParse(host);
    if (ip != null) {
      if (ip.isLoopback || ip.isLinkLocal || isPrivateAddress(ip)) {
        throw DomainException('Blocked destination host', statusCode: 403);
      }
    }
  }

  bool allowPrivateNetwork() {
    final value = _environment['RELAY_RUNNER_ALLOW_PRIVATE_NETWORK'];
    if (value == null) return false;
    final normalized = value.trim().toLowerCase();
    return normalized == 'true' || normalized == '1' || normalized == 'yes';
  }

  bool isPrivateAddress(InternetAddress ip) {
    final bytes = ip.rawAddress;
    if (bytes.length == 4) {
      final first = bytes[0];
      final second = bytes[1];
      if (first == 10) return true;
      if (first == 172 && second >= 16 && second <= 31) return true;
      if (first == 192 && second == 168) return true;
      if (first == 127) return true;
      return false;
    }

    final text = ip.address.toLowerCase();
    if (text == '::1') return true;
    if (text.startsWith('fc') || text.startsWith('fd')) return true;
    if (text.startsWith('fe80:')) return true;
    return false;
  }
}

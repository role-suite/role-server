import 'dart:convert';

import 'package:serverpod/serverpod.dart';

abstract final class AppLogger {
  AppLogger._();

  static void info(
    Session session, {
    required String scope,
    required String message,
    Map<String, Object?> data = const {},
  }) {
    _log(session, level: 'INFO', scope: scope, message: message, data: data);
  }

  static void warning(
    Session session, {
    required String scope,
    required String message,
    Map<String, Object?> data = const {},
  }) {
    _log(session, level: 'WARN', scope: scope, message: message, data: data);
  }

  static void error(
    Session session, {
    required String scope,
    required String message,
    Map<String, Object?> data = const {},
  }) {
    _log(session, level: 'ERROR', scope: scope, message: message, data: data);
  }

  static void _log(
    Session session, {
    required String level,
    required String scope,
    required String message,
    required Map<String, Object?> data,
  }) {
    final payload = <String, Object?>{
      'time': DateTime.now().toUtc().toIso8601String(),
      'level': level,
      'scope': scope,
      'message': message,
      if (data.isNotEmpty) 'data': data,
    };
    session.log(jsonEncode(payload));
  }
}

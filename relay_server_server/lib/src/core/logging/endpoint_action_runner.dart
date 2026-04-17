import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/errors/domain_exception.dart';
import 'package:relay_server_server/src/core/logging/app_logger.dart';

abstract final class EndpointActionRunner {
  EndpointActionRunner._();

  static Future<T> run<T>(
    Session session, {
    required String endpoint,
    required String action,
    Map<String, Object?> context = const {},
    required Future<T> Function() operation,
  }) async {
    final stopwatch = Stopwatch()..start();
    final scope = 'endpoint.$endpoint';

    AppLogger.info(
      session,
      scope: scope,
      message: '$action.start',
      data: context,
    );

    try {
      final result = await operation();
      AppLogger.info(
        session,
        scope: scope,
        message: '$action.success',
        data: <String, Object?>{
          ...context,
          'durationMs': stopwatch.elapsedMilliseconds,
        },
      );
      return result;
    } on DomainException catch (error) {
      AppLogger.warning(
        session,
        scope: scope,
        message: '$action.domain_error',
        data: <String, Object?>{
          ...context,
          'durationMs': stopwatch.elapsedMilliseconds,
          'statusCode': error.statusCode,
          'code': error.code,
          'error': error.message,
        },
      );
      rethrow;
    } catch (error, stackTrace) {
      AppLogger.error(
        session,
        scope: scope,
        message: '$action.unhandled_error',
        data: <String, Object?>{
          ...context,
          'durationMs': stopwatch.elapsedMilliseconds,
          'error': error.toString(),
          'stackTrace': stackTrace.toString(),
        },
      );
      rethrow;
    }
  }
}

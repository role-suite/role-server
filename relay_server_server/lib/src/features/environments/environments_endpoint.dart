import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/session_helper.dart';
import 'package:relay_server_server/src/features/environments/data/environment_repository.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

/// CRUD endpoint for environments per user.
class EnvironmentsEndpoint extends Endpoint {
  Future<List<EnvironmentModel>> list(Session session) async {
    final userId = SessionHelper.getUserId(session);
    return EnvironmentRepository.listByUserId(session, userId);
  }

  Future<EnvironmentModel?> get(Session session, String name) async {
    final userId = SessionHelper.getUserId(session);
    return EnvironmentRepository.getByName(session, userId, name);
  }

  Future<void> create(Session session, EnvironmentModel environment) async {
    final userId = SessionHelper.getUserId(session);
    await EnvironmentRepository.create(session, userId, environment);
  }

  Future<void> update(Session session, EnvironmentModel environment) async {
    final userId = SessionHelper.getUserId(session);
    await EnvironmentRepository.update(session, userId, environment);
  }

  Future<void> delete(Session session, String name) async {
    final userId = SessionHelper.getUserId(session);
    await EnvironmentRepository.delete(session, userId, name);
  }
}

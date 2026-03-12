import 'dart:convert';

import 'package:serverpod/serverpod.dart';

import 'package:relay_server_server/src/core/api_key_auth.dart';
import 'package:relay_server_server/src/core/session_helper.dart';
import 'package:relay_server_server/src/features/workspace/data/workspace_repository.dart';
import 'package:relay_server_server/src/features/workspace/workspace_json.dart';
import 'package:relay_server_server/src/generated/protocol.dart';

/// REST route for GET/PUT /workspace so the Röle Flutter client (RemoteWorkspaceClient)
/// can sync without using the Serverpod RPC client. Same data as [WorkspaceEndpoint].
class WorkspaceRoute extends Route {
  @override
  Future<Result> handleCall(Session session, Request request) async {
    if (ApiKeyAuth.isRequired && session.authenticated == null) {
      return Response(
        401,
        body: Body.fromString(
          'Unauthorized. Provide a valid API key in Authorization: Bearer <key>.',
          mimeType: MimeType.plainText,
        ),
      );
    }
    final method = request.method;
    if (method == Method.get) {
      return _handleGet(session);
    }
    if (method == Method.put) {
      return _handlePut(session, request);
    }
    return Response(
      405,
      body: Body.fromString(
        'Method ${method.name} not allowed. Use GET or PUT.',
        mimeType: MimeType.plainText,
      ),
    );
  }

  Future<Result> _handleGet(Session session) async {
    final userId = SessionHelper.getUserId(session);
    final bundle = await WorkspaceRepository.getByUserId(session, userId);
    final Map<String, dynamic> json;
    if (bundle == null) {
      json = workspaceBundleToClientJson(_emptyWorkspace());
    } else {
      json = workspaceBundleToClientJson(bundle);
    }
    return Response.ok(
      body: Body.fromString(
        jsonEncode(json),
        mimeType: MimeType.json,
      ),
    );
  }

  Future<Result> _handlePut(Session session, Request request) async {
    String bodyText;
    try {
      bodyText = await request.readAsString();
    } catch (_) {
      return Response.badRequest(
        body: Body.fromString('Missing or invalid body', mimeType: MimeType.plainText),
      );
    }
    if (bodyText.isEmpty) {
      return Response.badRequest(
        body: Body.fromString('Empty body', mimeType: MimeType.plainText),
      );
    }
    Map<String, dynamic> json;
    try {
      json = jsonDecode(bodyText) as Map<String, dynamic>;
    } catch (_) {
      return Response.badRequest(
        body: Body.fromString('Invalid JSON', mimeType: MimeType.plainText),
      );
    }
    if (!json.containsKey('version') || !json.containsKey('collections')) {
      return Response.badRequest(
        body: Body.fromString('JSON must contain version and collections', mimeType: MimeType.plainText),
      );
    }
    WorkspaceBundle bundle;
    try {
      bundle = workspaceBundleFromClientJson(json);
    } catch (e) {
      return Response.badRequest(
        body: Body.fromString('Invalid workspace format: $e', mimeType: MimeType.plainText),
      );
    }
    final userId = SessionHelper.getUserId(session);
    await WorkspaceRepository.setForUserId(session, userId, bundle);
    return Response.noContent();
  }

  static WorkspaceBundle _emptyWorkspace() {
    return WorkspaceBundle(
      version: 1,
      exportedAt: DateTime.now().toUtc(),
      source: null,
      collections: const [],
      environments: const [],
    );
  }
}

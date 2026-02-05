import 'package:serverpod/serverpod.dart';

import 'src/features/workspace/workspace_route.dart';
import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

/// The starting point of the Serverpod server.
void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(args, Protocol(), Endpoints());

  // REST GET/PUT /workspace for Röle client (RemoteWorkspaceClient).
  // In the app: set API base URL to the web server, e.g. http://localhost:8082 (no trailing /workspace).
  pod.webServer.addRoute(WorkspaceRoute(), '/workspace');

  // Start the server.
  await pod.start();
}

import 'package:serverpod/serverpod.dart';

import 'src/core/auth/access_token_auth.dart';
import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: AccessTokenAuth.validateToken,
  );

  await pod.start();
}

# 9. Maintenance and Operations

## Adding a New Endpoint

1. **Create the endpoint class** under `lib/src/features/<feature>/` (e.g. `lib/src/features/example/example_endpoint.dart`):

   ```dart
   import 'package:serverpod/serverpod.dart';
   import 'package:relay_server_server/src/core/session_helper.dart';

   class ExampleEndpoint extends Endpoint {
     Future<String> sayHello(Session session, String name) async {
       final userId = SessionHelper.getUserId(session);
       return 'Hello $name (user: $userId)';
     }
   }
   ```

2. **Register the endpoint:** Run `dart run serverpod generate`. Serverpod discovers endpoints and updates `lib/src/generated/endpoints.dart`. Ensure the new endpoint is included in the `Endpoints()` class used in `server.dart`.

3. **Optional:** Add a repository and/or in-memory store if the endpoint needs persistence. Follow the pattern of `CollectionRepository` and `InMemoryCollectionStore` (check `useInMemory`, then DB or store).

4. **Document:** Update [03-API-REFERENCE.md](03-API-REFERENCE.md) with the new RPC method(s).

## Adding a New REST Route

1. **Create a route class** that extends Serverpod’s `Route` and implements `handleCall(Session session, Request request)`.

2. **Register in `server.dart`:**

   ```dart
   pod.webServer.addRoute(YourRoute(), '/your-path');
   ```

3. **Auth:** If API keys are required, check `ApiKeyAuth.isRequired && session.authenticated == null` and return 401 when unauthenticated (see `WorkspaceRoute`).

4. **Document:** Update [03-API-REFERENCE.md](03-API-REFERENCE.md) with method, path, request/response, and status codes.

## Changing the Data Model

### Protocol-only (no new tables)

1. Edit the appropriate `.spy.yaml` under `lib/src/features/*/models/` (add/remove/rename fields or new non-table classes).
2. Run `dart run serverpod generate`.
3. Fix any compile errors in repositories, endpoints, and `workspace_json.dart` if the workspace JSON shape changed.
4. Update [05-DATA-MODEL.md](05-DATA-MODEL.md) and [03-API-REFERENCE.md](03-API-REFERENCE.md) if the REST JSON format changed.

### Adding or changing database tables

1. Edit `.spy.yaml` (add a class with `table: <name>` and optional `indexes:`).
2. Run `dart run serverpod generate`.
3. Run `dart run serverpod create-migration`. Inspect the new migration under `migrations/`.
4. Apply migrations: `dart bin/main.dart --apply-migrations` (or in your deployment).
5. Add or update repository and in-memory store to use the new table/model.
6. Update docs as above.

### Changing workspace JSON (/workspace)

- **Encoding:** Adjust `workspace_json.dart` (`workspaceBundleToClientJson` and the per-type helpers).
- **Decoding:** Adjust `workspaceBundleFromClientJson` and the `*FromClientJson` helpers. Keep defaults and parsing robust (missing keys, invalid types).
- Bump or document `version` in the bundle if you introduce a breaking change.
- Update [05-DATA-MODEL.md](05-DATA-MODEL.md) and [03-API-REFERENCE.md](03-API-REFERENCE.md).

## Troubleshooting

### Server won’t start: database connection failed

- Ensure Postgres is running (`docker compose ps` if using Compose).
- Check `config/development.yaml`: `database.host` and `database.port` (e.g. `localhost:8090`).
- Check `config/passwords.yaml`: `development.databasePassword` matches the Postgres password (e.g. `postgres` in the default Compose setup).

### 401 on /workspace

- If `RELAY_API_KEYS` is set, the client must send `Authorization: Bearer <one-of-the-keys>`.
- Verify the key is in the comma-separated list and that there are no extra spaces (keys are trimmed).
- Restart the server after changing `RELAY_API_KEYS`.

### Data lost after restart

- If you ran with `RELAY_USE_IN_MEMORY=1`, data is not persisted. Use database mode (Postgres) for persistence.
- Ensure migrations were applied (`--apply-migrations`) when using the database.

### Generated code out of date

- Run `dart run serverpod generate` from `relay_server_server/` after any protocol or endpoint change.
- If tests fail with “endpoint not found” or type errors, regenerate and re-run tests.

### Port already in use

- Change ports in `config/development.yaml` (`apiServer`, `webServer`) or stop the process using the port (e.g. another Serverpod instance).

## Rotating API Keys

1. Generate new key(s). Add them to `RELAY_API_KEYS` (e.g. append to the list).
2. Deploy with the new env so existing keys still work and new keys are valid.
3. Update clients to use new keys if desired.
4. Remove old keys from `RELAY_API_KEYS` and redeploy. Requests using old keys will get 401 after that.

**Note:** User id mapping changes when you change key order. If key A was index 1 and you remove it, the next key becomes index 1; data previously stored as “user 1” is now associated with a different key. Prefer adding new keys and migrating clients before removing old ones.

## Backup and Restore

- **Database:** Use standard Postgres backup (e.g. `pg_dump`). All workspace and CRUD data is in the Serverpod-managed tables.
- **Config:** Back up `config/passwords.yaml` and production YAML in a secure place; do not commit them.
- **Migrations:** If you commit migrations, they are part of the repo; otherwise ensure they are generated and applied in your build/deploy pipeline.

## Dependency Updates

- **Serverpod:** Check [Serverpod changelog](https://github.com/serverpod/serverpod/releases) for breaking changes. Update `pubspec.yaml` (e.g. `serverpod: 3.2.2` → new version), run `dart pub upgrade`, then `dart run serverpod generate` and fix any API changes.
- **Dart SDK:** Keep within the range in `pubspec.yaml` (`sdk: '^3.8.0'`). Run tests and analyzer after upgrading.

## Logs and Observability

- Serverpod writes logs to stdout/stderr. In Docker, configure logging driver or forward to your log aggregator.
- For production, consider adding structured logging and request/correlation ids (see production-readiness list).
- The Dockerfile sets `ENV logging=normal`; you can override with `--logging=...` or env in the entrypoint.

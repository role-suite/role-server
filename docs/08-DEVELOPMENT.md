# 8. Development

## Prerequisites

- **Dart SDK** 3.8+ (e.g. from [dart.dev](https://dart.dev) or Flutter SDK).
- **Serverpod CLI:** `dart pub global activate serverpod_cli` (optional; you can use `dart run serverpod` from the server package).
- For database mode: **Docker** (for Postgres + Redis via `docker compose`) or local Postgres/Redis.

## Local Setup with Database

1. **Clone and enter server package:**

   ```bash
   cd role-server/relay_server_server
   ```

2. **Install dependencies and generate code:**

   ```bash
   dart pub get
   dart run serverpod generate
   ```

3. **Config (with DB):**

   ```bash
   cp config/development.yaml.example config/development.yaml
   cp config/passwords.yaml.example config/passwords.yaml
   ```

   Edit `config/development.yaml` if your Postgres/Redis are on different host/port. Edit `config/passwords.yaml` and set `databasePassword` to match your Postgres password.

4. **Start Postgres and Redis:**

   From repo root:

   ```bash
   docker compose up --build --detach
   ```

5. **Run migrations and start server:**

   ```bash
   dart bin/main.dart --apply-migrations
   ```

6. **Verify:** Open `http://localhost:8082/workspace` (GET); you should get JSON (empty workspace if no auth or user 0). In the Röle app, set API base URL to `http://localhost:8082`.

## Local Setup without Database

1. **Generate and config (no DB):**

   ```bash
   cd role-server/relay_server_server
   dart pub get
   dart run serverpod generate
   cp config/development_local.yaml.example config/development.yaml
   ```

2. **Start server in-memory:**

   ```bash
   RELAY_USE_IN_MEMORY=1 dart bin/main.dart
   ```

   Do **not** run `--apply-migrations`. Data is lost on restart.

3. **Optional API keys:** Create `.env` with e.g. `RELAY_API_KEYS=dev-key` and load it (e.g. `export $(cat .env | xargs)` or use a tool that injects env). Then use `Authorization: Bearer dev-key` in requests.

## Code Generation (Serverpod)

After changing:

- Protocol (`.spy.yaml` files under `lib/src/features/*/models/`),
- Endpoints (adding/renaming endpoint classes),

run:

```bash
cd relay_server_server
dart run serverpod generate
```

This updates:

- `lib/src/generated/protocol.dart` (and related generated code),
- `lib/src/generated/endpoints.dart`,
- Test tools under `test/integration/test_tools/`.

To create a new migration after table changes:

```bash
dart run serverpod create-migration
```

## Code Layout (relay_server_server)

| Path | Purpose |
|------|---------|
| `bin/main.dart` | Entrypoint; calls `run(args)` from `server.dart`. |
| `lib/server.dart` | Serverpod init, auth handler, web route registration. |
| `lib/src/core/` | Shared auth and session: `api_key_auth.dart`, `session_helper.dart`. |
| `lib/src/features/workspace/` | Workspace REST route, endpoint, repository, JSON conversion, in-memory store. |
| `lib/src/features/collections/` | Collections endpoint, repository, in-memory store, models. |
| `lib/src/features/requests/` | Requests endpoint, repository, in-memory store, models. |
| `lib/src/features/environments/` | Environments endpoint, repository, in-memory store, models. |
| `lib/src/generated/` | Generated protocol and endpoints (do not edit by hand). |

Conventions:

- **Endpoints:** One class per feature (e.g. `WorkspaceEndpoint`). Methods take `Session` first, then args. Use `SessionHelper.getUserId(session)` for user scope.
- **Repositories:** Static methods; switch on `InMemory*Store.useInMemory` to use either DB or in-memory store.
- **Models:** Defined in `.spy.yaml`; table classes have `table: <name>` and optional `indexes:`.

## Testing

- **Unit/Integration:** Tests live under `relay_server_server/test/`. Example: `test/integration/greeting_endpoint_test.dart` uses `withServerpod` from `test_tools/serverpod_test_tools.dart`.
- **Run tests:**

  ```bash
  cd relay_server_server
  dart test
  ```

- After changing endpoints or protocol, run `serverpod generate` so test tools stay in sync.

## Linting and Formatting

- **Analyzer:**

  ```bash
  dart analyze lib/
  ```

- **Format:**

  ```bash
  dart format lib/ test/
  ```

Lint rules are in `analysis_options.yaml` (include `package:lints/recommended.yaml` and project rules).

## relay_server_client

The client package (`relay_server_client/`) holds the shared protocol (models) for the Flutter app. It is updated when you run code generation that affects the protocol; the server does not depend on the client at runtime. If the Röle app uses this client, ensure the client package version matches the server’s protocol.

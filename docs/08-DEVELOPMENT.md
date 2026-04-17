# 8. Development

## Prerequisites

- **Dart SDK** 3.8+
- **Serverpod CLI** (project currently pinned to `3.4.3`)
- **Docker** (recommended local Postgres/Redis via compose)

## Local Setup with Database

1. **Enter server package:**

   ```bash
   cd relay_server_server
   ```

2. **Install dependencies and generate code:**

   ```bash
   dart pub get
   serverpod generate
   ```

3. **Config:**

   ```bash
   cp config/development.yaml.example config/development.yaml
   cp config/passwords.yaml.example config/passwords.yaml
   ```

   Edit `config/development.yaml` if your Postgres/Redis are on different host/port. Edit `config/passwords.yaml` and set `databasePassword` to match your Postgres password.

4. **Start Postgres and Redis:**

   From repo root (`role-serverpod`):

   ```bash
   docker compose up --build --detach
   ```

5. **Run migrations and start server:**

   ```bash
   dart bin/main.dart --apply-migrations
   ```

6. **Run server (normal):**

   ```bash
   dart bin/main.dart
   ```

## Authentication Setup

- Access token validation uses `RELAY_AUTH_TOKEN_SECRET` (optional in local dev; set explicitly for shared/staging/prod environments).
- Runs policy knobs:
  - `RELAY_RUNNER_ALLOW_PRIVATE_NETWORK` (`false` by default)
  - `RELAY_RUNNER_MAX_RESPONSE_BYTES` (defaults to `1048576`)

## Code Generation (Serverpod)

After changing protocol models or endpoint signatures, run:

```bash
serverpod generate
```

This updates:

- `lib/src/generated/protocol.dart` (and related generated code),
- `lib/src/generated/endpoints.dart`,
- generated client protocol under `../relay_server_client/lib/src/protocol/`.

To create a new migration after table changes:

```bash
serverpod create-migration
```

## Code Layout (relay_server_server)

| Path | Purpose |
|------|---------|
| `bin/main.dart` | Entrypoint; calls `run(args)` from `server.dart`. |
| `lib/server.dart` | Serverpod init and authentication handler wiring. |
| `lib/src/core/` | Auth context, guards, domain exceptions, shared utilities. |
| `lib/src/features/auth/` | Auth endpoint, services, repositories, models. |
| `lib/src/features/workspaces/` | Workspace/team endpoint, services, repositories, models. |
| `lib/src/features/collections/` | Collection hierarchy endpoint, services, repositories, models. |
| `lib/src/features/environments/` | Environment/variable endpoint, services, repositories, models. |
| `lib/src/features/import_export/` | Import/export endpoint, services, repositories, models. |
| `lib/src/features/runs/` | Run execution endpoint, orchestration services, repositories, models. |
| `lib/src/generated/` | Generated protocol and endpoints (do not edit by hand). |

Conventions:

- **Endpoints:** One class per feature (`AuthEndpoint`, `WorkspacesEndpoint`, etc.), `Session` first arg.
- **Services:** Business rules and authorization checks.
- **Repositories:** DB access only.
- **Models:** Defined in `.spy.yaml`; persistent models declare `table:`.

## Testing

- Tests live under `relay_server_server/test/` (current focus is unit-level hardening).
- Run tests:

  ```bash
  dart test
  ```

- Run analyzer:

  ```bash
  dart analyze
  ```

## Linting and Formatting

- Format:

  ```bash
  dart format lib/ test/
  ```

Lint rules are in `analysis_options.yaml` (include `package:lints/recommended.yaml` and project rules).

## relay_server_client

The `relay_server_client/` package contains generated endpoint refs and protocol models used by Flutter or other Dart clients. Regenerate from server package whenever endpoint signatures or `.spy.yaml` models change.

# 7. Deployment

## Docker Compose (Postgres + Redis)

From the **role-server** repository root:

```bash
docker compose up --build --detach
```

This starts:

- **Postgres** (image: `postgres:16-alpine`) on host port `8090` (container 5432), database `relay_server`, user `postgres`.
- **Redis** (image: `redis:7-alpine`) on host port `6379`.

Then, from `relay_server_server/`:

```bash
cp config/development.yaml.example config/development.yaml
cp config/passwords.yaml.example config/passwords.yaml
# Edit config/development.yaml if needed (e.g. host/port).
# Set databasePassword in config/passwords.yaml to match POSTGRES_PASSWORD (e.g. postgres).
dart run serverpod generate
dart bin/main.dart --apply-migrations
```

Migrations create/update the Serverpod tables (e.g. `stored_workspace`, `stored_collection`). After that, the server is running with database persistence.

## Running the Server (No Docker for the app)

From `relay_server_server/`:

**With database (Compose already up):**

```bash
dart bin/main.dart --apply-migrations
```

Or use the Serverpod script:

```bash
dart run serverpod start
```

**Without database (in-memory):**

```bash
cp config/development_local.yaml.example config/development.yaml
RELAY_USE_IN_MEMORY=1 dart bin/main.dart
```

Do **not** pass `--apply-migrations` when using in-memory mode.

## Docker Image (Server)

The server package includes a `Dockerfile` in `relay_server_server/`. Summary:

- **Build stage:** Dart 3.8, `dart pub get`, `dart compile exe bin/main.dart -o bin/server`.
- **Final stage:** Alpine; copies `bin/server`, `config/`, `web/`, `migrations/`, and generated `protocol.yaml`. Entrypoint: `./server --mode=$runmode --server-id=$serverid --logging=$logging --role=$role`.

**Note:** The Dockerfile copies `COPY --from=build /runtime/`. With `dart compile exe`, the binary is self-contained; if `/runtime/` is missing in your Dart version, remove or adjust that line and ensure the executable runs in the container.

To build and run the server in Docker (example; adjust network and env):

```bash
cd relay_server_server
docker build -t relay-server .
# Ensure config and passwords are available (e.g. bind mount or env).
docker run -p 8080:8080 -p 8082:8082 -e runmode=production --env-file .env relay-server
```

For production, use a proper production config (and optionally Compose or Kubernetes) so the container connects to your Postgres and Redis with correct credentials.

## Migrations

- **Generate migrations:** After changing `.spy.yaml` (adding/removing/altering table classes), run from `relay_server_server/`:

  ```bash
  dart run serverpod create-migration
  ```

  New migration files appear under `migrations/`.

- **Apply migrations:** Run the server with `--apply-migrations` (or equivalent in your deployment). Migrations are applied on startup when the database is configured.

- **Git:** The `migrations/` directory is gitignored by default. Options: (1) Generate migrations in CI/build and bake them into the image, or (2) Remove `migrations/` from `.gitignore` and commit migrations so they are always in the image.

## Production Checklist

- [ ] Use `config/production.yaml` with `publicScheme: https`, correct `publicHost`/`publicPort`, and real database/Redis hosts.
- [ ] Use strong, non-default passwords in `passwords.yaml` (production key); prefer secrets manager or env-injected secrets.
- [ ] Do **not** set `RELAY_USE_IN_MEMORY` in production.
- [ ] Set `RELAY_API_KEYS` to a comma-separated list of strong API keys.
- [ ] Serve over HTTPS (reverse proxy or Serverpod TLS).
- [ ] Run the server as a non-root user in the container.
- [ ] Ensure migrations are applied on deploy (e.g. `--apply-migrations` or a separate migration job).

## Health and Readiness

The server does not currently expose a dedicated `/health` or `/ready` endpoint. For load balancers or Kubernetes, you can:

- Use Serverpod’s built-in health if available (see Serverpod docs), or
- Add a small route (e.g. GET `/health`) that returns 200 and optionally checks DB connectivity.

This is recommended for production (see project production-readiness list).

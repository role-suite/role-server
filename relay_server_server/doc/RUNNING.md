# Running the Relay Server (and Röle client)

This guide is for anyone who wants to run the **Relay Server** (Serverpod backend) and, optionally, the **Röle** API client that uses it.

---

## What you need

- **Dart SDK** 3.8 or later ([dart.dev](https://dart.dev/get-dart))
- **Serverpod CLI** (for code generation; optional if you only run pre-built code)
  ```bash
  dart pub global activate serverpod_cli
  ```
- **Docker & Docker Compose** (only if you run with PostgreSQL and Redis; see below)
- **Röle (relay) project** (only if you want to run the Flutter client; [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.9+)

---

## 1. Run the Relay Server only

The Relay Server is the backend that provides workspace sync for Röle. **Workspace data is persisted in PostgreSQL**; you need a database (and migrations) for the workspace endpoints to work.

### 1.1 After cloning the repo

1. **Generate code** (generated files are not in Git):
   ```bash
   cd relay_server_server
   serverpod generate
   ```
2. **Copy config examples** and set passwords:
   ```bash
   cp config/development.yaml.example config/development.yaml   # adjust if needed
   cp config/passwords.yaml.example config/passwords.yaml     # set real database password
   ```
3. Then follow **1.2** to start PostgreSQL/Redis and run the server with `--apply-migrations`.

### 1.2 With PostgreSQL and Redis (required for workspace sync)

For a proper setup (e.g. persistence, or when you add auth/database later), you need PostgreSQL and Redis. The easiest way is with Docker Compose.

1. **Start Postgres and Redis** using the repo’s `docker-compose.yaml` (in the **role-server** root):

   ```bash
   cd /path/to/role-server
   docker compose up --build --detach
   ```

2. **Create server config** (if not already present). Under `relay_server_server/`:

   - Copy **`config/development.yaml.example`** to **`config/development.yaml`** and adjust (host, port, database name).
   - Copy **`config/passwords.yaml.example`** to **`config/passwords.yaml`** and set the real database password. Do not commit `passwords.yaml`.

3. **Run the server** (from `relay_server_server/`):
   ```bash
   dart pub get
   dart bin/main.dart --apply-migrations
   ```

When you are done, stop the containers:

```bash
docker compose stop
```

### 1.3 Run without Postgres or Docker (in-memory only)

If you don’t have PostgreSQL or Docker, you can run the server with **in-memory** workspace storage. Data is lost when the server stops.

1. **Generate code** (if not done):
   ```bash
   cd relay_server_server
   serverpod generate
   ```

2. **Use the no-database config:**
   ```bash
   cp config/development_local.yaml.example config/development.yaml
   ```

3. **Run the server** (do **not** use `--apply-migrations`):
   ```bash
   dart pub get
   RELAY_USE_IN_MEMORY=1 dart bin/main.dart
   ```

   On Windows (PowerShell):
   ```powershell
   $env:RELAY_USE_IN_MEMORY="1"; dart bin/main.dart
   ```

4. In the Röle app, set API base URL to `http://localhost:8080`.

---

## 2. Run the Röle (Flutter) client

Röle is the API testing client that can sync its workspace with this server.

1. **Open the Röle project** (e.g. the `relay` app):
   ```bash
   cd /path/to/relay
   ```

2. **Add the Relay Server client dependency** in `pubspec.yaml`:
   ```yaml
   dependencies:
     relay_server_client:
       path: /path/to/role-server/relay_server_client
   ```
   Replace `/path/to/role-server` with the real path to the **role-server** repo.

3. **Install and run:**
   ```bash
   flutter pub get
   flutter run -d macos   # or windows, linux, android, ios
   ```

4. **Point Röle at your server:**  
   In Röle’s sync/settings, set the server URL to where the Relay Server is running, e.g.:
   - Local: `http://localhost:8080/`
   - Same machine, mobile emulator: often `http://10.0.2.2:8080/` (Android) or `http://localhost:8080/` (iOS sim).
   - Other device on the same network: `http://<your-machine-ip>:8080/`

Röle will use the **workspace** endpoint (`pullWorkspace` / `pushWorkspace`) for sync when you enable that feature and configure the server URL.

---

## 3. Run the server with Docker

You can build and run the server itself in Docker (for production-like runs).

1. **Build the image** (from `relay_server_server/`):
   ```bash
   docker build -t relay-server .
   ```

2. **Run the container** (example; adjust ports and env if you use external Postgres/Redis):
   ```bash
   docker run -p 8080:8080 -p 8081:8081 -p 8082:8082 relay-server
   ```

For a full deployment you would typically:
- Use a `docker-compose` that starts Postgres, Redis, and the server.
- Mount or inject `config/` and secrets (e.g. `passwords.yaml`) instead of baking them into the image.

---

## 4. Ports and URLs

| Service        | Default port | Purpose        |
|----------------|-------------:|----------------|
| API (HTTP)     | 8080         | Client requests (e.g. Röle) |
| Web / other    | 8081, 8082   | Used by Serverpod internally |

Use the **API base URL** in the Röle client, e.g. `http://localhost:8080/`.

---

## 5. Troubleshooting

- **“Connection refused” from Röle**  
  - Check the server is running (`dart bin/main.dart` or Docker).  
  - Confirm the URL in Röle (no trailing path except `/`), and that the port (e.g. 8080) matches.  
  - On emulators, use the host IP (e.g. `10.0.2.2` for Android) instead of `localhost` if needed.

- **Server fails to start: “database” or “config”**  
  - If you run **without** Docker: the server may still need a minimal `config/development.yaml` (and possibly `config/passwords.yaml`) depending on your Serverpod version. Create them as in section 1.2, or see [Serverpod configuration](https://docs.serverpod.dev/concepts/configuration).  
  - If you run **with** Docker Compose: ensure Postgres and Redis are up (`docker compose ps`) and that host/port in `config/development.yaml` match the Compose ports (e.g. 8090 for Postgres).

- **“Package not found” for `relay_server_client` in Röle**  
  - Run `flutter pub get` in the Röle project.  
  - Ensure the `path` in `pubspec.yaml` points to the correct `relay_server_client` folder inside the **role-server** repo.

- **Changing server code (endpoints or protocol)**  
  - From the **relay_server_server** directory run:
    ```bash
    serverpod generate
    ```
  - Regenerate/update the client if you use a separate client package; then in Röle run `flutter pub get` again.

---

## 6. Next steps

- **Backend design and API:** see [BACKEND_STRUCTURE_AND_API.md](BACKEND_STRUCTURE_AND_API.md).  
- **Serverpod docs:** [docs.serverpod.dev](https://docs.serverpod.dev).  
- **Röle app:** see the Röle project’s README for building and running the Flutter app.

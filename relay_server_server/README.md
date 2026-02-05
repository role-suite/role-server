# relay_server_server

Serverpod backend for Röle (relay) API client. Provides workspace sync (pull/push) with persistence in PostgreSQL.

**Quick start (after clone):**

1. Generate code: `serverpod generate`
2. Copy config: `cp config/development.yaml.example config/development.yaml` and `cp config/passwords.yaml.example config/passwords.yaml` (set DB password)
3. From repo root: `docker compose up --build --detach`
4. Run server: `dart bin/main.dart --apply-migrations`

**Run locally without Postgres or Docker**

If you don’t have Postgres or Docker, you can run the server with in-memory workspace storage (data is lost when the server stops):

1. Generate code: `serverpod generate` (if not done)
2. Use the no-DB config: `cp config/development_local.yaml.example config/development.yaml`
3. From `relay_server_server/`:  
   `RELAY_USE_IN_MEMORY=1 dart bin/main.dart`  
   (Do **not** use `--apply-migrations`; no database is used.)

Then open the Röle app and set API base URL to `http://localhost:8080`.

**Using the Röle (role-client) app with this server**

The server exposes **GET** and **PUT** `/workspace` so the Flutter client can sync without the Serverpod RPC client. In the Röle app:

1. Open the drawer → choose **API** as data source.
2. Set **API base URL** to your server (e.g. `http://localhost:8080` with no trailing path).
3. Optionally set an API key (Bearer token). The app will call `GET /workspace` to load and `PUT /workspace` to save.

See [doc/RUNNING.md](doc/RUNNING.md) for full instructions and [doc/BACKEND_STRUCTURE_AND_API.md](doc/BACKEND_STRUCTURE_AND_API.md) for structure and API.

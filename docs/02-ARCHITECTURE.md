# 2. Architecture

## High-Level Flow

```
                    ┌─────────────────────────────────────────────────────────┐
                    │                    role-server                           │
                    │  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐ │
  Röle app          │  │ Web server  │  │ API server  │  │ PostgreSQL (opt.)  │ │
  (or any client)   │  │ :8082       │  │ :8080      │  │ Redis               │ │
       │            │  │ GET/PUT     │  │ RPC        │  │                     │ │
       │  HTTP      │  │ /workspace  │  │ endpoints  │  └──────────┬──────────┘ │
       └────────────┼─►│             │  │            │             │            │
                    │  └──────┬──────┘  └─────┬──────┘             │            │
                    │         │               │                    │            │
                    │         ▼               ▼                    ▼            │
                    │  ┌──────────────────────────────────────────────────────┐ │
                    │  │  Auth: ApiKeyAuth (Bearer → userId) / SessionHelper    │ │
                    │  └──────────────────────────────────────────────────────┘ │
                    │         │               │                    │            │
                    │         ▼               ▼                    ▼            │
                    │  ┌─────────────┐  ┌─────────────────────────────────────┐ │
                    │  │ Workspace   │  │ Repositories (Workspace, Collection, │ │
                    │  │ Route       │  │ Request, Environment)                │ │
                    │  │ + JSON      │  │ → DB tables or InMemory* stores       │ │
                    │  └─────────────┘  └─────────────────────────────────────┘ │
                    └─────────────────────────────────────────────────────────┘
```

## Components

### 1. Entrypoint and Server Init

- **`bin/main.dart`**: Calls `run(args)` from `server.dart`.
- **`lib/server.dart`**: Creates `Serverpod(args, Protocol(), Endpoints(), authenticationHandler: ...)`, registers `WorkspaceRoute` on the web server at `/workspace`, then starts the pod. The authentication handler is only set when `RELAY_API_KEYS` is non-empty.

### 2. Authentication and User Identity

- **`lib/src/core/api_key_auth.dart`**: Reads `RELAY_API_KEYS` (comma-separated), validates the Bearer token, and returns Serverpod `AuthenticationInfo` with a stable string user identifier (1-based index). Used as the pod’s `authenticationHandler`.
- **`lib/src/core/session_helper.dart`**: Provides `SessionHelper.getUserId(session)` used by all features. Returns the integer user id from `session.authenticated?.userIdentifier` (or 0 if unauthenticated).

See [04-AUTHENTICATION.md](04-AUTHENTICATION.md) for details.

### 3. REST: Workspace Route

- **`lib/src/features/workspace/workspace_route.dart`**: Handles `GET` and `PUT` `/workspace`.
  - **GET**: Requires auth when API keys are configured; returns the current user’s workspace as JSON (or empty workspace).
  - **PUT**: Requires auth when API keys are configured; accepts JSON body, parses via `workspace_json.dart`, overwrites the user’s workspace.
- **`lib/src/features/workspace/workspace_json.dart`**: Converts between server `WorkspaceBundle` and the JSON shape expected by the Röle client (collections with requests, environments, version, exportedAt, source).

### 4. RPC Endpoints

All endpoints use `SessionHelper.getUserId(session)` and delegate to the corresponding repository.

| Endpoint class | Path/name | Purpose |
|----------------|------------|---------|
| `WorkspaceEndpoint` | `workspace` | `pullWorkspace`, `pushWorkspace` (full workspace) |
| `CollectionsEndpoint` | `collections` | CRUD for collections (list, get, create, update, delete) |
| `RequestsEndpoint` | `requests` | CRUD for requests (scoped by collection) |
| `EnvironmentsEndpoint` | `environments` | CRUD for environments (list, get, create, update, delete) |

### 5. Repositories and Storage

Repositories abstract over **database tables** (when Postgres is used) and **in-memory stores** (when `RELAY_USE_IN_MEMORY=1`).

- **WorkspaceRepository**: One workspace blob per user (`StoredWorkspace` or `InMemoryWorkspaceStore`).
- **CollectionRepository**: Collections per user (`StoredCollection` or `InMemoryCollectionStore`).
- **RequestRepository**: Requests per user and collection (`StoredRequest` or `InMemoryRequestStore`).
- **EnvironmentRepository**: Environments per user (`StoredEnvironment` or `InMemoryEnvironmentStore`).

The REST `/workspace` and RPC `WorkspaceEndpoint` use only **WorkspaceRepository** (single blob). The other endpoints use the per-entity repositories; workspace push overwrites the blob and does not necessarily sync with the normalized tables (design choice: REST sync is blob-based).

### 6. Protocol and Code Generation

- **Protocol**: Defined by `.spy.yaml` files under `lib/src/features/*/models/`. Serverpod generates Dart classes and (for table classes) database accessors under `lib/src/generated/`.
- **Endpoints**: Registered in Serverpod’s `Endpoints()`; endpoint classes live in `lib/src/features/*/` and are discovered by the generator.
- **Migrations**: Created with `serverpod create-migration` and applied with `--apply-migrations`. Migrations are stored under `migrations/` (gitignored by default; see [07-DEPLOYMENT.md](07-DEPLOYMENT.md)).

## Data Flow Examples

### REST: Client fetches workspace

1. Client sends `GET /workspace` with `Authorization: Bearer <key>` (if API keys are set).
2. Web server invokes `WorkspaceRoute.handleCall`. If auth is required and missing → 401.
3. `ApiKeyAuth.validateToken` (already run by Serverpod for the request) has set `session.authenticated`; `SessionHelper.getUserId(session)` returns the user id.
4. `WorkspaceRepository.getByUserId(session, userId)` returns the stored `WorkspaceBundle` or null.
5. Route serializes bundle to client JSON and returns 200 + JSON or empty workspace.

### RPC: Client creates a collection

1. Client calls `collections.create(session, collection)` with a valid auth key.
2. Serverpod invokes `CollectionsEndpoint.create`. `SessionHelper.getUserId(session)` gives the user id.
3. `CollectionRepository.create(session, userId, collection)` writes to `StoredCollection` (or in-memory store).
4. Returns (no content) or error.

### In-memory vs database

- If `RELAY_USE_IN_MEMORY=1`, every repository uses the corresponding `InMemory*Store` and no DB/Redis is used.
- Otherwise, repositories use `*\.db` accessors on the generated protocol (e.g. `StoredWorkspace.db.findFirstRow`), and Serverpod uses `config/development.yaml` (or production config) for Postgres and Redis.

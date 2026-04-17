## Serverpod Rebuild Plan (Current Branch, No Backup)

### Scope
- Delete the current Serverpod implementation and rebuild from scratch on the current branch.
- Do not create a backup branch, tag, or archive.
- Implement a Serverpod-native architecture with Serverpod endpoint names.

### 1) Hard reset scope (delete old app implementation)
- Remove old server implementation under:
  - `relay_server_server/lib/src/core/*`
  - `relay_server_server/lib/src/features/*`
  - `relay_server_server/lib/server.dart` (rewrite)
- Remove existing protocol model files tied to the old design:
  - old `.spy.yaml` files under feature model folders
- Remove outdated tests/docs for old endpoint sets:
  - `relay_server_server/test/integration/*` (except reusable test tooling)
  - outdated sections in `docs/*`

### 2) Create clean Serverpod architecture
- Recreate feature folders:
  - `auth`, `workspaces`, `collections`, `environments`, `runs`, `import_export`
- Recreate shared core folders:
  - `lib/src/core/auth`, `lib/src/core/errors`, `lib/src/core/guards`, `lib/src/core/pagination`
- Rebuild `relay_server_server/lib/server.dart` and register only new endpoints.

### 3) Protocol-first domain redesign (`.spy.yaml`)
- Define models/enums for:
  - workspace domain: workspace, membership, invitation, event
  - collections: collection, folder, endpoint, endpoint_example
  - environments: environment, environment_variable
  - runs: run, run_request_snapshot, run_response_snapshot, run_error
  - import/export: import_export_job
  - auth support DTOs for typed endpoint calls
- Use Serverpod typed returns and exceptions (no Node envelope responses).

### 4) Generate code + migrations
- Run `serverpod generate`.
- Create migrations from the new models.
- Validate migration application on a clean DB.
- Ensure generated client protocol contains all new types/endpoints.

### 5) Implement shared domain services
- Build repositories (DB access), services (business logic), and guards (auth/role).
- Centralize role logic (`owner`, `admin`, `member`) and domain exceptions.
- Keep business logic out of endpoint classes.

### 6) Implement endpoints (Serverpod names only)
- `auth`: register/login/refresh/logout/me
- `workspaces`: CRUD + memberships + invitations + updates + convert/leave
- `collections`: collections/folders/endpoints/examples CRUD
- `environments`: environments/variables CRUD
- `importExport`: create/list/get jobs
- `runs`: create/get/cancel run

### 7) Port Node business rules
- Preserve behavior for:
  - permission boundaries
  - conflict/not-found validation behavior
  - invitation and last-owner edge cases
  - strict workspace scoping for all resources
- Keep implementation idiomatic to Dart + Serverpod.

### 8) Port runs engine to Dart services
- Implement planning, variable/auth resolution, policy checks, execution, persistence.
- Add cancellation and typed run error mapping.
- Apply secure defaults (timeout, payload limits, network restrictions/redaction).

### 9) Testing
- Rebuild integration tests for all six endpoint modules.
- Add focused unit tests for:
  - role guards
  - invitation/ownership edge cases
  - run policy and failure paths
- Validate migrations and startup end-to-end.

### 10) Docs rewrite
- Update:
  - `docs/03-API-REFERENCE.md`
  - `docs/05-DATA-MODEL.md`
  - `docs/08-DEVELOPMENT.md`
- Remove references to old endpoint sets and old compatibility strategy.

## Execution Order
1. Nuke old implementation
2. Define protocol models
3. Generate code + migrations
4. Auth + Workspaces
5. Collections + Environments
6. ImportExport
7. Runs engine
8. Tests + docs

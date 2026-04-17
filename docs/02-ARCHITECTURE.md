# 2. Architecture

## High-Level Structure

```
Client (RPC)
   │
   ▼
Serverpod Endpoint Layer
   │
   ▼
Feature Service Layer (business rules, role checks)
   │
   ▼
Repository Layer (DB access only)
   │
   ▼
PostgreSQL tables (generated from .spy.yaml)
```

## Core Principles

- Endpoint classes stay thin and delegate to services.
- Services enforce authorization and domain rules.
- Repositories isolate persistence concerns.
- Protocol and table models are generated from `.spy.yaml` definitions.

## Runtime Wiring

- `bin/main.dart` calls `run(args)` in `lib/server.dart`.
- `lib/server.dart` creates `Serverpod(args, Protocol(), Endpoints(), authenticationHandler: ...)`.
- Custom auth token validation is wired through `AccessTokenAuth.validateToken`.

## Core Modules

- `lib/src/core/auth/` – auth context + token validator
- `lib/src/core/guards/` – auth/workspace role guards
- `lib/src/core/errors/` – domain exception primitives
- `lib/src/core/pagination/` – shared paging utility

## Feature Modules

- `auth` – register/login/refresh/logout/me
- `workspaces` – workspace lifecycle, members, invitations, events
- `collections` – collections, folders, endpoints, endpoint examples
- `environments` – environments and variables
- `import_export` – import/export jobs
- `runs` – run orchestration, policy, execution, snapshots

## Code Generation and Migrations

- Protocol + endpoint registry are generated into `lib/src/generated/`.
- Client stubs/protocol are generated into `relay_server_client/lib/src/protocol/`.
- Schema changes are handled through `serverpod create-migration` and `--apply-migrations`.

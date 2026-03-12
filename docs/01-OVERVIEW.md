# 1. Project Overview

## Purpose

**role-server** is the backend for the **Röle** (relay) API client. It provides:

- **Workspace sync**: Store and retrieve a user's full workspace (collections, API requests, environments) so the Röle Flutter app can use "API" as a data source instead of (or in addition to) local storage.
- **Multi-user isolation**: With API keys, each key maps to a distinct user id; with email login, each account has a stable user id. Data is strictly isolated per user.
- **Dual access**: Clients can sync via **REST** (`GET`/`PUT` `/workspace`) for simple integration, or via **Serverpod RPC** for fine-grained CRUD on collections, requests, and environments.

The server does **not** execute HTTP requests (e.g. it does not run the requests defined in the workspace). It only persists and serves workspace data.

## Technology Stack

| Layer | Technology |
|-------|------------|
| Runtime | Dart 3.8+ |
| Framework | [Serverpod](https://serverpod.dev) 3.2.x |
| Database | PostgreSQL 16 (optional; can run in-memory for dev) |
| Cache/Session | Redis 7 (used by Serverpod when database is configured) |
| Client | Röle Flutter app (role-client); any HTTP client for REST |

## Repository Layout

```
role-server/
├── docs/                    # This documentation
├── docker-compose.yaml      # Postgres + Redis for local/prod
├── relay_server_server/     # Serverpod server (main backend)
│   ├── bin/main.dart        # Entrypoint
│   ├── config/              # YAML config (development, passwords)
│   ├── lib/
│   │   ├── server.dart      # Serverpod init, routes, auth
│   │   └── src/
│   │       ├── core/        # ApiKeyAuth, SessionHelper
│   │       ├── features/    # auth (email IDP, JWT refresh), workspace, collections, requests, environments
│   │       └── generated/   # Serverpod-generated (protocol, endpoints)
│   ├── pubspec.yaml
│   ├── test/
│   └── ...
├── relay_server_client/     # Serverpod client (generated + shared protocol)
│   └── lib/src/protocol/    # Shared models for client apps
└── README.md
```

- **relay_server_server**: All server logic, REST route, RPC endpoints, repositories, and in-memory stores. Generated code lives under `lib/src/generated/` and is produced by `serverpod generate`.
- **relay_server_client**: Publishes the protocol (models) so the Flutter app or other clients can use the same types. The server does not depend on the client package at runtime.

## Ports (Default)

| Port | Service |
|------|---------|
| 8080 | Serverpod API server (RPC) |
| 8081 | Serverpod internal (e.g. streaming) |
| 8082 | Web server (REST `/workspace` and static assets) |
| 8090 | PostgreSQL (host; container exposes 5432) |
| 6379 | Redis |

The Röle app points to the **web server** base URL (e.g. `http://localhost:8082`) for REST; no path suffix (e.g. not `/workspace` in the base URL).

## Key Concepts

- **User id**: An integer derived from the current request. With **API keys** (`RELAY_API_KEYS`), it is the 1-based index of the valid Bearer token. With **email login**, it is derived from the authenticated user’s UUID. Otherwise it is `0`. All persisted data is keyed by this id. See [04-AUTHENTICATION.md](04-AUTHENTICATION.md).
- **Workspace**: A single blob per user containing collections (with their requests) and environments. Synced in full via `GET`/`PUT` `/workspace` or built from CRUD tables and exposed via `pullWorkspace` / `pushWorkspace`.
- **In-memory mode**: When `RELAY_USE_IN_MEMORY=1`, the server uses no database; all data is in process memory and is lost on restart. Used for local development without Docker/Postgres.

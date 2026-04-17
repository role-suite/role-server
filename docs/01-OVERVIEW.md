# 1. Project Overview

## Purpose

`role-serverpod` is a Serverpod backend for the Röle ecosystem. It provides:

- typed auth/session flows
- multi-user workspace/team management
- API collection and environment management
- import/export job tracking
- HTTP request run execution with persisted snapshots

The project is now Serverpod RPC-first. The old REST `/workspace` sync model is no longer part of the active architecture.

## Stack

| Layer | Technology |
|------|------------|
| Runtime | Dart 3.8+ |
| Framework | Serverpod 3.4.x |
| Database | PostgreSQL (primary persistence) |
| Infra | Redis (Serverpod runtime needs) |
| Client package | `relay_server_client` (generated endpoint refs + protocol models) |

## Repository Layout

```
role-serverpod/
├── docs/
├── docker-compose.yaml
├── relay_server_server/
│   ├── bin/main.dart
│   ├── config/
│   ├── lib/
│   │   ├── server.dart
│   │   └── src/
│   │       ├── core/
│   │       ├── features/
│   │       └── generated/
│   └── test/
└── relay_server_client/
    └── lib/src/protocol/
```

## Current Feature Modules

- `auth`
- `workspaces`
- `collections`
- `environments`
- `importExport`
- `runs`

## Default Ports

| Port | Service |
|------|---------|
| 8080 | Serverpod API (RPC) |
| 8081 | Serverpod internal |
| 8082 | Web server (static/web routes if configured) |
| 8090 | Postgres host port (compose setup) |
| 6379 | Redis |

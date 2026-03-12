# role-server Technical Documentation

This folder contains detailed technical documentation for maintaining and operating the **role-server** project (Röle relay API backend).

## Documentation Index

| Document | Description |
|----------|-------------|
| [01-OVERVIEW.md](01-OVERVIEW.md) | Project purpose, stack, and repository layout |
| [02-ARCHITECTURE.md](02-ARCHITECTURE.md) | High-level architecture, components, and data flow |
| [03-API-REFERENCE.md](03-API-REFERENCE.md) | REST and RPC API reference with request/response shapes |
| [04-AUTHENTICATION.md](04-AUTHENTICATION.md) | Email login/register, API key auth, SessionHelper, and security |
| [05-DATA-MODEL.md](05-DATA-MODEL.md) | Protocol types, database tables, and JSON formats |
| [06-CONFIGURATION.md](06-CONFIGURATION.md) | Config files, environment variables, and run modes |
| [07-DEPLOYMENT.md](07-DEPLOYMENT.md) | Docker, production deployment, and migrations |
| [08-DEVELOPMENT.md](08-DEVELOPMENT.md) | Local setup, code generation, testing, and code layout |
| [09-MAINTENANCE.md](09-MAINTENANCE.md) | Operations, troubleshooting, and extending the project |

## Quick Links by Task

- **Run locally (with DB):** [08-DEVELOPMENT.md#local-setup-with-database](08-DEVELOPMENT.md#local-setup-with-database)
- **Run locally (no DB):** [08-DEVELOPMENT.md#local-setup-without-database](08-DEVELOPMENT.md#local-setup-without-database)
- **Enable API key auth:** [04-AUTHENTICATION.md#configuring-api-keys](04-AUTHENTICATION.md#configuring-api-keys)
- **Deploy to production:** [07-DEPLOYMENT.md](07-DEPLOYMENT.md)
- **Add a new endpoint:** [09-MAINTENANCE.md#adding-a-new-endpoint](09-MAINTENANCE.md#adding-a-new-endpoint)
- **Change the data model:** [09-MAINTENANCE.md#changing-the-data-model](09-MAINTENANCE.md#changing-the-data-model)

## Conventions

- **role-server** = this Git repository (monorepo root).
- **relay_server_server** = the Serverpod Dart server package (`relay_server_server/`).
- **relay_server_client** = the generated Serverpod client package (`relay_server_client/`).
- **Röle** / **role-client** = the Flutter app that consumes this API.

All paths in the docs are relative to the **role-server** repository root unless stated otherwise.

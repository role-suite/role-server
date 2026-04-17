<p align="center">
  <img src="assets/app_logo.png" alt="Röle Logo" width="120" height="120">
</p>

<h1 align="center">Röle Serverpod</h1>

<p align="center">
  <strong>Serverpod backend for workspaces, collections, environments, import/export, and request runs</strong>
</p>

<p align="center">
  <a href="#features">✨ Features</a> •
  <a href="#quick-start">⚡ Quick Start</a> •
  <a href="#local-database-docker">🐳 Local Database</a> •
  <a href="#api-overview">🧭 API Overview</a> •
  <a href="#documentation">📚 Documentation</a> •
  <a href="#security">🔒 Security</a> •
  <a href="#contributing">🤝 Contributing</a> •
  <a href="#license">📄 License</a>
</p>

---

## 🌟 Overview

<p align="center">
  role-serverpod is a Serverpod-first backend rebuilt from scratch. It provides typed RPC APIs for auth, workspace/team management, collections, environments, import/export jobs, and HTTP request runs with persisted snapshots and role-based access checks.
</p>

## ✨ Features

### ⚙️ Core

- Serverpod-native endpoint architecture (`auth`, `workspaces`, `collections`, `environments`, `importExport`, `runs`)
- Workspace model with memberships, invitations, roles, and event updates
- Collections with folders, endpoints, and endpoint examples
- Environments with variables and uniqueness checks
- Request runner with timeout/network policy controls and response snapshot persistence

### ✅ Quality

- Unit test suite for auth, guards, collections, environments, import/export, and runs policy utilities
- Service/repository separation with centralized domain exceptions

### 🧩 Platform

- PostgreSQL-backed persistence through Serverpod table models
- Protocol and client generation via `serverpod generate`
- Migration workflow via `serverpod create-migration`

## ⚡ Quick Start

1. Install server dependencies

```bash
cd relay_server_server
dart pub get
```

2. Create local config files

```bash
cp config/development.yaml.example config/development.yaml
cp config/passwords.yaml.example config/passwords.yaml
```

3. Generate code

```bash
serverpod generate
```

4. Apply migrations and run

```bash
dart bin/main.dart --apply-migrations
dart bin/main.dart
```

## 🐳 Local Database (Docker)

Start local Postgres + Redis from repository root:

```bash
docker compose up --build --detach
```

Then from `relay_server_server/` apply migrations:

```bash
dart bin/main.dart --apply-migrations
```

## 🧰 Scripts / Commands

- `serverpod generate`: regenerate endpoints/protocol
- `serverpod create-migration`: generate migration after table model changes
- `dart bin/main.dart --apply-migrations`: run server and apply pending migrations
- `dart analyze`: run static analysis
- `dart test`: run test suite

## 🔧 Environment Variables

- `RELAY_AUTH_TOKEN_SECRET`: signing/validation secret for access tokens
- `RELAY_RUNNER_ALLOW_PRIVATE_NETWORK`: allow private-network targets for runs (`true`/`false`, default blocked)
- `RELAY_RUNNER_MAX_RESPONSE_BYTES`: max persisted run response body bytes (default `1048576`)

## 🧭 API Overview

RPC modules exposed by Serverpod:

- `auth`: register, login, refresh, logout, me
- `workspaces`: CRUD, members, invitations, leave/convert, updates
- `collections`: collections, folders, endpoints, endpoint examples CRUD
- `environments`: environments and variables CRUD
- `runs`: create/get/list/cancel request runs
- `importExport`: create/list/get import/export jobs

See full method signatures in `docs/03-API-REFERENCE.md`.

## 📚 Documentation

- `docs/README.md`: documentation index
- `docs/01-OVERVIEW.md`: project overview
- `docs/02-ARCHITECTURE.md`: architecture and layers
- `docs/03-API-REFERENCE.md`: endpoint method reference
- `docs/04-AUTHENTICATION.md`: auth/token behavior
- `docs/05-DATA-MODEL.md`: protocol and table model overview
- `docs/06-CONFIGURATION.md`: config and environment variables
- `docs/07-DEPLOYMENT.md`: deployment workflow
- `docs/08-DEVELOPMENT.md`: development workflow
- `docs/09-MAINTENANCE.md`: maintenance and operations

## 🔒 Security

Please report security vulnerabilities privately. Do not open public issues for security-sensitive reports.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -m "Add feature"`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a pull request

## 📄 License

This project is licensed under the MIT License. See `LICENSE` for details.

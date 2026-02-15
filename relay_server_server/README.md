# relay_server_server

Serverpod backend for Röle (relay) API client. Provides workspace sync (pull/push) with persistence in PostgreSQL.

**Quick start (after clone):**

1. Generate code: `dart run serverpod_cli:serverpod_cli generate` (or `serverpod generate` if CLI is installed)
2. Copy config: `cp config/development.yaml.example config/development.yaml` and `cp config/passwords.yaml.example config/passwords.yaml` (set DB password and auth secrets; see **Email login/register** below)
3. From repo root: `docker compose up --build --detach`
4. Create and apply migrations: `dart run serverpod_cli:serverpod_cli create-migration` then `dart bin/main.dart --apply-migrations`

**Run locally without Postgres or Docker**

If you don’t have Postgres or Docker, you can run the server with in-memory storage for workspace, collections, environments, and requests (data is lost when the server stops):

1. Generate code: `dart run serverpod_cli:serverpod_cli generate` (if not done)
2. Use the no-DB config: `cp config/development_local.yaml.example config/development.yaml`
3. From `relay_server_server/`:  
   `RELAY_USE_IN_MEMORY=1 dart bin/main.dart`  
   (Do **not** use `--apply-migrations`; no database is used.)

Then open the Röle app and set API base URL to `http://localhost:8082` (web server; REST `/workspace`).

**Using the Röle (role-client) app with this server**

The server exposes:

- **RPC endpoints**: `collections`, `environments`, `requests`, `workspace` (list/get/create/update/delete and pullWorkspace/pushWorkspace).
- **REST**: **GET** and **PUT** `/workspace` for full workspace sync.

In the Röle app:

1. Open the drawer → choose **API** as data source.
2. Set **API base URL** to your server (e.g. `http://localhost:8082` for the web server, no trailing path).
3. **API key**: If the server has `RELAY_API_KEYS` set (see below), set the same key in the app (Bearer token). Otherwise optional.

**Email login/register**

- Users can sign up and sign in with **email + password** via the Serverpod auth IDP. The server exposes `emailIdp` and `refreshJwtTokens` endpoints.
- **Setup:** In `config/passwords.yaml` set `jwtRefreshTokenHashPepper`, `jwtHmacSha512PrivateKey`, and `emailSecretHashPepper` (see `config/passwords.yaml.example`). Generate with e.g. `openssl rand -base64 32` and `openssl rand -base64 64` for the JWT key.
- **Verification codes:** Registration and password reset send a verification code. By default the server only **logs** the code (see server logs). For production, wire `sendRegistrationVerificationCode` and `sendPasswordResetVerificationCode` in `lib/server.dart` to your email provider (e.g. SMTP).
- **role-client:** Use `serverpod_auth_idp_flutter` and the generated client; connect with `FlutterAuthSessionManager` and call the email IDP methods (create account request, validate account, login, password reset).

**Authentication (API keys, optional)**

- Set `RELAY_API_KEYS` to a comma-separated list of valid API keys when you want **Bearer token** auth instead of (or in addition to) email login. When set, requests without a valid JWT must use `Authorization: Bearer <key>`. Each key maps to user id 1, 2, …
- If `RELAY_API_KEYS` is not set, auth is email-based or none (unauthenticated = user id 0). See `.env.example` for a template.

**Full documentation:** See the **docs/** folder in the repo root: [Documentation index](../docs/README.md), [API reference](../docs/03-API-REFERENCE.md), [Development](../docs/08-DEVELOPMENT.md), [Deployment](../docs/07-DEPLOYMENT.md).

# 6. Configuration

The server is configured via YAML files under `relay_server_server/config/` and environment variables. Secrets (passwords, API keys) should not be committed.

## Configuration Files (YAML)

### development.yaml

**Purpose:** Used when the server runs with `--mode development` (default when no `--mode` is passed). Defines API server, web server, database, and Redis.

**Location:** `relay_server_server/config/development.yaml` (create from example; do not commit if it contains secrets).

**With database (Postgres + Redis):** Copy from `config/development.yaml.example`:

```yaml
apiServer:
  port: 8080
  publicHost: localhost
  publicPort: 8080
  publicScheme: http

database:
  host: localhost
  port: 8090
  name: relay_server
  user: postgres

redis:
  host: localhost
  port: 6379
```

**Without database (in-memory only):** Copy from `config/development_local.yaml.example`:

```yaml
apiServer:
  port: 8080
  publicHost: localhost
  publicPort: 8080
  publicScheme: http

webServer:
  port: 8082
  publicHost: localhost
  publicPort: 8082
  publicScheme: http

# No database or redis
```

Then run with `RELAY_USE_IN_MEMORY=1` and **do not** use `--apply-migrations`.

### passwords.yaml

**Purpose:** Passwords for database and (optionally) Redis, plus secrets for **email login/register** (JWT and email IDP). Loaded by Serverpod from `config/passwords.yaml`.

**Location:** `relay_server_server/config/passwords.yaml` (create from `config/passwords.yaml.example`; **never commit**).

**Example (development):**

```yaml
development:
  databasePassword: postgres
  # redis: <password>   # if Redis has a password
  jwtRefreshTokenHashPepper: <from openssl rand -base64 32>
  jwtHmacSha512PrivateKey: <from openssl rand -base64 64>
  emailSecretHashPepper: <from openssl rand -base64 32>
```

For email auth, the example file also includes `jwtRefreshTokenHashPepper`, `jwtHmacSha512PrivateKey`, and `emailSecretHashPepper`; see [04-AUTHENTICATION.md](04-AUTHENTICATION.md#server-setup) for details.

**Production:** Use strong, unique passwords (e.g. from a secrets manager). See `passwords.yaml.example` and [07-DEPLOYMENT.md](07-DEPLOYMENT.md).

### generator.yaml

**Purpose:** Serverpod code generation (e.g. enable database). Rarely changed.

**Location:** `relay_server_server/config/generator.yaml`.

**Content:**

```yaml
features:
  database: true
```

## Environment Variables

| Variable | Used by | Description |
|----------|---------|-------------|
| `RELAY_API_KEYS` | ApiKeyAuth | Comma-separated list of valid API keys (Bearer tokens). When set, auth is required and each key maps to user id 1, 2, … |
| `RELAY_USE_IN_MEMORY` | InMemory*Store classes | Set to `1` or `true` to use in-memory storage (no Postgres). For local dev only. |

Serverpod also uses:

- **Runtime / mode:** Often set via CLI (`--mode development` or `--mode production`) or Docker `ENV runmode=production`.
- **Logging:** e.g. `--logging=normal` (or via env in Docker).

See `relay_server_server/.env.example` for a template; copy to `.env` and do not commit `.env`.

## Run Modes

- **development:** Uses `config/development.yaml` and `passwords.yaml` key `development`. Typical for local runs.
- **production:** Uses `config/production.yaml` (if present) and `passwords.yaml` key `production`. Set `publicScheme: https`, real hosts, and strong secrets.

If `config/production.yaml` does not exist, create it from the development example and adjust ports, hosts, and scheme for your deployment.

## File Layout Summary

```
relay_server_server/config/
├── development.yaml          # Created from example; gitignored if secret
├── development.yaml.example  # With-DB template
├── development_local.yaml.example  # No-DB template
├── passwords.yaml            # Secrets; never commit
├── passwords.yaml.example    # Template + production notes
└── generator.yaml            # Codegen config
```

## Loading Order and Precedence

- Serverpod loads the config file for the current mode (e.g. `development.yaml` for `--mode development`).
- Passwords are loaded from `passwords.yaml` under the same mode key.
- Environment variables (e.g. `RELAY_*`) are read at runtime by the application code; they override nothing in YAML but drive behavior (e.g. API keys, in-memory mode).

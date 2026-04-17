# 6. Configuration

## Config Sources

The server uses:

- Serverpod YAML files under `relay_server_server/config/`
- environment variables for runtime behavior

## Required Local Files

Create from examples:

```bash
cp relay_server_server/config/development.yaml.example relay_server_server/config/development.yaml
cp relay_server_server/config/passwords.yaml.example relay_server_server/config/passwords.yaml
```

## Core YAML Files

- `development.yaml` – API/web/database/redis endpoints for dev mode
- `passwords.yaml` – secret values per mode (`development`, `production`)
- `generator.yaml` – generator feature flags (database enabled)

## Key Environment Variables

| Variable | Description |
|----------|-------------|
| `RELAY_AUTH_TOKEN_SECRET` | Access token signing/validation secret. |
| `RELAY_RUNNER_ALLOW_PRIVATE_NETWORK` | If `true`, run engine permits localhost/private network targets. Default blocked. |
| `RELAY_RUNNER_MAX_RESPONSE_BYTES` | Max bytes persisted from run response body. Default `1048576`. |

## Mode and Startup

- Development mode is default if no `--mode` is supplied.
- Apply migrations when schema changes are introduced:

```bash
dart bin/main.dart --apply-migrations
```

## Migration Workflow

After `.spy.yaml` table changes:

```bash
cd relay_server_server
serverpod generate
serverpod create-migration
dart bin/main.dart --apply-migrations
```

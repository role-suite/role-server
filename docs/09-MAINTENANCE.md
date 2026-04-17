# 9. Maintenance and Operations

## Adding a New Feature Endpoint

1. Add endpoint class under `lib/src/features/<feature>/`.
2. Add service and repository for business logic and persistence.
3. Add/update `.spy.yaml` models.
4. Run `serverpod generate`.
5. If table models changed, run `serverpod create-migration` and apply migrations.
6. Add tests under `test/unit/` and update docs.

## Changing the Data Model

### Protocol-only changes

```bash
cd relay_server_server
serverpod generate
dart analyze
dart test
```

### Table changes

```bash
cd relay_server_server
serverpod generate
serverpod create-migration
dart bin/main.dart --apply-migrations
dart analyze
dart test
```

## Troubleshooting

### Server fails to start

- Verify Postgres/Redis are running via compose.
- Validate `config/development.yaml` host/port values.
- Validate `config/passwords.yaml` credentials.

### Auth failures

- Ensure bearer access token is present on authenticated methods.
- Ensure `RELAY_AUTH_TOKEN_SECRET` matches the token issuer secret.

### Run execution blocked

- By default, private network targets are blocked.
- For controlled local/dev use, set `RELAY_RUNNER_ALLOW_PRIVATE_NETWORK=true`.

### Generated code stale

- Re-run `serverpod generate` from `relay_server_server`.
- Re-run `dart analyze` and `dart test`.

## Backup Guidance

- Persist and back up PostgreSQL data using normal Postgres backup flows.
- Keep `passwords.yaml` and env secrets in a secure secret-management system.

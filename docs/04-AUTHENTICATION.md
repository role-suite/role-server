# 4. Authentication

## Current Auth Model

The rebuilt project uses endpoint-driven auth:

- `auth.register`
- `auth.login`
- `auth.refresh`
- `auth.logout`
- `auth.me`

Access tokens are sent as `Authorization: Bearer <access-token>`.

## Token Behavior

- Access tokens are signed and validated by `AccessTokenAuth`.
- Refresh tokens are random tokens stored as hashes in `auth_sessions`.
- Refresh flow revokes old refresh sessions and issues a new pair.

## Authenticated vs Unauthenticated RPC Methods

Unauthenticated client calls:

- `auth.register`
- `auth.login`
- `auth.refresh`
- `auth.logout`

Authenticated calls:

- `auth.me`
- all `workspaces`, `collections`, `environments`, `importExport`, and `runs` methods

## User Identity

- Auth context is derived from `session.authenticated.userIdentifier`.
- `AuthGuard.requireUserId(session)` is used by endpoints to enforce authentication.
- Workspace-scoped permissions are enforced in services via membership role checks.

## Environment Variables

- `RELAY_AUTH_TOKEN_SECRET` – signing secret for access token validation (set this explicitly outside local dev).

## Security Notes

- Use strong random secrets and rotate them through deployment config.
- Serve over HTTPS in non-local environments.
- Do not commit secrets or `.env` files.

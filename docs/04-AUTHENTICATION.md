# 4. Authentication

The server supports two authentication options:

1. **Email login/register** — Users sign up and sign in with email + password (Serverpod auth IDP). Each user gets a stable integer user id derived from their auth UUID.
2. **API key (Bearer token)** — Optional: when `RELAY_API_KEYS` is set, clients can also authenticate with a static Bearer token (user id = 1-based index in the list).

Both can be enabled; the same `SessionHelper.getUserId(session)` is used everywhere.

---

## Email login/register

### Overview

- **Endpoints:** `emailIdp` (register, validate account, login, password reset) and `refreshJwtTokens` (refresh JWT access token).
- **Flow:** Register with email → server sends verification code (or logs it) → client submits code to complete registration → user can login with email/password. Password reset: request code → receive code → set new password.
- **Session:** After login (or token refresh), the client sends the JWT (access token) on subsequent requests. The server sets `session.authenticated` with `userIdentifier` = the auth user’s UUID string. `SessionHelper.getUserId(session)` maps that to a stable integer for workspace isolation.

### Server setup

1. **Secrets in `config/passwords.yaml`** (see `config/passwords.yaml.example`):

   - `jwtRefreshTokenHashPepper` — e.g. `openssl rand -base64 32`
   - `jwtHmacSha512PrivateKey` — e.g. `openssl rand -base64 64` (must be valid HMAC SHA-512 key)
   - `emailSecretHashPepper` — e.g. `openssl rand -base64 32` (min 10 characters)

2. **Verification codes:** In `lib/server.dart`, `_sendRegistrationVerificationCode` and `_sendPasswordResetVerificationCode` currently **log** the code to the server log. For production, replace with real email sending (e.g. SMTP, Resend, Sendgrid).

3. **Migrations:** After adding the auth module, run:

   ```bash
   dart run serverpod_cli:serverpod_cli create-migration
   dart bin/main.dart --apply-migrations
   ```

### Client setup (role-client)

- Add `serverpod_auth_idp_flutter` and use the generated client.
- Create the Serverpod client with `FlutterAuthSessionManager` and call `client.auth.initialize()` on startup.
- Use the email IDP methods: create account request (sends verification code), validate account (with code), login (email + password), and password reset flows. See [Serverpod auth setup](https://docs.serverpod.dev/concepts/authentication/setup) and [Email provider](https://docs.serverpod.dev/concepts/authentication/providers/email/setup).

### User id for email auth

- Auth users have a **UUID** id. `SessionHelper.getUserId(session)` derives a stable **integer** from the UUID string (first 8 hex chars) so existing repositories (keyed by `int userId`) work without schema changes. Collisions are possible in theory; for production at scale consider a proper UUID→int mapping table.

---

## API key (Bearer token)

### Modes

| Mode | Condition | Behavior |
|------|-----------|----------|
| No API key | `RELAY_API_KEYS` unset or empty | API key auth is off. Email auth or unauthenticated (user id `0`) only. |
| API key required | `RELAY_API_KEYS` set (comma-separated list) | Requests without a valid JWT can use `Authorization: Bearer <key>`. User id = 1-based index of the key. |

### Configuring API keys

1. Set the environment variable (e.g. in `.env` or the process environment):

   ```bash
   RELAY_API_KEYS=my-secret-key,another-key,third-key
   ```

2. Keys are trimmed; empty entries are ignored. Order matters: first key → user id `1`, second → `2`, etc.
3. Restart the server after changing `RELAY_API_KEYS`.

**Example `.env` (see `relay_server_server/.env.example`):**

```env
RELAY_API_KEYS=my-secret-key,another-key
```

### How it works

- **`lib/src/core/api_key_auth.dart`** reads `RELAY_API_KEYS`, exposes `isRequired` and `validateToken(session, token)`. When the token is in the list, returns `AuthenticationInfo(userIdentifier: "${index + 1}", …)`.
- **`lib/server.dart`** passes `authenticationHandler: ApiKeyAuth.validateToken` to `Serverpod(...)` only when `ApiKeyAuth.isRequired` is true.
- **`SessionHelper.getUserId(session)`** returns `int.tryParse(session.authenticated?.userIdentifier) ?? 0` for numeric identifiers (API key), or the UUID-derived int for email auth.

### REST `/workspace`

- If `ApiKeyAuth.isRequired && session.authenticated == null`, the route returns **401** with message: `Unauthorized. Provide a valid API key in Authorization: Bearer <key>.`
- When only email auth is used (no `RELAY_API_KEYS`), unauthenticated requests get user id `0` (no 401 from this check).

---

## Security considerations

- **Secrets:** Do not commit `.env` or `passwords.yaml`. Use strong, unique values in production (secrets manager or `openssl rand -base64 …`).
- **HTTPS:** In production, serve over HTTPS so tokens and passwords are not sent in clear text.
- **Email verification:** For production, send verification codes by email; do not rely on server logs.
- **API key rotation:** Change `RELAY_API_KEYS` and restart; clients must use a key from the new list.
- **User id stability (API key):** Removing or reordering keys changes the mapping; prefer appending new keys and deprecating old ones.

---

## Replacing or extending auth

- To add another identity provider (e.g. Google), add its config to `identityProviderBuilders` in `pod.initializeAuthServices(...)` and extend the corresponding base endpoint. `SessionHelper.getUserId` already supports any `userIdentifier` (numeric string or UUID-derived int).
- To require login for `/workspace` when email auth is enabled (no API keys), add a check in `WorkspaceRoute`: if `session.authenticated == null` then return 401, optionally only when not using in-memory mode.

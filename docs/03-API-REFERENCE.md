# 3. API Reference

Base URL for REST is the **web server** root (e.g. `http://localhost:8082`). RPC uses the Serverpod API server (e.g. `http://localhost:8080`) and the Serverpod client protocol.

**Authentication:** Endpoints accept either an API key or a JWT from email login, both as Bearer tokens. See [04-AUTHENTICATION.md](04-AUTHENTICATION.md) for details.

- When **API keys** are configured (`RELAY_API_KEYS` set): `Authorization: Bearer <api-key>`.
- When using **email login**: the client sends the JWT access token: `Authorization: Bearer <jwt-access-token>` (handled by the Serverpod auth client).
- If neither is configured, requests are unauthenticated (user id `0`).

---

## REST API

### GET /workspace

Returns the current user’s full workspace as JSON.

**Request**

- Method: `GET`
- Path: `/workspace`
- Headers: `Authorization: Bearer <api-key-or-jwt>` (required if API keys are configured; otherwise JWT from email login or none)

**Response**

- **200 OK**: JSON object (workspace bundle).
- **401 Unauthorized**: API keys are configured and no valid Bearer token was provided.

**Response body shape (200)**

```json
{
  "version": 1,
  "exportedAt": "2025-02-14T12:00:00.000Z",
  "source": null,
  "collections": [
    {
      "collection": {
        "id": "col-1",
        "name": "My Collection",
        "description": "",
        "createdAt": "2025-02-14T12:00:00.000Z",
        "updatedAt": "2025-02-14T12:00:00.000Z"
      },
      "requests": [
        {
          "id": "req-1",
          "name": "Get example",
          "method": "get",
          "urlTemplate": "https://api.example.com/data",
          "headers": {},
          "queryParams": {},
          "body": null,
          "bodyType": "raw",
          "formDataFields": {},
          "authType": "none",
          "authConfig": {},
          "description": null,
          "filePath": null,
          "collectionId": "col-1",
          "environmentName": null,
          "createdAt": "2025-02-14T12:00:00.000Z",
          "updatedAt": "2025-02-14T12:00:00.000Z"
        }
      ]
    }
  ],
  "environments": [
    {
      "name": "default",
      "variables": { "BASE_URL": "https://api.example.com" }
    }
  ]
}
```

If the user has no stored workspace, the server returns the same structure with `collections: []` and `environments: []` (version 1, current `exportedAt`).

---

### PUT /workspace

Overwrites the current user’s workspace with the provided JSON.

**Request**

- Method: `PUT`
- Path: `/workspace`
- Headers: `Content-Type: application/json`, and `Authorization: Bearer <key>` when API keys are configured.
- Body: JSON object (workspace bundle).

**Required top-level fields**

- `version` (integer)
- `collections` (array; may be empty)

**Optional top-level fields**

- `exportedAt` (ISO 8601 string; default: now)
- `source` (string; nullable)
- `environments` (array; default: `[]`)

Each element of `collections` must have:

- `collection`: object with `id`, `name`, `description`, `createdAt`, `updatedAt`
- `requests`: array of request objects (see request shape below)

Each element of `environments` must have:

- `name`: string
- `variables`: object (string key-value)

Request object fields (all optional with defaults as in [05-DATA-MODEL.md](05-DATA-MODEL.md#api-request)): `id`, `name`, `method`, `urlTemplate`, `headers`, `queryParams`, `body`, `bodyType`, `formDataFields`, `authType`, `authConfig`, `description`, `filePath`, `collectionId`, `environmentName`, `createdAt`, `updatedAt`.

**Response**

- **204 No Content**: Success.
- **400 Bad Request**: Missing/invalid body, empty body, invalid JSON, missing `version`/`collections`, or invalid workspace format (body is plain text error message).
- **401 Unauthorized**: API keys configured and no valid Bearer token.

---

### Other methods on /workspace

- **405 Method Not Allowed**: Only GET and PUT are supported. Response body: `Method <X> not allowed. Use GET or PUT.`

---

## RPC API (Serverpod)

The Serverpod client uses the generated `Endpoints` and protocol. Endpoints are grouped by module: `workspace`, `collections`, `requests`, `environments`. All methods take a `Session` (or equivalent) as the first argument when using the client; the session carries the auth key.

### workspace

| Method | Arguments | Returns | Description |
|--------|-----------|---------|-------------|
| `pullWorkspace` | `Session session` | `Future<WorkspaceBundle?>` | Returns the current user’s workspace or null. |
| `pushWorkspace` | `Session session`, `WorkspaceBundle bundle` | `Future<void>` | Overwrites the current user’s workspace. |

### collections

| Method | Arguments | Returns | Description |
|--------|-----------|---------|-------------|
| `list` | `Session session` | `Future<List<CollectionModel>>` | All collections for the user. |
| `get` | `Session session`, `String collectionId` | `Future<CollectionModel?>` | One collection by id. |
| `create` | `Session session`, `CollectionModel collection` | `Future<void>` | Create a collection. |
| `update` | `Session session`, `CollectionModel collection` | `Future<void>` | Update a collection. |
| `delete` | `Session session`, `String collectionId` | `Future<void>` | Delete a collection. |

### requests

| Method | Arguments | Returns | Description |
|--------|-----------|---------|-------------|
| `list` | `Session session`, `String collectionId` | `Future<List<ApiRequestModel>>` | All requests in the collection. |
| `get` | `Session session`, `String requestId` | `Future<ApiRequestModel?>` | One request by id. |
| `create` | `Session session`, `ApiRequestModel request` | `Future<void>` | Create a request. |
| `update` | `Session session`, `ApiRequestModel request` | `Future<void>` | Update a request. |
| `delete` | `Session session`, `String requestId` | `Future<void>` | Delete a request. |

### environments

| Method | Arguments | Returns | Description |
|--------|-----------|---------|-------------|
| `list` | `Session session` | `Future<List<EnvironmentModel>>` | All environments for the user. |
| `get` | `Session session`, `String name` | `Future<EnvironmentModel?>` | One environment by name. |
| `create` | `Session session`, `EnvironmentModel environment` | `Future<void>` | Create an environment. |
| `update` | `Session session`, `EnvironmentModel environment` | `Future<void>` | Update an environment. |
| `delete` | `Session session`, `String name` | `Future<void>` | Delete an environment. |

When API keys are configured, RPC calls must use a session that sends the same Bearer token; otherwise the session is unauthenticated and user id is 0.

---

## Error Handling

- **REST**: 4xx/5xx with plain text or JSON body as described above. 401 body: `Unauthorized. Provide a valid API key in Authorization: Bearer <key>.`
- **RPC**: Serverpod serializes exceptions; invalid or missing auth can result in 401 or an error response depending on Serverpod version.

No request body size limit is currently enforced on `PUT /workspace`; consider adding one for production (see production-readiness list).

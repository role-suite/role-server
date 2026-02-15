# 5. Data Model

## Overview

The server stores:

- **Workspace**: One blob per user (collections + requests + environments). Used by REST and by `WorkspaceEndpoint.pullWorkspace` / `pushWorkspace`.
- **Collections, requests, environments**: Normalized per-entity tables (or in-memory equivalents) used by the CRUD endpoints. Workspace blob and normalized data can both exist; REST push overwrites the workspace blob only.

All entities are scoped by **user id** (integer).

## Protocol Types (Server / Client)

Defined in `.spy.yaml` under `relay_server_server/lib/src/features/` and generated into `lib/src/generated/` (and shared via `relay_server_client` for the Flutter app).

### WorkspaceBundle

Full workspace for one user.

| Field | Type | Description |
|-------|------|-------------|
| `version` | int | Schema/format version. |
| `exportedAt` | DateTime | When the bundle was exported. |
| `source` | String? | Optional source identifier. |
| `collections` | List\<CollectionBundle\> | Collections with their requests. |
| `environments` | List\<EnvironmentModel\> | Named environments and variables. |

### CollectionBundle

One collection and its requests.

| Field | Type |
|-------|------|
| `collection` | CollectionModel |
| `requests` | List\<ApiRequestModel\> |

### CollectionModel

| Field | Type | Description |
|-------|------|-------------|
| `id` | String | Unique id (e.g. UUID or slug). |
| `name` | String | Display name. |
| `description` | String | Optional description. |
| `createdAt` | DateTime | Creation time (UTC). |
| `updatedAt` | DateTime | Last update time (UTC). |

### ApiRequestModel

| Field | Type | Description |
|-------|------|-------------|
| `id` | String | Unique id. |
| `name` | String | Display name. |
| `method` | String | HTTP method (e.g. `get`, `post`). |
| `urlTemplate` | String | URL (may contain variables). |
| `headers` | Map\<String, String\> | Request headers. |
| `queryParams` | Map\<String, String\> | Query parameters. |
| `body` | String? | Request body. |
| `bodyType` | String | e.g. `raw`, `form`. |
| `formDataFields` | Map\<String, String\> | Form fields. |
| `authType` | String | e.g. `none`, `bearer`. |
| `authConfig` | Map\<String, String\> | Auth-specific config. |
| `description` | String? | Optional description. |
| `filePath` | String? | Optional file path. |
| `collectionId` | String | Parent collection id. |
| `environmentName` | String? | Environment to use. |
| `createdAt` | DateTime | Creation time. |
| `updatedAt` | DateTime | Last update time. |

### EnvironmentModel

| Field | Type | Description |
|-------|------|-------------|
| `name` | String | Environment name (e.g. `default`, `staging`). |
| `variables` | Map\<String, String\> | Key-value variables for substitution. |

## Database Tables (PostgreSQL)

When not using in-memory mode, Serverpod creates and uses the following tables (from generated migrations).

### stored_workspace

One row per user. Holds the full workspace as a serialized `WorkspaceBundle`.

| Column | Type | Description |
|--------|------|-------------|
| `userId` | int | User id (unique per row). |
| `data` | WorkspaceBundle (serialized) | Full workspace. |
| `updatedAt` | DateTime | Last write time. |

**Index:** `stored_workspace_user_id_idx` on `userId` (unique).

### stored_collection

One row per user per collection.

| Column | Type |
|--------|------|
| `userId` | int |
| `collectionId` | String |
| `name` | String |
| `description` | String |
| `createdAt` | DateTime |
| `updatedAt` | DateTime |

**Index:** `stored_collection_user_id_collection_id_idx` on `(userId, collectionId)` (unique).

### stored_request

One row per user per request.

| Column | Type |
|--------|------|
| `userId` | int |
| `collectionId` | String |
| `requestId` | String |
| `data` | ApiRequestModel (serialized) |
| `createdAt` | DateTime |
| `updatedAt` | DateTime |

**Indexes:**  
- `stored_request_user_collection_idx` on `(userId, collectionId)`.  
- `stored_request_user_request_idx` on `(userId, requestId)` (unique).

### stored_environment

One row per user per environment name.

| Column | Type |
|--------|------|
| `userId` | int |
| `name` | String |
| `variables` | Map\<String, String\> |

**Index:** `stored_environment_user_id_name_idx` on `(userId, name)` (unique).

## REST JSON Format (/workspace)

The Röle client and `workspace_json.dart` use this shape for GET response and PUT body.

**Top level:**

- `version` (int)
- `exportedAt` (ISO 8601 string)
- `source` (string or null)
- `collections` (array of collection bundles)
- `environments` (array of environment objects)

**Collection bundle (element of `collections`):**

- `collection`: object with `id`, `name`, `description`, `createdAt`, `updatedAt` (ISO 8601).
- `requests`: array of request objects.

**Request object:** Same fields as `ApiRequestModel`; dates as ISO 8601 strings, maps as objects.

**Environment object:** `name` (string), `variables` (object).

Defaults and parsing rules (e.g. missing `version` → 1, invalid date → now) are implemented in `workspace_json.dart` (`workspaceBundleFromClientJson` and helpers).

## In-Memory Storage

When `RELAY_USE_IN_MEMORY=1`:

- **InMemoryWorkspaceStore**: `Map<int, WorkspaceBundle>` keyed by user id.
- **InMemoryCollectionStore**, **InMemoryRequestStore**, **InMemoryEnvironmentStore**: Similar in-memory maps/lists keyed by user id (and collection id or name where applicable).

Data is lost on process restart. No migrations are applied.

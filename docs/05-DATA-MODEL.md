# 5. Data Model

## Overview

The rebuilt server uses normalized domain tables and typed protocol models. Core scope is workspace-centric:

- users and auth sessions
- workspaces, memberships, invitations, events
- collections, folders, endpoints, endpoint examples
- environments and environment variables
- request runs with request/response snapshots
- import/export jobs

All domain objects are scoped by `workspaceId` and protected by membership/role checks in service layer logic.

## Protocol Model Groups

Models are defined in `.spy.yaml` files under `relay_server_server/lib/src/features/**/models` and generated into `relay_server_server/lib/src/generated` plus `relay_server_client/lib/src/protocol`.

### auth

- `AuthUserModel`
- `AuthRegisterRequest`
- `AuthLoginRequest`
- `AuthRefreshRequest`
- `AuthTokenPair`

### workspaces

- `WorkspaceModel`
- `WorkspaceMemberModel`
- `WorkspaceInvitationModel`
- `WorkspaceInvitationIssueModel`
- `WorkspaceEventModel`
- request DTOs for create/invite/accept/update/convert/updates query

### collections

- `CollectionModel`
- `CollectionFolderModel`
- `CollectionEndpointModel`
- `CollectionEndpointExampleModel`
- request DTOs for create/update across collection, folder, endpoint, and example flows

### environments

- `EnvironmentModel`
- `EnvironmentVariableModel`
- request DTOs for create/update environment and variable flows

### importExport

- `ImportExportJobModel`
- `CreateWorkspaceExportRequest`
- `CreateWorkspaceImportRequest`

### runs

- `RequestRunModel`
- `RequestRunRequestSnapshotModel`
- `RequestRunResponseSnapshotModel`
- `RequestRunDetailModel`
- `RunErrorModel`
- `CreateRequestRunRequest`

## Database Tables

Current generated table models map to these PostgreSQL tables:

- `auth_users`
- `auth_sessions`
- `workspaces`
- `workspace_memberships`
- `workspace_invitations`
- `workspace_events`
- `collections`
- `collection_folders`
- `collection_endpoints`
- `collection_endpoint_examples`
- `environments`
- `environment_variables`
- `request_runs`
- `request_run_requests`
- `request_run_responses`
- `import_export_jobs`

Authoritative schema is generated from `.spy.yaml` definitions and tracked through Serverpod migrations.

## Lifecycle and State Notes

- Auth sessions store hashed refresh tokens and revocation state.
- Membership roles are string-based (`owner`, `admin`, `member`) and enforced in services.
- Runs are persisted with status transitions (`running`, `completed`, `failed`, `cancelled`) and optional error payloads.
- Import/export jobs are currently synchronous-complete in v1 (`status: completed`).

## In-Memory Mode

The old in-memory repository/store system was removed in the rebuild. The current implementation is database-backed and expected to run with migrations applied.

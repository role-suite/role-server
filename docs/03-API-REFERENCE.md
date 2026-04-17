# 3. API Reference

This project now uses a Serverpod-native RPC surface (no `/workspace` REST sync route).

Base RPC URL is the API server (for local dev, typically `http://localhost:8080`). Calls are made through the generated client in `relay_server_client`.

## Authentication

- Authenticated endpoints require `Authorization: Bearer <access-token>`.
- Access tokens are created by `auth.register`, `auth.login`, and `auth.refresh`.
- Unauthenticated client calls:
  - `auth.register`
  - `auth.login`
  - `auth.refresh`
  - `auth.logout`
- Authenticated client calls include:
  - `auth.me`
  - all `workspaces`, `collections`, `environments`, `importExport`, and `runs` methods.

## Endpoint Reference

All methods below are RPC methods on generated endpoint refs.

### auth

| Method | Arguments | Returns |
|--------|-----------|---------|
| `register` | `AuthRegisterRequest request` | `AuthTokenPair` |
| `login` | `AuthLoginRequest request` | `AuthTokenPair` |
| `refresh` | `AuthRefreshRequest request` | `AuthTokenPair` |
| `logout` | `AuthRefreshRequest request` | `void` |
| `me` | - | `AuthUserModel` |

### workspaces

| Method | Arguments | Returns |
|--------|-----------|---------|
| `list` | - | `List<WorkspaceModel>` |
| `get` | `int workspaceId` | `WorkspaceModel` |
| `create` | `CreateWorkspaceRequest request` | `WorkspaceModel` |
| `listMembers` | `int workspaceId` | `List<WorkspaceMemberModel>` |
| `createInvitation` | `CreateWorkspaceInvitationRequest request` | `WorkspaceInvitationIssueModel` |
| `acceptInvitation` | `AcceptWorkspaceInvitationRequest request` | `WorkspaceModel` |
| `updateMemberRole` | `UpdateWorkspaceMemberRoleRequest request` | `WorkspaceMemberModel` |
| `removeMember` | `int workspaceId, int memberUserId` | `void` |
| `leave` | `int workspaceId` | `void` |
| `convertToTeam` | `ConvertWorkspaceToTeamRequest request` | `WorkspaceModel` |
| `listUpdates` | `WorkspaceUpdatesQuery query` | `List<WorkspaceEventModel>` |

### collections

| Method | Arguments | Returns |
|--------|-----------|---------|
| `list` | `int workspaceId` | `List<CollectionModel>` |
| `get` | `int workspaceId, int collectionId` | `CollectionModel` |
| `create` | `CreateCollectionRequest request` | `CollectionModel` |
| `update` | `UpdateCollectionRequest request` | `CollectionModel` |
| `remove` | `int workspaceId, int collectionId` | `void` |
| `listFolders` | `int workspaceId, int collectionId` | `List<CollectionFolderModel>` |
| `createFolder` | `CreateCollectionFolderRequest request` | `CollectionFolderModel` |
| `updateFolder` | `UpdateCollectionFolderRequest request` | `CollectionFolderModel` |
| `removeFolder` | `int workspaceId, int collectionId, int folderId` | `void` |
| `listEndpoints` | `int workspaceId, int collectionId` | `List<CollectionEndpointModel>` |
| `createEndpoint` | `CreateCollectionEndpointRequest request` | `CollectionEndpointModel` |
| `updateEndpoint` | `UpdateCollectionEndpointRequest request` | `CollectionEndpointModel` |
| `removeEndpoint` | `int workspaceId, int collectionId, int endpointId` | `void` |
| `listEndpointExamples` | `int workspaceId, int collectionId, int endpointId` | `List<CollectionEndpointExampleModel>` |
| `createEndpointExample` | `CreateCollectionEndpointExampleRequest request` | `CollectionEndpointExampleModel` |
| `updateEndpointExample` | `UpdateCollectionEndpointExampleRequest request` | `CollectionEndpointExampleModel` |
| `removeEndpointExample` | `int workspaceId, int collectionId, int endpointId, int exampleId` | `void` |

### environments

| Method | Arguments | Returns |
|--------|-----------|---------|
| `list` | `int workspaceId` | `List<EnvironmentModel>` |
| `get` | `int workspaceId, int environmentId` | `EnvironmentModel` |
| `create` | `CreateEnvironmentRequest request` | `EnvironmentModel` |
| `update` | `UpdateEnvironmentRequest request` | `EnvironmentModel` |
| `remove` | `int workspaceId, int environmentId` | `void` |
| `listVariables` | `int workspaceId, int environmentId` | `List<EnvironmentVariableModel>` |
| `createVariable` | `CreateEnvironmentVariableRequest request` | `EnvironmentVariableModel` |
| `updateVariable` | `UpdateEnvironmentVariableRequest request` | `EnvironmentVariableModel` |
| `removeVariable` | `int workspaceId, int environmentId, int variableId` | `void` |

### importExport

| Method | Arguments | Returns |
|--------|-----------|---------|
| `listJobs` | `int workspaceId` | `List<ImportExportJobModel>` |
| `getJobById` | `int workspaceId, int jobId` | `ImportExportJobModel` |
| `createExport` | `CreateWorkspaceExportRequest request` | `ImportExportJobModel` |
| `createImport` | `CreateWorkspaceImportRequest request` | `ImportExportJobModel` |

### runs

| Method | Arguments | Returns |
|--------|-----------|---------|
| `list` | `int workspaceId` | `List<RequestRunModel>` |
| `get` | `int workspaceId, int runId` | `RequestRunDetailModel` |
| `create` | `CreateRequestRunRequest request` | `RequestRunDetailModel` |
| `cancel` | `int workspaceId, int runId` | `RequestRunModel` |

## Error Handling

- Business errors are raised as `DomainException` with a message and status semantics (for example `400`, `403`, `404`, `409`).
- Transport-level auth failures are handled by Serverpod auth handling and returned as unauthenticated responses.
- Client integrations should handle both RPC exceptions and domain validation failures.

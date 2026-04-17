/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:relay_server_client/src/protocol/features/auth/models/auth_token_pair.dart'
    as _i3;
import 'package:relay_server_client/src/protocol/features/auth/models/auth_register_request.dart'
    as _i4;
import 'package:relay_server_client/src/protocol/features/auth/models/auth_login_request.dart'
    as _i5;
import 'package:relay_server_client/src/protocol/features/auth/models/auth_refresh_request.dart'
    as _i6;
import 'package:relay_server_client/src/protocol/features/auth/models/auth_user_model.dart'
    as _i7;
import 'package:relay_server_client/src/protocol/features/collections/models/collection_model.dart'
    as _i8;
import 'package:relay_server_client/src/protocol/features/collections/models/create_collection_request.dart'
    as _i9;
import 'package:relay_server_client/src/protocol/features/collections/models/update_collection_request.dart'
    as _i10;
import 'package:relay_server_client/src/protocol/features/collections/models/collection_folder_model.dart'
    as _i11;
import 'package:relay_server_client/src/protocol/features/collections/models/create_collection_folder_request.dart'
    as _i12;
import 'package:relay_server_client/src/protocol/features/collections/models/update_collection_folder_request.dart'
    as _i13;
import 'package:relay_server_client/src/protocol/features/collections/models/collection_endpoint_model.dart'
    as _i14;
import 'package:relay_server_client/src/protocol/features/collections/models/create_collection_endpoint_request.dart'
    as _i15;
import 'package:relay_server_client/src/protocol/features/collections/models/update_collection_endpoint_request.dart'
    as _i16;
import 'package:relay_server_client/src/protocol/features/collections/models/collection_endpoint_example_model.dart'
    as _i17;
import 'package:relay_server_client/src/protocol/features/collections/models/create_collection_endpoint_example_request.dart'
    as _i18;
import 'package:relay_server_client/src/protocol/features/collections/models/update_collection_endpoint_example_request.dart'
    as _i19;
import 'package:relay_server_client/src/protocol/features/environments/models/environment_model.dart'
    as _i20;
import 'package:relay_server_client/src/protocol/features/environments/models/create_environment_request.dart'
    as _i21;
import 'package:relay_server_client/src/protocol/features/environments/models/update_environment_request.dart'
    as _i22;
import 'package:relay_server_client/src/protocol/features/environments/models/environment_variable_model.dart'
    as _i23;
import 'package:relay_server_client/src/protocol/features/environments/models/create_environment_variable_request.dart'
    as _i24;
import 'package:relay_server_client/src/protocol/features/environments/models/update_environment_variable_request.dart'
    as _i25;
import 'package:relay_server_client/src/protocol/features/import_export/models/import_export_job_model.dart'
    as _i26;
import 'package:relay_server_client/src/protocol/features/import_export/models/create_workspace_export_request.dart'
    as _i27;
import 'package:relay_server_client/src/protocol/features/import_export/models/create_workspace_import_request.dart'
    as _i28;
import 'package:relay_server_client/src/protocol/features/runs/models/request_run_model.dart'
    as _i29;
import 'package:relay_server_client/src/protocol/features/runs/models/request_run_detail_model.dart'
    as _i30;
import 'package:relay_server_client/src/protocol/features/runs/models/create_request_run_request.dart'
    as _i31;
import 'package:relay_server_client/src/protocol/features/workspaces/models/workspace_model.dart'
    as _i32;
import 'package:relay_server_client/src/protocol/features/workspaces/models/create_workspace_request.dart'
    as _i33;
import 'package:relay_server_client/src/protocol/features/workspaces/models/workspace_member_model.dart'
    as _i34;
import 'package:relay_server_client/src/protocol/features/workspaces/models/workspace_invitation_issue_model.dart'
    as _i35;
import 'package:relay_server_client/src/protocol/features/workspaces/models/create_workspace_invitation_request.dart'
    as _i36;
import 'package:relay_server_client/src/protocol/features/workspaces/models/accept_workspace_invitation_request.dart'
    as _i37;
import 'package:relay_server_client/src/protocol/features/workspaces/models/update_workspace_member_role_request.dart'
    as _i38;
import 'package:relay_server_client/src/protocol/features/workspaces/models/convert_workspace_to_team_request.dart'
    as _i39;
import 'package:relay_server_client/src/protocol/features/workspaces/models/workspace_event_model.dart'
    as _i40;
import 'package:relay_server_client/src/protocol/features/workspaces/models/workspace_updates_query.dart'
    as _i41;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i42;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i43;
import 'protocol.dart' as _i44;

/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  _i2.Future<_i3.AuthTokenPair> register(_i4.AuthRegisterRequest request) =>
      caller.callServerEndpoint<_i3.AuthTokenPair>(
        'auth',
        'register',
        {'request': request},
        authenticated: false,
      );

  _i2.Future<_i3.AuthTokenPair> login(_i5.AuthLoginRequest request) =>
      caller.callServerEndpoint<_i3.AuthTokenPair>(
        'auth',
        'login',
        {'request': request},
        authenticated: false,
      );

  _i2.Future<_i3.AuthTokenPair> refresh(_i6.AuthRefreshRequest request) =>
      caller.callServerEndpoint<_i3.AuthTokenPair>(
        'auth',
        'refresh',
        {'request': request},
        authenticated: false,
      );

  _i2.Future<void> logout(_i6.AuthRefreshRequest request) =>
      caller.callServerEndpoint<void>(
        'auth',
        'logout',
        {'request': request},
        authenticated: false,
      );

  _i2.Future<_i7.AuthUserModel> me() =>
      caller.callServerEndpoint<_i7.AuthUserModel>(
        'auth',
        'me',
        {},
      );
}

/// {@category Endpoint}
class EndpointCollections extends _i1.EndpointRef {
  EndpointCollections(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'collections';

  _i2.Future<List<_i8.CollectionModel>> list(int workspaceId) =>
      caller.callServerEndpoint<List<_i8.CollectionModel>>(
        'collections',
        'list',
        {'workspaceId': workspaceId},
      );

  _i2.Future<_i8.CollectionModel> get(
    int workspaceId,
    int collectionId,
  ) => caller.callServerEndpoint<_i8.CollectionModel>(
    'collections',
    'get',
    {
      'workspaceId': workspaceId,
      'collectionId': collectionId,
    },
  );

  _i2.Future<_i8.CollectionModel> create(_i9.CreateCollectionRequest request) =>
      caller.callServerEndpoint<_i8.CollectionModel>(
        'collections',
        'create',
        {'request': request},
      );

  _i2.Future<_i8.CollectionModel> update(
    _i10.UpdateCollectionRequest request,
  ) => caller.callServerEndpoint<_i8.CollectionModel>(
    'collections',
    'update',
    {'request': request},
  );

  _i2.Future<void> remove(
    int workspaceId,
    int collectionId,
  ) => caller.callServerEndpoint<void>(
    'collections',
    'remove',
    {
      'workspaceId': workspaceId,
      'collectionId': collectionId,
    },
  );

  _i2.Future<List<_i11.CollectionFolderModel>> listFolders(
    int workspaceId,
    int collectionId,
  ) => caller.callServerEndpoint<List<_i11.CollectionFolderModel>>(
    'collections',
    'listFolders',
    {
      'workspaceId': workspaceId,
      'collectionId': collectionId,
    },
  );

  _i2.Future<_i11.CollectionFolderModel> createFolder(
    _i12.CreateCollectionFolderRequest request,
  ) => caller.callServerEndpoint<_i11.CollectionFolderModel>(
    'collections',
    'createFolder',
    {'request': request},
  );

  _i2.Future<_i11.CollectionFolderModel> updateFolder(
    _i13.UpdateCollectionFolderRequest request,
  ) => caller.callServerEndpoint<_i11.CollectionFolderModel>(
    'collections',
    'updateFolder',
    {'request': request},
  );

  _i2.Future<void> removeFolder(
    int workspaceId,
    int collectionId,
    int folderId,
  ) => caller.callServerEndpoint<void>(
    'collections',
    'removeFolder',
    {
      'workspaceId': workspaceId,
      'collectionId': collectionId,
      'folderId': folderId,
    },
  );

  _i2.Future<List<_i14.CollectionEndpointModel>> listEndpoints(
    int workspaceId,
    int collectionId,
  ) => caller.callServerEndpoint<List<_i14.CollectionEndpointModel>>(
    'collections',
    'listEndpoints',
    {
      'workspaceId': workspaceId,
      'collectionId': collectionId,
    },
  );

  _i2.Future<_i14.CollectionEndpointModel> createEndpoint(
    _i15.CreateCollectionEndpointRequest request,
  ) => caller.callServerEndpoint<_i14.CollectionEndpointModel>(
    'collections',
    'createEndpoint',
    {'request': request},
  );

  _i2.Future<_i14.CollectionEndpointModel> updateEndpoint(
    _i16.UpdateCollectionEndpointRequest request,
  ) => caller.callServerEndpoint<_i14.CollectionEndpointModel>(
    'collections',
    'updateEndpoint',
    {'request': request},
  );

  _i2.Future<void> removeEndpoint(
    int workspaceId,
    int collectionId,
    int endpointId,
  ) => caller.callServerEndpoint<void>(
    'collections',
    'removeEndpoint',
    {
      'workspaceId': workspaceId,
      'collectionId': collectionId,
      'endpointId': endpointId,
    },
  );

  _i2.Future<List<_i17.CollectionEndpointExampleModel>> listEndpointExamples(
    int workspaceId,
    int collectionId,
    int endpointId,
  ) => caller.callServerEndpoint<List<_i17.CollectionEndpointExampleModel>>(
    'collections',
    'listEndpointExamples',
    {
      'workspaceId': workspaceId,
      'collectionId': collectionId,
      'endpointId': endpointId,
    },
  );

  _i2.Future<_i17.CollectionEndpointExampleModel> createEndpointExample(
    _i18.CreateCollectionEndpointExampleRequest request,
  ) => caller.callServerEndpoint<_i17.CollectionEndpointExampleModel>(
    'collections',
    'createEndpointExample',
    {'request': request},
  );

  _i2.Future<_i17.CollectionEndpointExampleModel> updateEndpointExample(
    _i19.UpdateCollectionEndpointExampleRequest request,
  ) => caller.callServerEndpoint<_i17.CollectionEndpointExampleModel>(
    'collections',
    'updateEndpointExample',
    {'request': request},
  );

  _i2.Future<void> removeEndpointExample(
    int workspaceId,
    int collectionId,
    int endpointId,
    int exampleId,
  ) => caller.callServerEndpoint<void>(
    'collections',
    'removeEndpointExample',
    {
      'workspaceId': workspaceId,
      'collectionId': collectionId,
      'endpointId': endpointId,
      'exampleId': exampleId,
    },
  );
}

/// {@category Endpoint}
class EndpointEnvironments extends _i1.EndpointRef {
  EndpointEnvironments(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'environments';

  _i2.Future<List<_i20.EnvironmentModel>> list(int workspaceId) =>
      caller.callServerEndpoint<List<_i20.EnvironmentModel>>(
        'environments',
        'list',
        {'workspaceId': workspaceId},
      );

  _i2.Future<_i20.EnvironmentModel> get(
    int workspaceId,
    int environmentId,
  ) => caller.callServerEndpoint<_i20.EnvironmentModel>(
    'environments',
    'get',
    {
      'workspaceId': workspaceId,
      'environmentId': environmentId,
    },
  );

  _i2.Future<_i20.EnvironmentModel> create(
    _i21.CreateEnvironmentRequest request,
  ) => caller.callServerEndpoint<_i20.EnvironmentModel>(
    'environments',
    'create',
    {'request': request},
  );

  _i2.Future<_i20.EnvironmentModel> update(
    _i22.UpdateEnvironmentRequest request,
  ) => caller.callServerEndpoint<_i20.EnvironmentModel>(
    'environments',
    'update',
    {'request': request},
  );

  _i2.Future<void> remove(
    int workspaceId,
    int environmentId,
  ) => caller.callServerEndpoint<void>(
    'environments',
    'remove',
    {
      'workspaceId': workspaceId,
      'environmentId': environmentId,
    },
  );

  _i2.Future<List<_i23.EnvironmentVariableModel>> listVariables(
    int workspaceId,
    int environmentId,
  ) => caller.callServerEndpoint<List<_i23.EnvironmentVariableModel>>(
    'environments',
    'listVariables',
    {
      'workspaceId': workspaceId,
      'environmentId': environmentId,
    },
  );

  _i2.Future<_i23.EnvironmentVariableModel> createVariable(
    _i24.CreateEnvironmentVariableRequest request,
  ) => caller.callServerEndpoint<_i23.EnvironmentVariableModel>(
    'environments',
    'createVariable',
    {'request': request},
  );

  _i2.Future<_i23.EnvironmentVariableModel> updateVariable(
    _i25.UpdateEnvironmentVariableRequest request,
  ) => caller.callServerEndpoint<_i23.EnvironmentVariableModel>(
    'environments',
    'updateVariable',
    {'request': request},
  );

  _i2.Future<void> removeVariable(
    int workspaceId,
    int environmentId,
    int variableId,
  ) => caller.callServerEndpoint<void>(
    'environments',
    'removeVariable',
    {
      'workspaceId': workspaceId,
      'environmentId': environmentId,
      'variableId': variableId,
    },
  );
}

/// {@category Endpoint}
class EndpointImportExport extends _i1.EndpointRef {
  EndpointImportExport(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'importExport';

  _i2.Future<List<_i26.ImportExportJobModel>> listJobs(int workspaceId) =>
      caller.callServerEndpoint<List<_i26.ImportExportJobModel>>(
        'importExport',
        'listJobs',
        {'workspaceId': workspaceId},
      );

  _i2.Future<_i26.ImportExportJobModel> getJobById(
    int workspaceId,
    int jobId,
  ) => caller.callServerEndpoint<_i26.ImportExportJobModel>(
    'importExport',
    'getJobById',
    {
      'workspaceId': workspaceId,
      'jobId': jobId,
    },
  );

  _i2.Future<_i26.ImportExportJobModel> createExport(
    _i27.CreateWorkspaceExportRequest request,
  ) => caller.callServerEndpoint<_i26.ImportExportJobModel>(
    'importExport',
    'createExport',
    {'request': request},
  );

  _i2.Future<_i26.ImportExportJobModel> createImport(
    _i28.CreateWorkspaceImportRequest request,
  ) => caller.callServerEndpoint<_i26.ImportExportJobModel>(
    'importExport',
    'createImport',
    {'request': request},
  );
}

/// {@category Endpoint}
class EndpointRuns extends _i1.EndpointRef {
  EndpointRuns(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'runs';

  _i2.Future<List<_i29.RequestRunModel>> list(int workspaceId) =>
      caller.callServerEndpoint<List<_i29.RequestRunModel>>(
        'runs',
        'list',
        {'workspaceId': workspaceId},
      );

  _i2.Future<_i30.RequestRunDetailModel> get(
    int workspaceId,
    int runId,
  ) => caller.callServerEndpoint<_i30.RequestRunDetailModel>(
    'runs',
    'get',
    {
      'workspaceId': workspaceId,
      'runId': runId,
    },
  );

  _i2.Future<_i30.RequestRunDetailModel> create(
    _i31.CreateRequestRunRequest request,
  ) => caller.callServerEndpoint<_i30.RequestRunDetailModel>(
    'runs',
    'create',
    {'request': request},
  );

  _i2.Future<_i29.RequestRunModel> cancel(
    int workspaceId,
    int runId,
  ) => caller.callServerEndpoint<_i29.RequestRunModel>(
    'runs',
    'cancel',
    {
      'workspaceId': workspaceId,
      'runId': runId,
    },
  );
}

/// {@category Endpoint}
class EndpointWorkspaces extends _i1.EndpointRef {
  EndpointWorkspaces(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'workspaces';

  _i2.Future<List<_i32.WorkspaceModel>> list() =>
      caller.callServerEndpoint<List<_i32.WorkspaceModel>>(
        'workspaces',
        'list',
        {},
      );

  _i2.Future<_i32.WorkspaceModel> get(int workspaceId) =>
      caller.callServerEndpoint<_i32.WorkspaceModel>(
        'workspaces',
        'get',
        {'workspaceId': workspaceId},
      );

  _i2.Future<_i32.WorkspaceModel> create(_i33.CreateWorkspaceRequest request) =>
      caller.callServerEndpoint<_i32.WorkspaceModel>(
        'workspaces',
        'create',
        {'request': request},
      );

  _i2.Future<List<_i34.WorkspaceMemberModel>> listMembers(int workspaceId) =>
      caller.callServerEndpoint<List<_i34.WorkspaceMemberModel>>(
        'workspaces',
        'listMembers',
        {'workspaceId': workspaceId},
      );

  _i2.Future<_i35.WorkspaceInvitationIssueModel> createInvitation(
    _i36.CreateWorkspaceInvitationRequest request,
  ) => caller.callServerEndpoint<_i35.WorkspaceInvitationIssueModel>(
    'workspaces',
    'createInvitation',
    {'request': request},
  );

  _i2.Future<_i32.WorkspaceModel> acceptInvitation(
    _i37.AcceptWorkspaceInvitationRequest request,
  ) => caller.callServerEndpoint<_i32.WorkspaceModel>(
    'workspaces',
    'acceptInvitation',
    {'request': request},
  );

  _i2.Future<_i34.WorkspaceMemberModel> updateMemberRole(
    _i38.UpdateWorkspaceMemberRoleRequest request,
  ) => caller.callServerEndpoint<_i34.WorkspaceMemberModel>(
    'workspaces',
    'updateMemberRole',
    {'request': request},
  );

  _i2.Future<void> removeMember(
    int workspaceId,
    int memberUserId,
  ) => caller.callServerEndpoint<void>(
    'workspaces',
    'removeMember',
    {
      'workspaceId': workspaceId,
      'memberUserId': memberUserId,
    },
  );

  _i2.Future<void> leave(int workspaceId) => caller.callServerEndpoint<void>(
    'workspaces',
    'leave',
    {'workspaceId': workspaceId},
  );

  _i2.Future<_i32.WorkspaceModel> convertToTeam(
    _i39.ConvertWorkspaceToTeamRequest request,
  ) => caller.callServerEndpoint<_i32.WorkspaceModel>(
    'workspaces',
    'convertToTeam',
    {'request': request},
  );

  _i2.Future<List<_i40.WorkspaceEventModel>> listUpdates(
    _i41.WorkspaceUpdatesQuery query,
  ) => caller.callServerEndpoint<List<_i40.WorkspaceEventModel>>(
    'workspaces',
    'listUpdates',
    {'query': query},
  );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i42.Caller(client);
    serverpod_auth_core = _i43.Caller(client);
  }

  late final _i42.Caller serverpod_auth_idp;

  late final _i43.Caller serverpod_auth_core;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i44.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    auth = EndpointAuth(this);
    collections = EndpointCollections(this);
    environments = EndpointEnvironments(this);
    importExport = EndpointImportExport(this);
    runs = EndpointRuns(this);
    workspaces = EndpointWorkspaces(this);
    modules = Modules(this);
  }

  late final EndpointAuth auth;

  late final EndpointCollections collections;

  late final EndpointEnvironments environments;

  late final EndpointImportExport importExport;

  late final EndpointRuns runs;

  late final EndpointWorkspaces workspaces;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'auth': auth,
    'collections': collections,
    'environments': environments,
    'importExport': importExport,
    'runs': runs,
    'workspaces': workspaces,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}

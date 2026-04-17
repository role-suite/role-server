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
import 'features/auth/models/auth_login_request.dart' as _i2;
import 'features/auth/models/auth_refresh_request.dart' as _i3;
import 'features/auth/models/auth_register_request.dart' as _i4;
import 'features/auth/models/auth_token_pair.dart' as _i5;
import 'features/auth/models/auth_user_model.dart' as _i6;
import 'features/auth/models/stored_auth_session.dart' as _i7;
import 'features/auth/models/stored_auth_user.dart' as _i8;
import 'features/collections/models/collection_endpoint_example_model.dart'
    as _i9;
import 'features/collections/models/collection_endpoint_model.dart' as _i10;
import 'features/collections/models/collection_folder_model.dart' as _i11;
import 'features/collections/models/collection_model.dart' as _i12;
import 'features/collections/models/create_collection_endpoint_example_request.dart'
    as _i13;
import 'features/collections/models/create_collection_endpoint_request.dart'
    as _i14;
import 'features/collections/models/create_collection_folder_request.dart'
    as _i15;
import 'features/collections/models/create_collection_request.dart' as _i16;
import 'features/collections/models/stored_collection.dart' as _i17;
import 'features/collections/models/stored_collection_endpoint.dart' as _i18;
import 'features/collections/models/stored_collection_endpoint_example.dart'
    as _i19;
import 'features/collections/models/stored_collection_folder.dart' as _i20;
import 'features/collections/models/update_collection_endpoint_example_request.dart'
    as _i21;
import 'features/collections/models/update_collection_endpoint_request.dart'
    as _i22;
import 'features/collections/models/update_collection_folder_request.dart'
    as _i23;
import 'features/collections/models/update_collection_request.dart' as _i24;
import 'features/environments/models/create_environment_request.dart' as _i25;
import 'features/environments/models/create_environment_variable_request.dart'
    as _i26;
import 'features/environments/models/environment_model.dart' as _i27;
import 'features/environments/models/environment_variable_model.dart' as _i28;
import 'features/environments/models/stored_environment.dart' as _i29;
import 'features/environments/models/stored_environment_variable.dart' as _i30;
import 'features/environments/models/update_environment_request.dart' as _i31;
import 'features/environments/models/update_environment_variable_request.dart'
    as _i32;
import 'features/import_export/models/create_workspace_export_request.dart'
    as _i33;
import 'features/import_export/models/create_workspace_import_request.dart'
    as _i34;
import 'features/import_export/models/import_export_job_model.dart' as _i35;
import 'features/import_export/models/stored_import_export_job.dart' as _i36;
import 'features/runs/models/create_request_run_request.dart' as _i37;
import 'features/runs/models/request_run_detail_model.dart' as _i38;
import 'features/runs/models/request_run_model.dart' as _i39;
import 'features/runs/models/request_run_request_snapshot_model.dart' as _i40;
import 'features/runs/models/request_run_response_snapshot_model.dart' as _i41;
import 'features/runs/models/run_error_model.dart' as _i42;
import 'features/runs/models/stored_request_run.dart' as _i43;
import 'features/runs/models/stored_request_run_request_snapshot.dart' as _i44;
import 'features/runs/models/stored_request_run_response_snapshot.dart' as _i45;
import 'features/workspaces/models/accept_workspace_invitation_request.dart'
    as _i46;
import 'features/workspaces/models/convert_workspace_to_team_request.dart'
    as _i47;
import 'features/workspaces/models/create_workspace_invitation_request.dart'
    as _i48;
import 'features/workspaces/models/create_workspace_request.dart' as _i49;
import 'features/workspaces/models/stored_workspace.dart' as _i50;
import 'features/workspaces/models/stored_workspace_event.dart' as _i51;
import 'features/workspaces/models/stored_workspace_invitation.dart' as _i52;
import 'features/workspaces/models/stored_workspace_membership.dart' as _i53;
import 'features/workspaces/models/update_workspace_member_role_request.dart'
    as _i54;
import 'features/workspaces/models/workspace_event_model.dart' as _i55;
import 'features/workspaces/models/workspace_invitation_issue_model.dart'
    as _i56;
import 'features/workspaces/models/workspace_invitation_model.dart' as _i57;
import 'features/workspaces/models/workspace_member_model.dart' as _i58;
import 'features/workspaces/models/workspace_model.dart' as _i59;
import 'features/workspaces/models/workspace_updates_query.dart' as _i60;
import 'package:relay_server_client/src/protocol/features/collections/models/collection_model.dart'
    as _i61;
import 'package:relay_server_client/src/protocol/features/collections/models/collection_folder_model.dart'
    as _i62;
import 'package:relay_server_client/src/protocol/features/collections/models/collection_endpoint_model.dart'
    as _i63;
import 'package:relay_server_client/src/protocol/features/collections/models/collection_endpoint_example_model.dart'
    as _i64;
import 'package:relay_server_client/src/protocol/features/environments/models/environment_model.dart'
    as _i65;
import 'package:relay_server_client/src/protocol/features/environments/models/environment_variable_model.dart'
    as _i66;
import 'package:relay_server_client/src/protocol/features/import_export/models/import_export_job_model.dart'
    as _i67;
import 'package:relay_server_client/src/protocol/features/runs/models/request_run_model.dart'
    as _i68;
import 'package:relay_server_client/src/protocol/features/workspaces/models/workspace_model.dart'
    as _i69;
import 'package:relay_server_client/src/protocol/features/workspaces/models/workspace_member_model.dart'
    as _i70;
import 'package:relay_server_client/src/protocol/features/workspaces/models/workspace_event_model.dart'
    as _i71;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i72;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i73;
export 'features/auth/models/auth_login_request.dart';
export 'features/auth/models/auth_refresh_request.dart';
export 'features/auth/models/auth_register_request.dart';
export 'features/auth/models/auth_token_pair.dart';
export 'features/auth/models/auth_user_model.dart';
export 'features/auth/models/stored_auth_session.dart';
export 'features/auth/models/stored_auth_user.dart';
export 'features/collections/models/collection_endpoint_example_model.dart';
export 'features/collections/models/collection_endpoint_model.dart';
export 'features/collections/models/collection_folder_model.dart';
export 'features/collections/models/collection_model.dart';
export 'features/collections/models/create_collection_endpoint_example_request.dart';
export 'features/collections/models/create_collection_endpoint_request.dart';
export 'features/collections/models/create_collection_folder_request.dart';
export 'features/collections/models/create_collection_request.dart';
export 'features/collections/models/stored_collection.dart';
export 'features/collections/models/stored_collection_endpoint.dart';
export 'features/collections/models/stored_collection_endpoint_example.dart';
export 'features/collections/models/stored_collection_folder.dart';
export 'features/collections/models/update_collection_endpoint_example_request.dart';
export 'features/collections/models/update_collection_endpoint_request.dart';
export 'features/collections/models/update_collection_folder_request.dart';
export 'features/collections/models/update_collection_request.dart';
export 'features/environments/models/create_environment_request.dart';
export 'features/environments/models/create_environment_variable_request.dart';
export 'features/environments/models/environment_model.dart';
export 'features/environments/models/environment_variable_model.dart';
export 'features/environments/models/stored_environment.dart';
export 'features/environments/models/stored_environment_variable.dart';
export 'features/environments/models/update_environment_request.dart';
export 'features/environments/models/update_environment_variable_request.dart';
export 'features/import_export/models/create_workspace_export_request.dart';
export 'features/import_export/models/create_workspace_import_request.dart';
export 'features/import_export/models/import_export_job_model.dart';
export 'features/import_export/models/stored_import_export_job.dart';
export 'features/runs/models/create_request_run_request.dart';
export 'features/runs/models/request_run_detail_model.dart';
export 'features/runs/models/request_run_model.dart';
export 'features/runs/models/request_run_request_snapshot_model.dart';
export 'features/runs/models/request_run_response_snapshot_model.dart';
export 'features/runs/models/run_error_model.dart';
export 'features/runs/models/stored_request_run.dart';
export 'features/runs/models/stored_request_run_request_snapshot.dart';
export 'features/runs/models/stored_request_run_response_snapshot.dart';
export 'features/workspaces/models/accept_workspace_invitation_request.dart';
export 'features/workspaces/models/convert_workspace_to_team_request.dart';
export 'features/workspaces/models/create_workspace_invitation_request.dart';
export 'features/workspaces/models/create_workspace_request.dart';
export 'features/workspaces/models/stored_workspace.dart';
export 'features/workspaces/models/stored_workspace_event.dart';
export 'features/workspaces/models/stored_workspace_invitation.dart';
export 'features/workspaces/models/stored_workspace_membership.dart';
export 'features/workspaces/models/update_workspace_member_role_request.dart';
export 'features/workspaces/models/workspace_event_model.dart';
export 'features/workspaces/models/workspace_invitation_issue_model.dart';
export 'features/workspaces/models/workspace_invitation_model.dart';
export 'features/workspaces/models/workspace_member_model.dart';
export 'features/workspaces/models/workspace_model.dart';
export 'features/workspaces/models/workspace_updates_query.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.AuthLoginRequest) {
      return _i2.AuthLoginRequest.fromJson(data) as T;
    }
    if (t == _i3.AuthRefreshRequest) {
      return _i3.AuthRefreshRequest.fromJson(data) as T;
    }
    if (t == _i4.AuthRegisterRequest) {
      return _i4.AuthRegisterRequest.fromJson(data) as T;
    }
    if (t == _i5.AuthTokenPair) {
      return _i5.AuthTokenPair.fromJson(data) as T;
    }
    if (t == _i6.AuthUserModel) {
      return _i6.AuthUserModel.fromJson(data) as T;
    }
    if (t == _i7.StoredAuthSession) {
      return _i7.StoredAuthSession.fromJson(data) as T;
    }
    if (t == _i8.StoredAuthUser) {
      return _i8.StoredAuthUser.fromJson(data) as T;
    }
    if (t == _i9.CollectionEndpointExampleModel) {
      return _i9.CollectionEndpointExampleModel.fromJson(data) as T;
    }
    if (t == _i10.CollectionEndpointModel) {
      return _i10.CollectionEndpointModel.fromJson(data) as T;
    }
    if (t == _i11.CollectionFolderModel) {
      return _i11.CollectionFolderModel.fromJson(data) as T;
    }
    if (t == _i12.CollectionModel) {
      return _i12.CollectionModel.fromJson(data) as T;
    }
    if (t == _i13.CreateCollectionEndpointExampleRequest) {
      return _i13.CreateCollectionEndpointExampleRequest.fromJson(data) as T;
    }
    if (t == _i14.CreateCollectionEndpointRequest) {
      return _i14.CreateCollectionEndpointRequest.fromJson(data) as T;
    }
    if (t == _i15.CreateCollectionFolderRequest) {
      return _i15.CreateCollectionFolderRequest.fromJson(data) as T;
    }
    if (t == _i16.CreateCollectionRequest) {
      return _i16.CreateCollectionRequest.fromJson(data) as T;
    }
    if (t == _i17.StoredCollection) {
      return _i17.StoredCollection.fromJson(data) as T;
    }
    if (t == _i18.StoredCollectionEndpoint) {
      return _i18.StoredCollectionEndpoint.fromJson(data) as T;
    }
    if (t == _i19.StoredCollectionEndpointExample) {
      return _i19.StoredCollectionEndpointExample.fromJson(data) as T;
    }
    if (t == _i20.StoredCollectionFolder) {
      return _i20.StoredCollectionFolder.fromJson(data) as T;
    }
    if (t == _i21.UpdateCollectionEndpointExampleRequest) {
      return _i21.UpdateCollectionEndpointExampleRequest.fromJson(data) as T;
    }
    if (t == _i22.UpdateCollectionEndpointRequest) {
      return _i22.UpdateCollectionEndpointRequest.fromJson(data) as T;
    }
    if (t == _i23.UpdateCollectionFolderRequest) {
      return _i23.UpdateCollectionFolderRequest.fromJson(data) as T;
    }
    if (t == _i24.UpdateCollectionRequest) {
      return _i24.UpdateCollectionRequest.fromJson(data) as T;
    }
    if (t == _i25.CreateEnvironmentRequest) {
      return _i25.CreateEnvironmentRequest.fromJson(data) as T;
    }
    if (t == _i26.CreateEnvironmentVariableRequest) {
      return _i26.CreateEnvironmentVariableRequest.fromJson(data) as T;
    }
    if (t == _i27.EnvironmentModel) {
      return _i27.EnvironmentModel.fromJson(data) as T;
    }
    if (t == _i28.EnvironmentVariableModel) {
      return _i28.EnvironmentVariableModel.fromJson(data) as T;
    }
    if (t == _i29.StoredEnvironment) {
      return _i29.StoredEnvironment.fromJson(data) as T;
    }
    if (t == _i30.StoredEnvironmentVariable) {
      return _i30.StoredEnvironmentVariable.fromJson(data) as T;
    }
    if (t == _i31.UpdateEnvironmentRequest) {
      return _i31.UpdateEnvironmentRequest.fromJson(data) as T;
    }
    if (t == _i32.UpdateEnvironmentVariableRequest) {
      return _i32.UpdateEnvironmentVariableRequest.fromJson(data) as T;
    }
    if (t == _i33.CreateWorkspaceExportRequest) {
      return _i33.CreateWorkspaceExportRequest.fromJson(data) as T;
    }
    if (t == _i34.CreateWorkspaceImportRequest) {
      return _i34.CreateWorkspaceImportRequest.fromJson(data) as T;
    }
    if (t == _i35.ImportExportJobModel) {
      return _i35.ImportExportJobModel.fromJson(data) as T;
    }
    if (t == _i36.StoredImportExportJob) {
      return _i36.StoredImportExportJob.fromJson(data) as T;
    }
    if (t == _i37.CreateRequestRunRequest) {
      return _i37.CreateRequestRunRequest.fromJson(data) as T;
    }
    if (t == _i38.RequestRunDetailModel) {
      return _i38.RequestRunDetailModel.fromJson(data) as T;
    }
    if (t == _i39.RequestRunModel) {
      return _i39.RequestRunModel.fromJson(data) as T;
    }
    if (t == _i40.RequestRunRequestSnapshotModel) {
      return _i40.RequestRunRequestSnapshotModel.fromJson(data) as T;
    }
    if (t == _i41.RequestRunResponseSnapshotModel) {
      return _i41.RequestRunResponseSnapshotModel.fromJson(data) as T;
    }
    if (t == _i42.RunErrorModel) {
      return _i42.RunErrorModel.fromJson(data) as T;
    }
    if (t == _i43.StoredRequestRun) {
      return _i43.StoredRequestRun.fromJson(data) as T;
    }
    if (t == _i44.StoredRequestRunRequestSnapshot) {
      return _i44.StoredRequestRunRequestSnapshot.fromJson(data) as T;
    }
    if (t == _i45.StoredRequestRunResponseSnapshot) {
      return _i45.StoredRequestRunResponseSnapshot.fromJson(data) as T;
    }
    if (t == _i46.AcceptWorkspaceInvitationRequest) {
      return _i46.AcceptWorkspaceInvitationRequest.fromJson(data) as T;
    }
    if (t == _i47.ConvertWorkspaceToTeamRequest) {
      return _i47.ConvertWorkspaceToTeamRequest.fromJson(data) as T;
    }
    if (t == _i48.CreateWorkspaceInvitationRequest) {
      return _i48.CreateWorkspaceInvitationRequest.fromJson(data) as T;
    }
    if (t == _i49.CreateWorkspaceRequest) {
      return _i49.CreateWorkspaceRequest.fromJson(data) as T;
    }
    if (t == _i50.StoredWorkspace) {
      return _i50.StoredWorkspace.fromJson(data) as T;
    }
    if (t == _i51.StoredWorkspaceEvent) {
      return _i51.StoredWorkspaceEvent.fromJson(data) as T;
    }
    if (t == _i52.StoredWorkspaceInvitation) {
      return _i52.StoredWorkspaceInvitation.fromJson(data) as T;
    }
    if (t == _i53.StoredWorkspaceMembership) {
      return _i53.StoredWorkspaceMembership.fromJson(data) as T;
    }
    if (t == _i54.UpdateWorkspaceMemberRoleRequest) {
      return _i54.UpdateWorkspaceMemberRoleRequest.fromJson(data) as T;
    }
    if (t == _i55.WorkspaceEventModel) {
      return _i55.WorkspaceEventModel.fromJson(data) as T;
    }
    if (t == _i56.WorkspaceInvitationIssueModel) {
      return _i56.WorkspaceInvitationIssueModel.fromJson(data) as T;
    }
    if (t == _i57.WorkspaceInvitationModel) {
      return _i57.WorkspaceInvitationModel.fromJson(data) as T;
    }
    if (t == _i58.WorkspaceMemberModel) {
      return _i58.WorkspaceMemberModel.fromJson(data) as T;
    }
    if (t == _i59.WorkspaceModel) {
      return _i59.WorkspaceModel.fromJson(data) as T;
    }
    if (t == _i60.WorkspaceUpdatesQuery) {
      return _i60.WorkspaceUpdatesQuery.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AuthLoginRequest?>()) {
      return (data != null ? _i2.AuthLoginRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AuthRefreshRequest?>()) {
      return (data != null ? _i3.AuthRefreshRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AuthRegisterRequest?>()) {
      return (data != null ? _i4.AuthRegisterRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.AuthTokenPair?>()) {
      return (data != null ? _i5.AuthTokenPair.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AuthUserModel?>()) {
      return (data != null ? _i6.AuthUserModel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.StoredAuthSession?>()) {
      return (data != null ? _i7.StoredAuthSession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.StoredAuthUser?>()) {
      return (data != null ? _i8.StoredAuthUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.CollectionEndpointExampleModel?>()) {
      return (data != null
              ? _i9.CollectionEndpointExampleModel.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i10.CollectionEndpointModel?>()) {
      return (data != null ? _i10.CollectionEndpointModel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.CollectionFolderModel?>()) {
      return (data != null ? _i11.CollectionFolderModel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.CollectionModel?>()) {
      return (data != null ? _i12.CollectionModel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.CreateCollectionEndpointExampleRequest?>()) {
      return (data != null
              ? _i13.CreateCollectionEndpointExampleRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i14.CreateCollectionEndpointRequest?>()) {
      return (data != null
              ? _i14.CreateCollectionEndpointRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i15.CreateCollectionFolderRequest?>()) {
      return (data != null
              ? _i15.CreateCollectionFolderRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i16.CreateCollectionRequest?>()) {
      return (data != null ? _i16.CreateCollectionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.StoredCollection?>()) {
      return (data != null ? _i17.StoredCollection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.StoredCollectionEndpoint?>()) {
      return (data != null
              ? _i18.StoredCollectionEndpoint.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i19.StoredCollectionEndpointExample?>()) {
      return (data != null
              ? _i19.StoredCollectionEndpointExample.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i20.StoredCollectionFolder?>()) {
      return (data != null ? _i20.StoredCollectionFolder.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.UpdateCollectionEndpointExampleRequest?>()) {
      return (data != null
              ? _i21.UpdateCollectionEndpointExampleRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i22.UpdateCollectionEndpointRequest?>()) {
      return (data != null
              ? _i22.UpdateCollectionEndpointRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i23.UpdateCollectionFolderRequest?>()) {
      return (data != null
              ? _i23.UpdateCollectionFolderRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i24.UpdateCollectionRequest?>()) {
      return (data != null ? _i24.UpdateCollectionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.CreateEnvironmentRequest?>()) {
      return (data != null
              ? _i25.CreateEnvironmentRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i26.CreateEnvironmentVariableRequest?>()) {
      return (data != null
              ? _i26.CreateEnvironmentVariableRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i27.EnvironmentModel?>()) {
      return (data != null ? _i27.EnvironmentModel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.EnvironmentVariableModel?>()) {
      return (data != null
              ? _i28.EnvironmentVariableModel.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i29.StoredEnvironment?>()) {
      return (data != null ? _i29.StoredEnvironment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.StoredEnvironmentVariable?>()) {
      return (data != null
              ? _i30.StoredEnvironmentVariable.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i31.UpdateEnvironmentRequest?>()) {
      return (data != null
              ? _i31.UpdateEnvironmentRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i32.UpdateEnvironmentVariableRequest?>()) {
      return (data != null
              ? _i32.UpdateEnvironmentVariableRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i33.CreateWorkspaceExportRequest?>()) {
      return (data != null
              ? _i33.CreateWorkspaceExportRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i34.CreateWorkspaceImportRequest?>()) {
      return (data != null
              ? _i34.CreateWorkspaceImportRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i35.ImportExportJobModel?>()) {
      return (data != null ? _i35.ImportExportJobModel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i36.StoredImportExportJob?>()) {
      return (data != null ? _i36.StoredImportExportJob.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i37.CreateRequestRunRequest?>()) {
      return (data != null ? _i37.CreateRequestRunRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i38.RequestRunDetailModel?>()) {
      return (data != null ? _i38.RequestRunDetailModel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i39.RequestRunModel?>()) {
      return (data != null ? _i39.RequestRunModel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.RequestRunRequestSnapshotModel?>()) {
      return (data != null
              ? _i40.RequestRunRequestSnapshotModel.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i41.RequestRunResponseSnapshotModel?>()) {
      return (data != null
              ? _i41.RequestRunResponseSnapshotModel.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i42.RunErrorModel?>()) {
      return (data != null ? _i42.RunErrorModel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.StoredRequestRun?>()) {
      return (data != null ? _i43.StoredRequestRun.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.StoredRequestRunRequestSnapshot?>()) {
      return (data != null
              ? _i44.StoredRequestRunRequestSnapshot.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i45.StoredRequestRunResponseSnapshot?>()) {
      return (data != null
              ? _i45.StoredRequestRunResponseSnapshot.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i46.AcceptWorkspaceInvitationRequest?>()) {
      return (data != null
              ? _i46.AcceptWorkspaceInvitationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i47.ConvertWorkspaceToTeamRequest?>()) {
      return (data != null
              ? _i47.ConvertWorkspaceToTeamRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i48.CreateWorkspaceInvitationRequest?>()) {
      return (data != null
              ? _i48.CreateWorkspaceInvitationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i49.CreateWorkspaceRequest?>()) {
      return (data != null ? _i49.CreateWorkspaceRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i50.StoredWorkspace?>()) {
      return (data != null ? _i50.StoredWorkspace.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.StoredWorkspaceEvent?>()) {
      return (data != null ? _i51.StoredWorkspaceEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i52.StoredWorkspaceInvitation?>()) {
      return (data != null
              ? _i52.StoredWorkspaceInvitation.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i53.StoredWorkspaceMembership?>()) {
      return (data != null
              ? _i53.StoredWorkspaceMembership.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i54.UpdateWorkspaceMemberRoleRequest?>()) {
      return (data != null
              ? _i54.UpdateWorkspaceMemberRoleRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i55.WorkspaceEventModel?>()) {
      return (data != null ? _i55.WorkspaceEventModel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i56.WorkspaceInvitationIssueModel?>()) {
      return (data != null
              ? _i56.WorkspaceInvitationIssueModel.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i57.WorkspaceInvitationModel?>()) {
      return (data != null
              ? _i57.WorkspaceInvitationModel.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i58.WorkspaceMemberModel?>()) {
      return (data != null ? _i58.WorkspaceMemberModel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i59.WorkspaceModel?>()) {
      return (data != null ? _i59.WorkspaceModel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.WorkspaceUpdatesQuery?>()) {
      return (data != null ? _i60.WorkspaceUpdatesQuery.fromJson(data) : null)
          as T;
    }
    if (t == List<_i61.CollectionModel>) {
      return (data as List)
              .map((e) => deserialize<_i61.CollectionModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i62.CollectionFolderModel>) {
      return (data as List)
              .map((e) => deserialize<_i62.CollectionFolderModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i63.CollectionEndpointModel>) {
      return (data as List)
              .map((e) => deserialize<_i63.CollectionEndpointModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i64.CollectionEndpointExampleModel>) {
      return (data as List)
              .map((e) => deserialize<_i64.CollectionEndpointExampleModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i65.EnvironmentModel>) {
      return (data as List)
              .map((e) => deserialize<_i65.EnvironmentModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i66.EnvironmentVariableModel>) {
      return (data as List)
              .map((e) => deserialize<_i66.EnvironmentVariableModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i67.ImportExportJobModel>) {
      return (data as List)
              .map((e) => deserialize<_i67.ImportExportJobModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i68.RequestRunModel>) {
      return (data as List)
              .map((e) => deserialize<_i68.RequestRunModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i69.WorkspaceModel>) {
      return (data as List)
              .map((e) => deserialize<_i69.WorkspaceModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i70.WorkspaceMemberModel>) {
      return (data as List)
              .map((e) => deserialize<_i70.WorkspaceMemberModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i71.WorkspaceEventModel>) {
      return (data as List)
              .map((e) => deserialize<_i71.WorkspaceEventModel>(e))
              .toList()
          as T;
    }
    try {
      return _i72.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i73.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AuthLoginRequest => 'AuthLoginRequest',
      _i3.AuthRefreshRequest => 'AuthRefreshRequest',
      _i4.AuthRegisterRequest => 'AuthRegisterRequest',
      _i5.AuthTokenPair => 'AuthTokenPair',
      _i6.AuthUserModel => 'AuthUserModel',
      _i7.StoredAuthSession => 'StoredAuthSession',
      _i8.StoredAuthUser => 'StoredAuthUser',
      _i9.CollectionEndpointExampleModel => 'CollectionEndpointExampleModel',
      _i10.CollectionEndpointModel => 'CollectionEndpointModel',
      _i11.CollectionFolderModel => 'CollectionFolderModel',
      _i12.CollectionModel => 'CollectionModel',
      _i13.CreateCollectionEndpointExampleRequest =>
        'CreateCollectionEndpointExampleRequest',
      _i14.CreateCollectionEndpointRequest => 'CreateCollectionEndpointRequest',
      _i15.CreateCollectionFolderRequest => 'CreateCollectionFolderRequest',
      _i16.CreateCollectionRequest => 'CreateCollectionRequest',
      _i17.StoredCollection => 'StoredCollection',
      _i18.StoredCollectionEndpoint => 'StoredCollectionEndpoint',
      _i19.StoredCollectionEndpointExample => 'StoredCollectionEndpointExample',
      _i20.StoredCollectionFolder => 'StoredCollectionFolder',
      _i21.UpdateCollectionEndpointExampleRequest =>
        'UpdateCollectionEndpointExampleRequest',
      _i22.UpdateCollectionEndpointRequest => 'UpdateCollectionEndpointRequest',
      _i23.UpdateCollectionFolderRequest => 'UpdateCollectionFolderRequest',
      _i24.UpdateCollectionRequest => 'UpdateCollectionRequest',
      _i25.CreateEnvironmentRequest => 'CreateEnvironmentRequest',
      _i26.CreateEnvironmentVariableRequest =>
        'CreateEnvironmentVariableRequest',
      _i27.EnvironmentModel => 'EnvironmentModel',
      _i28.EnvironmentVariableModel => 'EnvironmentVariableModel',
      _i29.StoredEnvironment => 'StoredEnvironment',
      _i30.StoredEnvironmentVariable => 'StoredEnvironmentVariable',
      _i31.UpdateEnvironmentRequest => 'UpdateEnvironmentRequest',
      _i32.UpdateEnvironmentVariableRequest =>
        'UpdateEnvironmentVariableRequest',
      _i33.CreateWorkspaceExportRequest => 'CreateWorkspaceExportRequest',
      _i34.CreateWorkspaceImportRequest => 'CreateWorkspaceImportRequest',
      _i35.ImportExportJobModel => 'ImportExportJobModel',
      _i36.StoredImportExportJob => 'StoredImportExportJob',
      _i37.CreateRequestRunRequest => 'CreateRequestRunRequest',
      _i38.RequestRunDetailModel => 'RequestRunDetailModel',
      _i39.RequestRunModel => 'RequestRunModel',
      _i40.RequestRunRequestSnapshotModel => 'RequestRunRequestSnapshotModel',
      _i41.RequestRunResponseSnapshotModel => 'RequestRunResponseSnapshotModel',
      _i42.RunErrorModel => 'RunErrorModel',
      _i43.StoredRequestRun => 'StoredRequestRun',
      _i44.StoredRequestRunRequestSnapshot => 'StoredRequestRunRequestSnapshot',
      _i45.StoredRequestRunResponseSnapshot =>
        'StoredRequestRunResponseSnapshot',
      _i46.AcceptWorkspaceInvitationRequest =>
        'AcceptWorkspaceInvitationRequest',
      _i47.ConvertWorkspaceToTeamRequest => 'ConvertWorkspaceToTeamRequest',
      _i48.CreateWorkspaceInvitationRequest =>
        'CreateWorkspaceInvitationRequest',
      _i49.CreateWorkspaceRequest => 'CreateWorkspaceRequest',
      _i50.StoredWorkspace => 'StoredWorkspace',
      _i51.StoredWorkspaceEvent => 'StoredWorkspaceEvent',
      _i52.StoredWorkspaceInvitation => 'StoredWorkspaceInvitation',
      _i53.StoredWorkspaceMembership => 'StoredWorkspaceMembership',
      _i54.UpdateWorkspaceMemberRoleRequest =>
        'UpdateWorkspaceMemberRoleRequest',
      _i55.WorkspaceEventModel => 'WorkspaceEventModel',
      _i56.WorkspaceInvitationIssueModel => 'WorkspaceInvitationIssueModel',
      _i57.WorkspaceInvitationModel => 'WorkspaceInvitationModel',
      _i58.WorkspaceMemberModel => 'WorkspaceMemberModel',
      _i59.WorkspaceModel => 'WorkspaceModel',
      _i60.WorkspaceUpdatesQuery => 'WorkspaceUpdatesQuery',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'relay_server.',
        '',
      );
    }

    switch (data) {
      case _i2.AuthLoginRequest():
        return 'AuthLoginRequest';
      case _i3.AuthRefreshRequest():
        return 'AuthRefreshRequest';
      case _i4.AuthRegisterRequest():
        return 'AuthRegisterRequest';
      case _i5.AuthTokenPair():
        return 'AuthTokenPair';
      case _i6.AuthUserModel():
        return 'AuthUserModel';
      case _i7.StoredAuthSession():
        return 'StoredAuthSession';
      case _i8.StoredAuthUser():
        return 'StoredAuthUser';
      case _i9.CollectionEndpointExampleModel():
        return 'CollectionEndpointExampleModel';
      case _i10.CollectionEndpointModel():
        return 'CollectionEndpointModel';
      case _i11.CollectionFolderModel():
        return 'CollectionFolderModel';
      case _i12.CollectionModel():
        return 'CollectionModel';
      case _i13.CreateCollectionEndpointExampleRequest():
        return 'CreateCollectionEndpointExampleRequest';
      case _i14.CreateCollectionEndpointRequest():
        return 'CreateCollectionEndpointRequest';
      case _i15.CreateCollectionFolderRequest():
        return 'CreateCollectionFolderRequest';
      case _i16.CreateCollectionRequest():
        return 'CreateCollectionRequest';
      case _i17.StoredCollection():
        return 'StoredCollection';
      case _i18.StoredCollectionEndpoint():
        return 'StoredCollectionEndpoint';
      case _i19.StoredCollectionEndpointExample():
        return 'StoredCollectionEndpointExample';
      case _i20.StoredCollectionFolder():
        return 'StoredCollectionFolder';
      case _i21.UpdateCollectionEndpointExampleRequest():
        return 'UpdateCollectionEndpointExampleRequest';
      case _i22.UpdateCollectionEndpointRequest():
        return 'UpdateCollectionEndpointRequest';
      case _i23.UpdateCollectionFolderRequest():
        return 'UpdateCollectionFolderRequest';
      case _i24.UpdateCollectionRequest():
        return 'UpdateCollectionRequest';
      case _i25.CreateEnvironmentRequest():
        return 'CreateEnvironmentRequest';
      case _i26.CreateEnvironmentVariableRequest():
        return 'CreateEnvironmentVariableRequest';
      case _i27.EnvironmentModel():
        return 'EnvironmentModel';
      case _i28.EnvironmentVariableModel():
        return 'EnvironmentVariableModel';
      case _i29.StoredEnvironment():
        return 'StoredEnvironment';
      case _i30.StoredEnvironmentVariable():
        return 'StoredEnvironmentVariable';
      case _i31.UpdateEnvironmentRequest():
        return 'UpdateEnvironmentRequest';
      case _i32.UpdateEnvironmentVariableRequest():
        return 'UpdateEnvironmentVariableRequest';
      case _i33.CreateWorkspaceExportRequest():
        return 'CreateWorkspaceExportRequest';
      case _i34.CreateWorkspaceImportRequest():
        return 'CreateWorkspaceImportRequest';
      case _i35.ImportExportJobModel():
        return 'ImportExportJobModel';
      case _i36.StoredImportExportJob():
        return 'StoredImportExportJob';
      case _i37.CreateRequestRunRequest():
        return 'CreateRequestRunRequest';
      case _i38.RequestRunDetailModel():
        return 'RequestRunDetailModel';
      case _i39.RequestRunModel():
        return 'RequestRunModel';
      case _i40.RequestRunRequestSnapshotModel():
        return 'RequestRunRequestSnapshotModel';
      case _i41.RequestRunResponseSnapshotModel():
        return 'RequestRunResponseSnapshotModel';
      case _i42.RunErrorModel():
        return 'RunErrorModel';
      case _i43.StoredRequestRun():
        return 'StoredRequestRun';
      case _i44.StoredRequestRunRequestSnapshot():
        return 'StoredRequestRunRequestSnapshot';
      case _i45.StoredRequestRunResponseSnapshot():
        return 'StoredRequestRunResponseSnapshot';
      case _i46.AcceptWorkspaceInvitationRequest():
        return 'AcceptWorkspaceInvitationRequest';
      case _i47.ConvertWorkspaceToTeamRequest():
        return 'ConvertWorkspaceToTeamRequest';
      case _i48.CreateWorkspaceInvitationRequest():
        return 'CreateWorkspaceInvitationRequest';
      case _i49.CreateWorkspaceRequest():
        return 'CreateWorkspaceRequest';
      case _i50.StoredWorkspace():
        return 'StoredWorkspace';
      case _i51.StoredWorkspaceEvent():
        return 'StoredWorkspaceEvent';
      case _i52.StoredWorkspaceInvitation():
        return 'StoredWorkspaceInvitation';
      case _i53.StoredWorkspaceMembership():
        return 'StoredWorkspaceMembership';
      case _i54.UpdateWorkspaceMemberRoleRequest():
        return 'UpdateWorkspaceMemberRoleRequest';
      case _i55.WorkspaceEventModel():
        return 'WorkspaceEventModel';
      case _i56.WorkspaceInvitationIssueModel():
        return 'WorkspaceInvitationIssueModel';
      case _i57.WorkspaceInvitationModel():
        return 'WorkspaceInvitationModel';
      case _i58.WorkspaceMemberModel():
        return 'WorkspaceMemberModel';
      case _i59.WorkspaceModel():
        return 'WorkspaceModel';
      case _i60.WorkspaceUpdatesQuery():
        return 'WorkspaceUpdatesQuery';
    }
    className = _i72.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i73.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AuthLoginRequest') {
      return deserialize<_i2.AuthLoginRequest>(data['data']);
    }
    if (dataClassName == 'AuthRefreshRequest') {
      return deserialize<_i3.AuthRefreshRequest>(data['data']);
    }
    if (dataClassName == 'AuthRegisterRequest') {
      return deserialize<_i4.AuthRegisterRequest>(data['data']);
    }
    if (dataClassName == 'AuthTokenPair') {
      return deserialize<_i5.AuthTokenPair>(data['data']);
    }
    if (dataClassName == 'AuthUserModel') {
      return deserialize<_i6.AuthUserModel>(data['data']);
    }
    if (dataClassName == 'StoredAuthSession') {
      return deserialize<_i7.StoredAuthSession>(data['data']);
    }
    if (dataClassName == 'StoredAuthUser') {
      return deserialize<_i8.StoredAuthUser>(data['data']);
    }
    if (dataClassName == 'CollectionEndpointExampleModel') {
      return deserialize<_i9.CollectionEndpointExampleModel>(data['data']);
    }
    if (dataClassName == 'CollectionEndpointModel') {
      return deserialize<_i10.CollectionEndpointModel>(data['data']);
    }
    if (dataClassName == 'CollectionFolderModel') {
      return deserialize<_i11.CollectionFolderModel>(data['data']);
    }
    if (dataClassName == 'CollectionModel') {
      return deserialize<_i12.CollectionModel>(data['data']);
    }
    if (dataClassName == 'CreateCollectionEndpointExampleRequest') {
      return deserialize<_i13.CreateCollectionEndpointExampleRequest>(
        data['data'],
      );
    }
    if (dataClassName == 'CreateCollectionEndpointRequest') {
      return deserialize<_i14.CreateCollectionEndpointRequest>(data['data']);
    }
    if (dataClassName == 'CreateCollectionFolderRequest') {
      return deserialize<_i15.CreateCollectionFolderRequest>(data['data']);
    }
    if (dataClassName == 'CreateCollectionRequest') {
      return deserialize<_i16.CreateCollectionRequest>(data['data']);
    }
    if (dataClassName == 'StoredCollection') {
      return deserialize<_i17.StoredCollection>(data['data']);
    }
    if (dataClassName == 'StoredCollectionEndpoint') {
      return deserialize<_i18.StoredCollectionEndpoint>(data['data']);
    }
    if (dataClassName == 'StoredCollectionEndpointExample') {
      return deserialize<_i19.StoredCollectionEndpointExample>(data['data']);
    }
    if (dataClassName == 'StoredCollectionFolder') {
      return deserialize<_i20.StoredCollectionFolder>(data['data']);
    }
    if (dataClassName == 'UpdateCollectionEndpointExampleRequest') {
      return deserialize<_i21.UpdateCollectionEndpointExampleRequest>(
        data['data'],
      );
    }
    if (dataClassName == 'UpdateCollectionEndpointRequest') {
      return deserialize<_i22.UpdateCollectionEndpointRequest>(data['data']);
    }
    if (dataClassName == 'UpdateCollectionFolderRequest') {
      return deserialize<_i23.UpdateCollectionFolderRequest>(data['data']);
    }
    if (dataClassName == 'UpdateCollectionRequest') {
      return deserialize<_i24.UpdateCollectionRequest>(data['data']);
    }
    if (dataClassName == 'CreateEnvironmentRequest') {
      return deserialize<_i25.CreateEnvironmentRequest>(data['data']);
    }
    if (dataClassName == 'CreateEnvironmentVariableRequest') {
      return deserialize<_i26.CreateEnvironmentVariableRequest>(data['data']);
    }
    if (dataClassName == 'EnvironmentModel') {
      return deserialize<_i27.EnvironmentModel>(data['data']);
    }
    if (dataClassName == 'EnvironmentVariableModel') {
      return deserialize<_i28.EnvironmentVariableModel>(data['data']);
    }
    if (dataClassName == 'StoredEnvironment') {
      return deserialize<_i29.StoredEnvironment>(data['data']);
    }
    if (dataClassName == 'StoredEnvironmentVariable') {
      return deserialize<_i30.StoredEnvironmentVariable>(data['data']);
    }
    if (dataClassName == 'UpdateEnvironmentRequest') {
      return deserialize<_i31.UpdateEnvironmentRequest>(data['data']);
    }
    if (dataClassName == 'UpdateEnvironmentVariableRequest') {
      return deserialize<_i32.UpdateEnvironmentVariableRequest>(data['data']);
    }
    if (dataClassName == 'CreateWorkspaceExportRequest') {
      return deserialize<_i33.CreateWorkspaceExportRequest>(data['data']);
    }
    if (dataClassName == 'CreateWorkspaceImportRequest') {
      return deserialize<_i34.CreateWorkspaceImportRequest>(data['data']);
    }
    if (dataClassName == 'ImportExportJobModel') {
      return deserialize<_i35.ImportExportJobModel>(data['data']);
    }
    if (dataClassName == 'StoredImportExportJob') {
      return deserialize<_i36.StoredImportExportJob>(data['data']);
    }
    if (dataClassName == 'CreateRequestRunRequest') {
      return deserialize<_i37.CreateRequestRunRequest>(data['data']);
    }
    if (dataClassName == 'RequestRunDetailModel') {
      return deserialize<_i38.RequestRunDetailModel>(data['data']);
    }
    if (dataClassName == 'RequestRunModel') {
      return deserialize<_i39.RequestRunModel>(data['data']);
    }
    if (dataClassName == 'RequestRunRequestSnapshotModel') {
      return deserialize<_i40.RequestRunRequestSnapshotModel>(data['data']);
    }
    if (dataClassName == 'RequestRunResponseSnapshotModel') {
      return deserialize<_i41.RequestRunResponseSnapshotModel>(data['data']);
    }
    if (dataClassName == 'RunErrorModel') {
      return deserialize<_i42.RunErrorModel>(data['data']);
    }
    if (dataClassName == 'StoredRequestRun') {
      return deserialize<_i43.StoredRequestRun>(data['data']);
    }
    if (dataClassName == 'StoredRequestRunRequestSnapshot') {
      return deserialize<_i44.StoredRequestRunRequestSnapshot>(data['data']);
    }
    if (dataClassName == 'StoredRequestRunResponseSnapshot') {
      return deserialize<_i45.StoredRequestRunResponseSnapshot>(data['data']);
    }
    if (dataClassName == 'AcceptWorkspaceInvitationRequest') {
      return deserialize<_i46.AcceptWorkspaceInvitationRequest>(data['data']);
    }
    if (dataClassName == 'ConvertWorkspaceToTeamRequest') {
      return deserialize<_i47.ConvertWorkspaceToTeamRequest>(data['data']);
    }
    if (dataClassName == 'CreateWorkspaceInvitationRequest') {
      return deserialize<_i48.CreateWorkspaceInvitationRequest>(data['data']);
    }
    if (dataClassName == 'CreateWorkspaceRequest') {
      return deserialize<_i49.CreateWorkspaceRequest>(data['data']);
    }
    if (dataClassName == 'StoredWorkspace') {
      return deserialize<_i50.StoredWorkspace>(data['data']);
    }
    if (dataClassName == 'StoredWorkspaceEvent') {
      return deserialize<_i51.StoredWorkspaceEvent>(data['data']);
    }
    if (dataClassName == 'StoredWorkspaceInvitation') {
      return deserialize<_i52.StoredWorkspaceInvitation>(data['data']);
    }
    if (dataClassName == 'StoredWorkspaceMembership') {
      return deserialize<_i53.StoredWorkspaceMembership>(data['data']);
    }
    if (dataClassName == 'UpdateWorkspaceMemberRoleRequest') {
      return deserialize<_i54.UpdateWorkspaceMemberRoleRequest>(data['data']);
    }
    if (dataClassName == 'WorkspaceEventModel') {
      return deserialize<_i55.WorkspaceEventModel>(data['data']);
    }
    if (dataClassName == 'WorkspaceInvitationIssueModel') {
      return deserialize<_i56.WorkspaceInvitationIssueModel>(data['data']);
    }
    if (dataClassName == 'WorkspaceInvitationModel') {
      return deserialize<_i57.WorkspaceInvitationModel>(data['data']);
    }
    if (dataClassName == 'WorkspaceMemberModel') {
      return deserialize<_i58.WorkspaceMemberModel>(data['data']);
    }
    if (dataClassName == 'WorkspaceModel') {
      return deserialize<_i59.WorkspaceModel>(data['data']);
    }
    if (dataClassName == 'WorkspaceUpdatesQuery') {
      return deserialize<_i60.WorkspaceUpdatesQuery>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i72.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i73.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i72.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i73.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}

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
import '../../../features/workspaces/models/workspace_invitation_model.dart'
    as _i2;
import 'package:relay_server_client/src/protocol/protocol.dart' as _i3;

abstract class WorkspaceInvitationIssueModel implements _i1.SerializableModel {
  WorkspaceInvitationIssueModel._({
    required this.invitation,
    required this.invitationToken,
  });

  factory WorkspaceInvitationIssueModel({
    required _i2.WorkspaceInvitationModel invitation,
    required String invitationToken,
  }) = _WorkspaceInvitationIssueModelImpl;

  factory WorkspaceInvitationIssueModel.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return WorkspaceInvitationIssueModel(
      invitation: _i3.Protocol().deserialize<_i2.WorkspaceInvitationModel>(
        jsonSerialization['invitation'],
      ),
      invitationToken: jsonSerialization['invitationToken'] as String,
    );
  }

  _i2.WorkspaceInvitationModel invitation;

  String invitationToken;

  /// Returns a shallow copy of this [WorkspaceInvitationIssueModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WorkspaceInvitationIssueModel copyWith({
    _i2.WorkspaceInvitationModel? invitation,
    String? invitationToken,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WorkspaceInvitationIssueModel',
      'invitation': invitation.toJson(),
      'invitationToken': invitationToken,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _WorkspaceInvitationIssueModelImpl extends WorkspaceInvitationIssueModel {
  _WorkspaceInvitationIssueModelImpl({
    required _i2.WorkspaceInvitationModel invitation,
    required String invitationToken,
  }) : super._(
         invitation: invitation,
         invitationToken: invitationToken,
       );

  /// Returns a shallow copy of this [WorkspaceInvitationIssueModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WorkspaceInvitationIssueModel copyWith({
    _i2.WorkspaceInvitationModel? invitation,
    String? invitationToken,
  }) {
    return WorkspaceInvitationIssueModel(
      invitation: invitation ?? this.invitation.copyWith(),
      invitationToken: invitationToken ?? this.invitationToken,
    );
  }
}

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

abstract class CreateWorkspaceInvitationRequest
    implements _i1.SerializableModel {
  CreateWorkspaceInvitationRequest._({
    required this.workspaceId,
    required this.email,
    required this.role,
  });

  factory CreateWorkspaceInvitationRequest({
    required int workspaceId,
    required String email,
    required String role,
  }) = _CreateWorkspaceInvitationRequestImpl;

  factory CreateWorkspaceInvitationRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateWorkspaceInvitationRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      email: jsonSerialization['email'] as String,
      role: jsonSerialization['role'] as String,
    );
  }

  int workspaceId;

  String email;

  String role;

  /// Returns a shallow copy of this [CreateWorkspaceInvitationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateWorkspaceInvitationRequest copyWith({
    int? workspaceId,
    String? email,
    String? role,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateWorkspaceInvitationRequest',
      'workspaceId': workspaceId,
      'email': email,
      'role': role,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CreateWorkspaceInvitationRequestImpl
    extends CreateWorkspaceInvitationRequest {
  _CreateWorkspaceInvitationRequestImpl({
    required int workspaceId,
    required String email,
    required String role,
  }) : super._(
         workspaceId: workspaceId,
         email: email,
         role: role,
       );

  /// Returns a shallow copy of this [CreateWorkspaceInvitationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateWorkspaceInvitationRequest copyWith({
    int? workspaceId,
    String? email,
    String? role,
  }) {
    return CreateWorkspaceInvitationRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }
}

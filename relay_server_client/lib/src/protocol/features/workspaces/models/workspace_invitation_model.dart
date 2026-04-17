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

abstract class WorkspaceInvitationModel implements _i1.SerializableModel {
  WorkspaceInvitationModel._({
    required this.id,
    required this.workspaceId,
    required this.email,
    required this.role,
    required this.status,
    required this.expiresAt,
    required this.createdAt,
    this.acceptedAt,
  });

  factory WorkspaceInvitationModel({
    required int id,
    required int workspaceId,
    required String email,
    required String role,
    required String status,
    required DateTime expiresAt,
    required DateTime createdAt,
    DateTime? acceptedAt,
  }) = _WorkspaceInvitationModelImpl;

  factory WorkspaceInvitationModel.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return WorkspaceInvitationModel(
      id: jsonSerialization['id'] as int,
      workspaceId: jsonSerialization['workspaceId'] as int,
      email: jsonSerialization['email'] as String,
      role: jsonSerialization['role'] as String,
      status: jsonSerialization['status'] as String,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      acceptedAt: jsonSerialization['acceptedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['acceptedAt']),
    );
  }

  int id;

  int workspaceId;

  String email;

  String role;

  String status;

  DateTime expiresAt;

  DateTime createdAt;

  DateTime? acceptedAt;

  /// Returns a shallow copy of this [WorkspaceInvitationModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WorkspaceInvitationModel copyWith({
    int? id,
    int? workspaceId,
    String? email,
    String? role,
    String? status,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? acceptedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WorkspaceInvitationModel',
      'id': id,
      'workspaceId': workspaceId,
      'email': email,
      'role': role,
      'status': status,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      if (acceptedAt != null) 'acceptedAt': acceptedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WorkspaceInvitationModelImpl extends WorkspaceInvitationModel {
  _WorkspaceInvitationModelImpl({
    required int id,
    required int workspaceId,
    required String email,
    required String role,
    required String status,
    required DateTime expiresAt,
    required DateTime createdAt,
    DateTime? acceptedAt,
  }) : super._(
         id: id,
         workspaceId: workspaceId,
         email: email,
         role: role,
         status: status,
         expiresAt: expiresAt,
         createdAt: createdAt,
         acceptedAt: acceptedAt,
       );

  /// Returns a shallow copy of this [WorkspaceInvitationModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WorkspaceInvitationModel copyWith({
    int? id,
    int? workspaceId,
    String? email,
    String? role,
    String? status,
    DateTime? expiresAt,
    DateTime? createdAt,
    Object? acceptedAt = _Undefined,
  }) {
    return WorkspaceInvitationModel(
      id: id ?? this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      email: email ?? this.email,
      role: role ?? this.role,
      status: status ?? this.status,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      acceptedAt: acceptedAt is DateTime? ? acceptedAt : this.acceptedAt,
    );
  }
}

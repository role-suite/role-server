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

abstract class StoredWorkspaceInvitation implements _i1.SerializableModel {
  StoredWorkspaceInvitation._({
    this.id,
    required this.workspaceId,
    required this.email,
    required this.role,
    required this.status,
    required this.invitationTokenHash,
    required this.createdByUserId,
    required this.expiresAt,
    required this.createdAt,
    this.acceptedAt,
  });

  factory StoredWorkspaceInvitation({
    int? id,
    required int workspaceId,
    required String email,
    required String role,
    required String status,
    required String invitationTokenHash,
    required int createdByUserId,
    required DateTime expiresAt,
    required DateTime createdAt,
    DateTime? acceptedAt,
  }) = _StoredWorkspaceInvitationImpl;

  factory StoredWorkspaceInvitation.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StoredWorkspaceInvitation(
      id: jsonSerialization['id'] as int?,
      workspaceId: jsonSerialization['workspaceId'] as int,
      email: jsonSerialization['email'] as String,
      role: jsonSerialization['role'] as String,
      status: jsonSerialization['status'] as String,
      invitationTokenHash: jsonSerialization['invitationTokenHash'] as String,
      createdByUserId: jsonSerialization['createdByUserId'] as int,
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int workspaceId;

  String email;

  String role;

  String status;

  String invitationTokenHash;

  int createdByUserId;

  DateTime expiresAt;

  DateTime createdAt;

  DateTime? acceptedAt;

  /// Returns a shallow copy of this [StoredWorkspaceInvitation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredWorkspaceInvitation copyWith({
    int? id,
    int? workspaceId,
    String? email,
    String? role,
    String? status,
    String? invitationTokenHash,
    int? createdByUserId,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? acceptedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredWorkspaceInvitation',
      if (id != null) 'id': id,
      'workspaceId': workspaceId,
      'email': email,
      'role': role,
      'status': status,
      'invitationTokenHash': invitationTokenHash,
      'createdByUserId': createdByUserId,
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

class _StoredWorkspaceInvitationImpl extends StoredWorkspaceInvitation {
  _StoredWorkspaceInvitationImpl({
    int? id,
    required int workspaceId,
    required String email,
    required String role,
    required String status,
    required String invitationTokenHash,
    required int createdByUserId,
    required DateTime expiresAt,
    required DateTime createdAt,
    DateTime? acceptedAt,
  }) : super._(
         id: id,
         workspaceId: workspaceId,
         email: email,
         role: role,
         status: status,
         invitationTokenHash: invitationTokenHash,
         createdByUserId: createdByUserId,
         expiresAt: expiresAt,
         createdAt: createdAt,
         acceptedAt: acceptedAt,
       );

  /// Returns a shallow copy of this [StoredWorkspaceInvitation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredWorkspaceInvitation copyWith({
    Object? id = _Undefined,
    int? workspaceId,
    String? email,
    String? role,
    String? status,
    String? invitationTokenHash,
    int? createdByUserId,
    DateTime? expiresAt,
    DateTime? createdAt,
    Object? acceptedAt = _Undefined,
  }) {
    return StoredWorkspaceInvitation(
      id: id is int? ? id : this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      email: email ?? this.email,
      role: role ?? this.role,
      status: status ?? this.status,
      invitationTokenHash: invitationTokenHash ?? this.invitationTokenHash,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      acceptedAt: acceptedAt is DateTime? ? acceptedAt : this.acceptedAt,
    );
  }
}

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

abstract class StoredWorkspaceMembership implements _i1.SerializableModel {
  StoredWorkspaceMembership._({
    this.id,
    required this.workspaceId,
    required this.userId,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StoredWorkspaceMembership({
    int? id,
    required int workspaceId,
    required int userId,
    required String role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StoredWorkspaceMembershipImpl;

  factory StoredWorkspaceMembership.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StoredWorkspaceMembership(
      id: jsonSerialization['id'] as int?,
      workspaceId: jsonSerialization['workspaceId'] as int,
      userId: jsonSerialization['userId'] as int,
      role: jsonSerialization['role'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int workspaceId;

  int userId;

  String role;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [StoredWorkspaceMembership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredWorkspaceMembership copyWith({
    int? id,
    int? workspaceId,
    int? userId,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredWorkspaceMembership',
      if (id != null) 'id': id,
      'workspaceId': workspaceId,
      'userId': userId,
      'role': role,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoredWorkspaceMembershipImpl extends StoredWorkspaceMembership {
  _StoredWorkspaceMembershipImpl({
    int? id,
    required int workspaceId,
    required int userId,
    required String role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         workspaceId: workspaceId,
         userId: userId,
         role: role,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StoredWorkspaceMembership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredWorkspaceMembership copyWith({
    Object? id = _Undefined,
    int? workspaceId,
    int? userId,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoredWorkspaceMembership(
      id: id is int? ? id : this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      userId: userId ?? this.userId,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

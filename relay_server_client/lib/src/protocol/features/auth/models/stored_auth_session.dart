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

abstract class StoredAuthSession implements _i1.SerializableModel {
  StoredAuthSession._({
    this.id,
    required this.userId,
    required this.workspaceId,
    required this.refreshTokenHash,
    required this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
    this.revokedAt,
  });

  factory StoredAuthSession({
    int? id,
    required int userId,
    required int workspaceId,
    required String refreshTokenHash,
    required DateTime expiresAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? revokedAt,
  }) = _StoredAuthSessionImpl;

  factory StoredAuthSession.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoredAuthSession(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      workspaceId: jsonSerialization['workspaceId'] as int,
      refreshTokenHash: jsonSerialization['refreshTokenHash'] as String,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      revokedAt: jsonSerialization['revokedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['revokedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int workspaceId;

  String refreshTokenHash;

  DateTime expiresAt;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? revokedAt;

  /// Returns a shallow copy of this [StoredAuthSession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredAuthSession copyWith({
    int? id,
    int? userId,
    int? workspaceId,
    String? refreshTokenHash,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? revokedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredAuthSession',
      if (id != null) 'id': id,
      'userId': userId,
      'workspaceId': workspaceId,
      'refreshTokenHash': refreshTokenHash,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (revokedAt != null) 'revokedAt': revokedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoredAuthSessionImpl extends StoredAuthSession {
  _StoredAuthSessionImpl({
    int? id,
    required int userId,
    required int workspaceId,
    required String refreshTokenHash,
    required DateTime expiresAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? revokedAt,
  }) : super._(
         id: id,
         userId: userId,
         workspaceId: workspaceId,
         refreshTokenHash: refreshTokenHash,
         expiresAt: expiresAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
         revokedAt: revokedAt,
       );

  /// Returns a shallow copy of this [StoredAuthSession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredAuthSession copyWith({
    Object? id = _Undefined,
    int? userId,
    int? workspaceId,
    String? refreshTokenHash,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? revokedAt = _Undefined,
  }) {
    return StoredAuthSession(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      workspaceId: workspaceId ?? this.workspaceId,
      refreshTokenHash: refreshTokenHash ?? this.refreshTokenHash,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      revokedAt: revokedAt is DateTime? ? revokedAt : this.revokedAt,
    );
  }
}

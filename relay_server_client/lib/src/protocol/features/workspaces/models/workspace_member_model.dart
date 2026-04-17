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

abstract class WorkspaceMemberModel implements _i1.SerializableModel {
  WorkspaceMemberModel._({
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
    required this.joinedAt,
  });

  factory WorkspaceMemberModel({
    required int userId,
    required String name,
    required String email,
    required String role,
    required DateTime joinedAt,
  }) = _WorkspaceMemberModelImpl;

  factory WorkspaceMemberModel.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return WorkspaceMemberModel(
      userId: jsonSerialization['userId'] as int,
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String,
      role: jsonSerialization['role'] as String,
      joinedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['joinedAt'],
      ),
    );
  }

  int userId;

  String name;

  String email;

  String role;

  DateTime joinedAt;

  /// Returns a shallow copy of this [WorkspaceMemberModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WorkspaceMemberModel copyWith({
    int? userId,
    String? name,
    String? email,
    String? role,
    DateTime? joinedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WorkspaceMemberModel',
      'userId': userId,
      'name': name,
      'email': email,
      'role': role,
      'joinedAt': joinedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _WorkspaceMemberModelImpl extends WorkspaceMemberModel {
  _WorkspaceMemberModelImpl({
    required int userId,
    required String name,
    required String email,
    required String role,
    required DateTime joinedAt,
  }) : super._(
         userId: userId,
         name: name,
         email: email,
         role: role,
         joinedAt: joinedAt,
       );

  /// Returns a shallow copy of this [WorkspaceMemberModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WorkspaceMemberModel copyWith({
    int? userId,
    String? name,
    String? email,
    String? role,
    DateTime? joinedAt,
  }) {
    return WorkspaceMemberModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }
}

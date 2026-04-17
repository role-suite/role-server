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

abstract class AuthUserModel implements _i1.SerializableModel {
  AuthUserModel._({
    required this.id,
    required this.email,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AuthUserModel({
    required int id,
    required String email,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AuthUserModelImpl;

  factory AuthUserModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthUserModel(
      id: jsonSerialization['id'] as int,
      email: jsonSerialization['email'] as String,
      name: jsonSerialization['name'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  int id;

  String email;

  String name;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [AuthUserModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthUserModel copyWith({
    int? id,
    String? email,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthUserModel',
      'id': id,
      'email': email,
      'name': name,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AuthUserModelImpl extends AuthUserModel {
  _AuthUserModelImpl({
    required int id,
    required String email,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         email: email,
         name: name,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [AuthUserModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthUserModel copyWith({
    int? id,
    String? email,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AuthUserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

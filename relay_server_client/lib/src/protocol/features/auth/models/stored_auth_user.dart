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

abstract class StoredAuthUser implements _i1.SerializableModel {
  StoredAuthUser._({
    this.id,
    required this.email,
    required this.name,
    required this.passwordHash,
    required this.passwordSalt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StoredAuthUser({
    int? id,
    required String email,
    required String name,
    required String passwordHash,
    required String passwordSalt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StoredAuthUserImpl;

  factory StoredAuthUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoredAuthUser(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      name: jsonSerialization['name'] as String,
      passwordHash: jsonSerialization['passwordHash'] as String,
      passwordSalt: jsonSerialization['passwordSalt'] as String,
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

  String email;

  String name;

  String passwordHash;

  String passwordSalt;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [StoredAuthUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredAuthUser copyWith({
    int? id,
    String? email,
    String? name,
    String? passwordHash,
    String? passwordSalt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredAuthUser',
      if (id != null) 'id': id,
      'email': email,
      'name': name,
      'passwordHash': passwordHash,
      'passwordSalt': passwordSalt,
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

class _StoredAuthUserImpl extends StoredAuthUser {
  _StoredAuthUserImpl({
    int? id,
    required String email,
    required String name,
    required String passwordHash,
    required String passwordSalt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         email: email,
         name: name,
         passwordHash: passwordHash,
         passwordSalt: passwordSalt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StoredAuthUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredAuthUser copyWith({
    Object? id = _Undefined,
    String? email,
    String? name,
    String? passwordHash,
    String? passwordSalt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoredAuthUser(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      passwordHash: passwordHash ?? this.passwordHash,
      passwordSalt: passwordSalt ?? this.passwordSalt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

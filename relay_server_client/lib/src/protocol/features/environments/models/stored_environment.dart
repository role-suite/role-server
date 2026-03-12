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
import 'package:relay_server_client/src/protocol/protocol.dart' as _i2;

abstract class StoredEnvironment implements _i1.SerializableModel {
  StoredEnvironment._({
    this.id,
    required this.userId,
    required this.name,
    required this.variables,
  });

  factory StoredEnvironment({
    int? id,
    required int userId,
    required String name,
    required Map<String, String> variables,
  }) = _StoredEnvironmentImpl;

  factory StoredEnvironment.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoredEnvironment(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      name: jsonSerialization['name'] as String,
      variables: _i2.Protocol().deserialize<Map<String, String>>(
        jsonSerialization['variables'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String name;

  Map<String, String> variables;

  /// Returns a shallow copy of this [StoredEnvironment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredEnvironment copyWith({
    int? id,
    int? userId,
    String? name,
    Map<String, String>? variables,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredEnvironment',
      if (id != null) 'id': id,
      'userId': userId,
      'name': name,
      'variables': variables.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoredEnvironmentImpl extends StoredEnvironment {
  _StoredEnvironmentImpl({
    int? id,
    required int userId,
    required String name,
    required Map<String, String> variables,
  }) : super._(
         id: id,
         userId: userId,
         name: name,
         variables: variables,
       );

  /// Returns a shallow copy of this [StoredEnvironment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredEnvironment copyWith({
    Object? id = _Undefined,
    int? userId,
    String? name,
    Map<String, String>? variables,
  }) {
    return StoredEnvironment(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      variables:
          variables ??
          this.variables.map(
            (
              key0,
              value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
    );
  }
}

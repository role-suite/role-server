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

abstract class StoredEnvironmentVariable implements _i1.SerializableModel {
  StoredEnvironmentVariable._({
    this.id,
    required this.environmentId,
    required this.key,
    required this.value,
    required this.enabled,
    required this.isSecret,
    required this.position,
    required this.createdByUserId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StoredEnvironmentVariable({
    int? id,
    required int environmentId,
    required String key,
    required String value,
    required bool enabled,
    required bool isSecret,
    required int position,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StoredEnvironmentVariableImpl;

  factory StoredEnvironmentVariable.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StoredEnvironmentVariable(
      id: jsonSerialization['id'] as int?,
      environmentId: jsonSerialization['environmentId'] as int,
      key: jsonSerialization['key'] as String,
      value: jsonSerialization['value'] as String,
      enabled: _i1.BoolJsonExtension.fromJson(jsonSerialization['enabled']),
      isSecret: _i1.BoolJsonExtension.fromJson(jsonSerialization['isSecret']),
      position: jsonSerialization['position'] as int,
      createdByUserId: jsonSerialization['createdByUserId'] as int,
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

  int environmentId;

  String key;

  String value;

  bool enabled;

  bool isSecret;

  int position;

  int createdByUserId;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [StoredEnvironmentVariable]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredEnvironmentVariable copyWith({
    int? id,
    int? environmentId,
    String? key,
    String? value,
    bool? enabled,
    bool? isSecret,
    int? position,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredEnvironmentVariable',
      if (id != null) 'id': id,
      'environmentId': environmentId,
      'key': key,
      'value': value,
      'enabled': enabled,
      'isSecret': isSecret,
      'position': position,
      'createdByUserId': createdByUserId,
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

class _StoredEnvironmentVariableImpl extends StoredEnvironmentVariable {
  _StoredEnvironmentVariableImpl({
    int? id,
    required int environmentId,
    required String key,
    required String value,
    required bool enabled,
    required bool isSecret,
    required int position,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         environmentId: environmentId,
         key: key,
         value: value,
         enabled: enabled,
         isSecret: isSecret,
         position: position,
         createdByUserId: createdByUserId,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StoredEnvironmentVariable]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredEnvironmentVariable copyWith({
    Object? id = _Undefined,
    int? environmentId,
    String? key,
    String? value,
    bool? enabled,
    bool? isSecret,
    int? position,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoredEnvironmentVariable(
      id: id is int? ? id : this.id,
      environmentId: environmentId ?? this.environmentId,
      key: key ?? this.key,
      value: value ?? this.value,
      enabled: enabled ?? this.enabled,
      isSecret: isSecret ?? this.isSecret,
      position: position ?? this.position,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

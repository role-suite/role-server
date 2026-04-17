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

abstract class EnvironmentModel implements _i1.SerializableModel {
  EnvironmentModel._({
    required this.id,
    required this.workspaceId,
    required this.name,
    required this.createdByUserId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EnvironmentModel({
    required int id,
    required int workspaceId,
    required String name,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _EnvironmentModelImpl;

  factory EnvironmentModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return EnvironmentModel(
      id: jsonSerialization['id'] as int,
      workspaceId: jsonSerialization['workspaceId'] as int,
      name: jsonSerialization['name'] as String,
      createdByUserId: jsonSerialization['createdByUserId'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  int id;

  int workspaceId;

  String name;

  int createdByUserId;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [EnvironmentModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EnvironmentModel copyWith({
    int? id,
    int? workspaceId,
    String? name,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EnvironmentModel',
      'id': id,
      'workspaceId': workspaceId,
      'name': name,
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

class _EnvironmentModelImpl extends EnvironmentModel {
  _EnvironmentModelImpl({
    required int id,
    required int workspaceId,
    required String name,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         workspaceId: workspaceId,
         name: name,
         createdByUserId: createdByUserId,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [EnvironmentModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EnvironmentModel copyWith({
    int? id,
    int? workspaceId,
    String? name,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EnvironmentModel(
      id: id ?? this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      name: name ?? this.name,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

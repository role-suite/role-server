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

abstract class WorkspaceModel implements _i1.SerializableModel {
  WorkspaceModel._({
    required this.id,
    required this.name,
    required this.slug,
    required this.type,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WorkspaceModel({
    required int id,
    required String name,
    required String slug,
    required String type,
    required String role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _WorkspaceModelImpl;

  factory WorkspaceModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return WorkspaceModel(
      id: jsonSerialization['id'] as int,
      name: jsonSerialization['name'] as String,
      slug: jsonSerialization['slug'] as String,
      type: jsonSerialization['type'] as String,
      role: jsonSerialization['role'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  int id;

  String name;

  String slug;

  String type;

  String role;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [WorkspaceModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WorkspaceModel copyWith({
    int? id,
    String? name,
    String? slug,
    String? type,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WorkspaceModel',
      'id': id,
      'name': name,
      'slug': slug,
      'type': type,
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

class _WorkspaceModelImpl extends WorkspaceModel {
  _WorkspaceModelImpl({
    required int id,
    required String name,
    required String slug,
    required String type,
    required String role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         slug: slug,
         type: type,
         role: role,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [WorkspaceModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WorkspaceModel copyWith({
    int? id,
    String? name,
    String? slug,
    String? type,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WorkspaceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      type: type ?? this.type,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

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

abstract class StoredWorkspace implements _i1.SerializableModel {
  StoredWorkspace._({
    this.id,
    required this.name,
    required this.slug,
    required this.type,
    required this.createdByUserId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StoredWorkspace({
    int? id,
    required String name,
    required String slug,
    required String type,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StoredWorkspaceImpl;

  factory StoredWorkspace.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoredWorkspace(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      slug: jsonSerialization['slug'] as String,
      type: jsonSerialization['type'] as String,
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

  String name;

  String slug;

  String type;

  int createdByUserId;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [StoredWorkspace]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredWorkspace copyWith({
    int? id,
    String? name,
    String? slug,
    String? type,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredWorkspace',
      if (id != null) 'id': id,
      'name': name,
      'slug': slug,
      'type': type,
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

class _StoredWorkspaceImpl extends StoredWorkspace {
  _StoredWorkspaceImpl({
    int? id,
    required String name,
    required String slug,
    required String type,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         slug: slug,
         type: type,
         createdByUserId: createdByUserId,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StoredWorkspace]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredWorkspace copyWith({
    Object? id = _Undefined,
    String? name,
    String? slug,
    String? type,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoredWorkspace(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      type: type ?? this.type,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

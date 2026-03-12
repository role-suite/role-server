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

abstract class StoredCollection implements _i1.SerializableModel {
  StoredCollection._({
    this.id,
    required this.userId,
    required this.collectionId,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StoredCollection({
    int? id,
    required int userId,
    required String collectionId,
    required String name,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StoredCollectionImpl;

  factory StoredCollection.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoredCollection(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      collectionId: jsonSerialization['collectionId'] as String,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
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

  int userId;

  String collectionId;

  String name;

  String description;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [StoredCollection]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredCollection copyWith({
    int? id,
    int? userId,
    String? collectionId,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredCollection',
      if (id != null) 'id': id,
      'userId': userId,
      'collectionId': collectionId,
      'name': name,
      'description': description,
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

class _StoredCollectionImpl extends StoredCollection {
  _StoredCollectionImpl({
    int? id,
    required int userId,
    required String collectionId,
    required String name,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         collectionId: collectionId,
         name: name,
         description: description,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StoredCollection]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredCollection copyWith({
    Object? id = _Undefined,
    int? userId,
    String? collectionId,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoredCollection(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      collectionId: collectionId ?? this.collectionId,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

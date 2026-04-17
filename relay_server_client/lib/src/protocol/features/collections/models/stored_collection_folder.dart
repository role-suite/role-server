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

abstract class StoredCollectionFolder implements _i1.SerializableModel {
  StoredCollectionFolder._({
    this.id,
    required this.collectionId,
    this.parentFolderId,
    required this.name,
    required this.position,
    required this.createdByUserId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StoredCollectionFolder({
    int? id,
    required int collectionId,
    int? parentFolderId,
    required String name,
    required int position,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StoredCollectionFolderImpl;

  factory StoredCollectionFolder.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StoredCollectionFolder(
      id: jsonSerialization['id'] as int?,
      collectionId: jsonSerialization['collectionId'] as int,
      parentFolderId: jsonSerialization['parentFolderId'] as int?,
      name: jsonSerialization['name'] as String,
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

  int collectionId;

  int? parentFolderId;

  String name;

  int position;

  int createdByUserId;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [StoredCollectionFolder]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredCollectionFolder copyWith({
    int? id,
    int? collectionId,
    int? parentFolderId,
    String? name,
    int? position,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredCollectionFolder',
      if (id != null) 'id': id,
      'collectionId': collectionId,
      if (parentFolderId != null) 'parentFolderId': parentFolderId,
      'name': name,
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

class _StoredCollectionFolderImpl extends StoredCollectionFolder {
  _StoredCollectionFolderImpl({
    int? id,
    required int collectionId,
    int? parentFolderId,
    required String name,
    required int position,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         collectionId: collectionId,
         parentFolderId: parentFolderId,
         name: name,
         position: position,
         createdByUserId: createdByUserId,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StoredCollectionFolder]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredCollectionFolder copyWith({
    Object? id = _Undefined,
    int? collectionId,
    Object? parentFolderId = _Undefined,
    String? name,
    int? position,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoredCollectionFolder(
      id: id is int? ? id : this.id,
      collectionId: collectionId ?? this.collectionId,
      parentFolderId: parentFolderId is int?
          ? parentFolderId
          : this.parentFolderId,
      name: name ?? this.name,
      position: position ?? this.position,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

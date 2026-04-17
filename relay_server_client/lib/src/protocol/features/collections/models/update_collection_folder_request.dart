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

abstract class UpdateCollectionFolderRequest implements _i1.SerializableModel {
  UpdateCollectionFolderRequest._({
    required this.workspaceId,
    required this.collectionId,
    required this.folderId,
    this.parentFolderId,
    this.name,
    this.position,
  });

  factory UpdateCollectionFolderRequest({
    required int workspaceId,
    required int collectionId,
    required int folderId,
    int? parentFolderId,
    String? name,
    int? position,
  }) = _UpdateCollectionFolderRequestImpl;

  factory UpdateCollectionFolderRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpdateCollectionFolderRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      collectionId: jsonSerialization['collectionId'] as int,
      folderId: jsonSerialization['folderId'] as int,
      parentFolderId: jsonSerialization['parentFolderId'] as int?,
      name: jsonSerialization['name'] as String?,
      position: jsonSerialization['position'] as int?,
    );
  }

  int workspaceId;

  int collectionId;

  int folderId;

  int? parentFolderId;

  String? name;

  int? position;

  /// Returns a shallow copy of this [UpdateCollectionFolderRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateCollectionFolderRequest copyWith({
    int? workspaceId,
    int? collectionId,
    int? folderId,
    int? parentFolderId,
    String? name,
    int? position,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateCollectionFolderRequest',
      'workspaceId': workspaceId,
      'collectionId': collectionId,
      'folderId': folderId,
      if (parentFolderId != null) 'parentFolderId': parentFolderId,
      if (name != null) 'name': name,
      if (position != null) 'position': position,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UpdateCollectionFolderRequestImpl extends UpdateCollectionFolderRequest {
  _UpdateCollectionFolderRequestImpl({
    required int workspaceId,
    required int collectionId,
    required int folderId,
    int? parentFolderId,
    String? name,
    int? position,
  }) : super._(
         workspaceId: workspaceId,
         collectionId: collectionId,
         folderId: folderId,
         parentFolderId: parentFolderId,
         name: name,
         position: position,
       );

  /// Returns a shallow copy of this [UpdateCollectionFolderRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateCollectionFolderRequest copyWith({
    int? workspaceId,
    int? collectionId,
    int? folderId,
    Object? parentFolderId = _Undefined,
    Object? name = _Undefined,
    Object? position = _Undefined,
  }) {
    return UpdateCollectionFolderRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      collectionId: collectionId ?? this.collectionId,
      folderId: folderId ?? this.folderId,
      parentFolderId: parentFolderId is int?
          ? parentFolderId
          : this.parentFolderId,
      name: name is String? ? name : this.name,
      position: position is int? ? position : this.position,
    );
  }
}

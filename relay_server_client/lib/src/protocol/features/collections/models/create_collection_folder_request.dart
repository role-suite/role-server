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

abstract class CreateCollectionFolderRequest implements _i1.SerializableModel {
  CreateCollectionFolderRequest._({
    required this.workspaceId,
    required this.collectionId,
    this.parentFolderId,
    required this.name,
    this.position,
  });

  factory CreateCollectionFolderRequest({
    required int workspaceId,
    required int collectionId,
    int? parentFolderId,
    required String name,
    int? position,
  }) = _CreateCollectionFolderRequestImpl;

  factory CreateCollectionFolderRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateCollectionFolderRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      collectionId: jsonSerialization['collectionId'] as int,
      parentFolderId: jsonSerialization['parentFolderId'] as int?,
      name: jsonSerialization['name'] as String,
      position: jsonSerialization['position'] as int?,
    );
  }

  int workspaceId;

  int collectionId;

  int? parentFolderId;

  String name;

  int? position;

  /// Returns a shallow copy of this [CreateCollectionFolderRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateCollectionFolderRequest copyWith({
    int? workspaceId,
    int? collectionId,
    int? parentFolderId,
    String? name,
    int? position,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateCollectionFolderRequest',
      'workspaceId': workspaceId,
      'collectionId': collectionId,
      if (parentFolderId != null) 'parentFolderId': parentFolderId,
      'name': name,
      if (position != null) 'position': position,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateCollectionFolderRequestImpl extends CreateCollectionFolderRequest {
  _CreateCollectionFolderRequestImpl({
    required int workspaceId,
    required int collectionId,
    int? parentFolderId,
    required String name,
    int? position,
  }) : super._(
         workspaceId: workspaceId,
         collectionId: collectionId,
         parentFolderId: parentFolderId,
         name: name,
         position: position,
       );

  /// Returns a shallow copy of this [CreateCollectionFolderRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateCollectionFolderRequest copyWith({
    int? workspaceId,
    int? collectionId,
    Object? parentFolderId = _Undefined,
    String? name,
    Object? position = _Undefined,
  }) {
    return CreateCollectionFolderRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      collectionId: collectionId ?? this.collectionId,
      parentFolderId: parentFolderId is int?
          ? parentFolderId
          : this.parentFolderId,
      name: name ?? this.name,
      position: position is int? ? position : this.position,
    );
  }
}

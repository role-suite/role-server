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

abstract class UpdateCollectionRequest implements _i1.SerializableModel {
  UpdateCollectionRequest._({
    required this.workspaceId,
    required this.collectionId,
    this.name,
    this.description,
  });

  factory UpdateCollectionRequest({
    required int workspaceId,
    required int collectionId,
    String? name,
    String? description,
  }) = _UpdateCollectionRequestImpl;

  factory UpdateCollectionRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpdateCollectionRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      collectionId: jsonSerialization['collectionId'] as int,
      name: jsonSerialization['name'] as String?,
      description: jsonSerialization['description'] as String?,
    );
  }

  int workspaceId;

  int collectionId;

  String? name;

  String? description;

  /// Returns a shallow copy of this [UpdateCollectionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateCollectionRequest copyWith({
    int? workspaceId,
    int? collectionId,
    String? name,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateCollectionRequest',
      'workspaceId': workspaceId,
      'collectionId': collectionId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UpdateCollectionRequestImpl extends UpdateCollectionRequest {
  _UpdateCollectionRequestImpl({
    required int workspaceId,
    required int collectionId,
    String? name,
    String? description,
  }) : super._(
         workspaceId: workspaceId,
         collectionId: collectionId,
         name: name,
         description: description,
       );

  /// Returns a shallow copy of this [UpdateCollectionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateCollectionRequest copyWith({
    int? workspaceId,
    int? collectionId,
    Object? name = _Undefined,
    Object? description = _Undefined,
  }) {
    return UpdateCollectionRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      collectionId: collectionId ?? this.collectionId,
      name: name is String? ? name : this.name,
      description: description is String? ? description : this.description,
    );
  }
}

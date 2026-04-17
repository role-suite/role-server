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

abstract class CreateCollectionRequest implements _i1.SerializableModel {
  CreateCollectionRequest._({
    required this.workspaceId,
    required this.name,
    this.description,
  });

  factory CreateCollectionRequest({
    required int workspaceId,
    required String name,
    String? description,
  }) = _CreateCollectionRequestImpl;

  factory CreateCollectionRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateCollectionRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
    );
  }

  int workspaceId;

  String name;

  String? description;

  /// Returns a shallow copy of this [CreateCollectionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateCollectionRequest copyWith({
    int? workspaceId,
    String? name,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateCollectionRequest',
      'workspaceId': workspaceId,
      'name': name,
      if (description != null) 'description': description,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateCollectionRequestImpl extends CreateCollectionRequest {
  _CreateCollectionRequestImpl({
    required int workspaceId,
    required String name,
    String? description,
  }) : super._(
         workspaceId: workspaceId,
         name: name,
         description: description,
       );

  /// Returns a shallow copy of this [CreateCollectionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateCollectionRequest copyWith({
    int? workspaceId,
    String? name,
    Object? description = _Undefined,
  }) {
    return CreateCollectionRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
    );
  }
}

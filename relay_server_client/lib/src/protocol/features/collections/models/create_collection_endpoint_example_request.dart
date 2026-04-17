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

abstract class CreateCollectionEndpointExampleRequest
    implements _i1.SerializableModel {
  CreateCollectionEndpointExampleRequest._({
    required this.workspaceId,
    required this.collectionId,
    required this.endpointId,
    required this.name,
    required this.statusCode,
    this.headersJson,
    this.body,
    this.position,
  });

  factory CreateCollectionEndpointExampleRequest({
    required int workspaceId,
    required int collectionId,
    required int endpointId,
    required String name,
    required int statusCode,
    String? headersJson,
    String? body,
    int? position,
  }) = _CreateCollectionEndpointExampleRequestImpl;

  factory CreateCollectionEndpointExampleRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateCollectionEndpointExampleRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      collectionId: jsonSerialization['collectionId'] as int,
      endpointId: jsonSerialization['endpointId'] as int,
      name: jsonSerialization['name'] as String,
      statusCode: jsonSerialization['statusCode'] as int,
      headersJson: jsonSerialization['headersJson'] as String?,
      body: jsonSerialization['body'] as String?,
      position: jsonSerialization['position'] as int?,
    );
  }

  int workspaceId;

  int collectionId;

  int endpointId;

  String name;

  int statusCode;

  String? headersJson;

  String? body;

  int? position;

  /// Returns a shallow copy of this [CreateCollectionEndpointExampleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateCollectionEndpointExampleRequest copyWith({
    int? workspaceId,
    int? collectionId,
    int? endpointId,
    String? name,
    int? statusCode,
    String? headersJson,
    String? body,
    int? position,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateCollectionEndpointExampleRequest',
      'workspaceId': workspaceId,
      'collectionId': collectionId,
      'endpointId': endpointId,
      'name': name,
      'statusCode': statusCode,
      if (headersJson != null) 'headersJson': headersJson,
      if (body != null) 'body': body,
      if (position != null) 'position': position,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateCollectionEndpointExampleRequestImpl
    extends CreateCollectionEndpointExampleRequest {
  _CreateCollectionEndpointExampleRequestImpl({
    required int workspaceId,
    required int collectionId,
    required int endpointId,
    required String name,
    required int statusCode,
    String? headersJson,
    String? body,
    int? position,
  }) : super._(
         workspaceId: workspaceId,
         collectionId: collectionId,
         endpointId: endpointId,
         name: name,
         statusCode: statusCode,
         headersJson: headersJson,
         body: body,
         position: position,
       );

  /// Returns a shallow copy of this [CreateCollectionEndpointExampleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateCollectionEndpointExampleRequest copyWith({
    int? workspaceId,
    int? collectionId,
    int? endpointId,
    String? name,
    int? statusCode,
    Object? headersJson = _Undefined,
    Object? body = _Undefined,
    Object? position = _Undefined,
  }) {
    return CreateCollectionEndpointExampleRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      collectionId: collectionId ?? this.collectionId,
      endpointId: endpointId ?? this.endpointId,
      name: name ?? this.name,
      statusCode: statusCode ?? this.statusCode,
      headersJson: headersJson is String? ? headersJson : this.headersJson,
      body: body is String? ? body : this.body,
      position: position is int? ? position : this.position,
    );
  }
}

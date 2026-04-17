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

abstract class UpdateCollectionEndpointExampleRequest
    implements _i1.SerializableModel {
  UpdateCollectionEndpointExampleRequest._({
    required this.workspaceId,
    required this.collectionId,
    required this.endpointId,
    required this.exampleId,
    this.name,
    this.statusCode,
    this.headersJson,
    this.body,
    this.position,
  });

  factory UpdateCollectionEndpointExampleRequest({
    required int workspaceId,
    required int collectionId,
    required int endpointId,
    required int exampleId,
    String? name,
    int? statusCode,
    String? headersJson,
    String? body,
    int? position,
  }) = _UpdateCollectionEndpointExampleRequestImpl;

  factory UpdateCollectionEndpointExampleRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpdateCollectionEndpointExampleRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      collectionId: jsonSerialization['collectionId'] as int,
      endpointId: jsonSerialization['endpointId'] as int,
      exampleId: jsonSerialization['exampleId'] as int,
      name: jsonSerialization['name'] as String?,
      statusCode: jsonSerialization['statusCode'] as int?,
      headersJson: jsonSerialization['headersJson'] as String?,
      body: jsonSerialization['body'] as String?,
      position: jsonSerialization['position'] as int?,
    );
  }

  int workspaceId;

  int collectionId;

  int endpointId;

  int exampleId;

  String? name;

  int? statusCode;

  String? headersJson;

  String? body;

  int? position;

  /// Returns a shallow copy of this [UpdateCollectionEndpointExampleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateCollectionEndpointExampleRequest copyWith({
    int? workspaceId,
    int? collectionId,
    int? endpointId,
    int? exampleId,
    String? name,
    int? statusCode,
    String? headersJson,
    String? body,
    int? position,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateCollectionEndpointExampleRequest',
      'workspaceId': workspaceId,
      'collectionId': collectionId,
      'endpointId': endpointId,
      'exampleId': exampleId,
      if (name != null) 'name': name,
      if (statusCode != null) 'statusCode': statusCode,
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

class _UpdateCollectionEndpointExampleRequestImpl
    extends UpdateCollectionEndpointExampleRequest {
  _UpdateCollectionEndpointExampleRequestImpl({
    required int workspaceId,
    required int collectionId,
    required int endpointId,
    required int exampleId,
    String? name,
    int? statusCode,
    String? headersJson,
    String? body,
    int? position,
  }) : super._(
         workspaceId: workspaceId,
         collectionId: collectionId,
         endpointId: endpointId,
         exampleId: exampleId,
         name: name,
         statusCode: statusCode,
         headersJson: headersJson,
         body: body,
         position: position,
       );

  /// Returns a shallow copy of this [UpdateCollectionEndpointExampleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateCollectionEndpointExampleRequest copyWith({
    int? workspaceId,
    int? collectionId,
    int? endpointId,
    int? exampleId,
    Object? name = _Undefined,
    Object? statusCode = _Undefined,
    Object? headersJson = _Undefined,
    Object? body = _Undefined,
    Object? position = _Undefined,
  }) {
    return UpdateCollectionEndpointExampleRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      collectionId: collectionId ?? this.collectionId,
      endpointId: endpointId ?? this.endpointId,
      exampleId: exampleId ?? this.exampleId,
      name: name is String? ? name : this.name,
      statusCode: statusCode is int? ? statusCode : this.statusCode,
      headersJson: headersJson is String? ? headersJson : this.headersJson,
      body: body is String? ? body : this.body,
      position: position is int? ? position : this.position,
    );
  }
}

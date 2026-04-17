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

abstract class CreateCollectionEndpointRequest
    implements _i1.SerializableModel {
  CreateCollectionEndpointRequest._({
    required this.workspaceId,
    required this.collectionId,
    this.folderId,
    required this.name,
    required this.method,
    required this.url,
    this.headersJson,
    this.queryParamsJson,
    this.bodyJson,
    this.authJson,
    this.position,
  });

  factory CreateCollectionEndpointRequest({
    required int workspaceId,
    required int collectionId,
    int? folderId,
    required String name,
    required String method,
    required String url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    int? position,
  }) = _CreateCollectionEndpointRequestImpl;

  factory CreateCollectionEndpointRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateCollectionEndpointRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      collectionId: jsonSerialization['collectionId'] as int,
      folderId: jsonSerialization['folderId'] as int?,
      name: jsonSerialization['name'] as String,
      method: jsonSerialization['method'] as String,
      url: jsonSerialization['url'] as String,
      headersJson: jsonSerialization['headersJson'] as String?,
      queryParamsJson: jsonSerialization['queryParamsJson'] as String?,
      bodyJson: jsonSerialization['bodyJson'] as String?,
      authJson: jsonSerialization['authJson'] as String?,
      position: jsonSerialization['position'] as int?,
    );
  }

  int workspaceId;

  int collectionId;

  int? folderId;

  String name;

  String method;

  String url;

  String? headersJson;

  String? queryParamsJson;

  String? bodyJson;

  String? authJson;

  int? position;

  /// Returns a shallow copy of this [CreateCollectionEndpointRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateCollectionEndpointRequest copyWith({
    int? workspaceId,
    int? collectionId,
    int? folderId,
    String? name,
    String? method,
    String? url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    int? position,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateCollectionEndpointRequest',
      'workspaceId': workspaceId,
      'collectionId': collectionId,
      if (folderId != null) 'folderId': folderId,
      'name': name,
      'method': method,
      'url': url,
      if (headersJson != null) 'headersJson': headersJson,
      if (queryParamsJson != null) 'queryParamsJson': queryParamsJson,
      if (bodyJson != null) 'bodyJson': bodyJson,
      if (authJson != null) 'authJson': authJson,
      if (position != null) 'position': position,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateCollectionEndpointRequestImpl
    extends CreateCollectionEndpointRequest {
  _CreateCollectionEndpointRequestImpl({
    required int workspaceId,
    required int collectionId,
    int? folderId,
    required String name,
    required String method,
    required String url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    int? position,
  }) : super._(
         workspaceId: workspaceId,
         collectionId: collectionId,
         folderId: folderId,
         name: name,
         method: method,
         url: url,
         headersJson: headersJson,
         queryParamsJson: queryParamsJson,
         bodyJson: bodyJson,
         authJson: authJson,
         position: position,
       );

  /// Returns a shallow copy of this [CreateCollectionEndpointRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateCollectionEndpointRequest copyWith({
    int? workspaceId,
    int? collectionId,
    Object? folderId = _Undefined,
    String? name,
    String? method,
    String? url,
    Object? headersJson = _Undefined,
    Object? queryParamsJson = _Undefined,
    Object? bodyJson = _Undefined,
    Object? authJson = _Undefined,
    Object? position = _Undefined,
  }) {
    return CreateCollectionEndpointRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      collectionId: collectionId ?? this.collectionId,
      folderId: folderId is int? ? folderId : this.folderId,
      name: name ?? this.name,
      method: method ?? this.method,
      url: url ?? this.url,
      headersJson: headersJson is String? ? headersJson : this.headersJson,
      queryParamsJson: queryParamsJson is String?
          ? queryParamsJson
          : this.queryParamsJson,
      bodyJson: bodyJson is String? ? bodyJson : this.bodyJson,
      authJson: authJson is String? ? authJson : this.authJson,
      position: position is int? ? position : this.position,
    );
  }
}

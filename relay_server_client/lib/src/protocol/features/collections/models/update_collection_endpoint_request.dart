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

abstract class UpdateCollectionEndpointRequest
    implements _i1.SerializableModel {
  UpdateCollectionEndpointRequest._({
    required this.workspaceId,
    required this.collectionId,
    required this.endpointId,
    this.folderId,
    this.name,
    this.method,
    this.url,
    this.headersJson,
    this.queryParamsJson,
    this.bodyJson,
    this.authJson,
    this.position,
  });

  factory UpdateCollectionEndpointRequest({
    required int workspaceId,
    required int collectionId,
    required int endpointId,
    int? folderId,
    String? name,
    String? method,
    String? url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    int? position,
  }) = _UpdateCollectionEndpointRequestImpl;

  factory UpdateCollectionEndpointRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpdateCollectionEndpointRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      collectionId: jsonSerialization['collectionId'] as int,
      endpointId: jsonSerialization['endpointId'] as int,
      folderId: jsonSerialization['folderId'] as int?,
      name: jsonSerialization['name'] as String?,
      method: jsonSerialization['method'] as String?,
      url: jsonSerialization['url'] as String?,
      headersJson: jsonSerialization['headersJson'] as String?,
      queryParamsJson: jsonSerialization['queryParamsJson'] as String?,
      bodyJson: jsonSerialization['bodyJson'] as String?,
      authJson: jsonSerialization['authJson'] as String?,
      position: jsonSerialization['position'] as int?,
    );
  }

  int workspaceId;

  int collectionId;

  int endpointId;

  int? folderId;

  String? name;

  String? method;

  String? url;

  String? headersJson;

  String? queryParamsJson;

  String? bodyJson;

  String? authJson;

  int? position;

  /// Returns a shallow copy of this [UpdateCollectionEndpointRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateCollectionEndpointRequest copyWith({
    int? workspaceId,
    int? collectionId,
    int? endpointId,
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
      '__className__': 'UpdateCollectionEndpointRequest',
      'workspaceId': workspaceId,
      'collectionId': collectionId,
      'endpointId': endpointId,
      if (folderId != null) 'folderId': folderId,
      if (name != null) 'name': name,
      if (method != null) 'method': method,
      if (url != null) 'url': url,
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

class _UpdateCollectionEndpointRequestImpl
    extends UpdateCollectionEndpointRequest {
  _UpdateCollectionEndpointRequestImpl({
    required int workspaceId,
    required int collectionId,
    required int endpointId,
    int? folderId,
    String? name,
    String? method,
    String? url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    int? position,
  }) : super._(
         workspaceId: workspaceId,
         collectionId: collectionId,
         endpointId: endpointId,
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

  /// Returns a shallow copy of this [UpdateCollectionEndpointRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateCollectionEndpointRequest copyWith({
    int? workspaceId,
    int? collectionId,
    int? endpointId,
    Object? folderId = _Undefined,
    Object? name = _Undefined,
    Object? method = _Undefined,
    Object? url = _Undefined,
    Object? headersJson = _Undefined,
    Object? queryParamsJson = _Undefined,
    Object? bodyJson = _Undefined,
    Object? authJson = _Undefined,
    Object? position = _Undefined,
  }) {
    return UpdateCollectionEndpointRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      collectionId: collectionId ?? this.collectionId,
      endpointId: endpointId ?? this.endpointId,
      folderId: folderId is int? ? folderId : this.folderId,
      name: name is String? ? name : this.name,
      method: method is String? ? method : this.method,
      url: url is String? ? url : this.url,
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

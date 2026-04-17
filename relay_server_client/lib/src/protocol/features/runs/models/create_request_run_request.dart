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

abstract class CreateRequestRunRequest implements _i1.SerializableModel {
  CreateRequestRunRequest._({
    required this.workspaceId,
    this.sourceCollectionId,
    this.sourceEndpointId,
    this.environmentId,
    this.method,
    this.url,
    this.headersJson,
    this.queryParamsJson,
    this.bodyJson,
    this.authJson,
    this.timeoutMs,
  });

  factory CreateRequestRunRequest({
    required int workspaceId,
    int? sourceCollectionId,
    int? sourceEndpointId,
    int? environmentId,
    String? method,
    String? url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    int? timeoutMs,
  }) = _CreateRequestRunRequestImpl;

  factory CreateRequestRunRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateRequestRunRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      sourceCollectionId: jsonSerialization['sourceCollectionId'] as int?,
      sourceEndpointId: jsonSerialization['sourceEndpointId'] as int?,
      environmentId: jsonSerialization['environmentId'] as int?,
      method: jsonSerialization['method'] as String?,
      url: jsonSerialization['url'] as String?,
      headersJson: jsonSerialization['headersJson'] as String?,
      queryParamsJson: jsonSerialization['queryParamsJson'] as String?,
      bodyJson: jsonSerialization['bodyJson'] as String?,
      authJson: jsonSerialization['authJson'] as String?,
      timeoutMs: jsonSerialization['timeoutMs'] as int?,
    );
  }

  int workspaceId;

  int? sourceCollectionId;

  int? sourceEndpointId;

  int? environmentId;

  String? method;

  String? url;

  String? headersJson;

  String? queryParamsJson;

  String? bodyJson;

  String? authJson;

  int? timeoutMs;

  /// Returns a shallow copy of this [CreateRequestRunRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateRequestRunRequest copyWith({
    int? workspaceId,
    int? sourceCollectionId,
    int? sourceEndpointId,
    int? environmentId,
    String? method,
    String? url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    int? timeoutMs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateRequestRunRequest',
      'workspaceId': workspaceId,
      if (sourceCollectionId != null) 'sourceCollectionId': sourceCollectionId,
      if (sourceEndpointId != null) 'sourceEndpointId': sourceEndpointId,
      if (environmentId != null) 'environmentId': environmentId,
      if (method != null) 'method': method,
      if (url != null) 'url': url,
      if (headersJson != null) 'headersJson': headersJson,
      if (queryParamsJson != null) 'queryParamsJson': queryParamsJson,
      if (bodyJson != null) 'bodyJson': bodyJson,
      if (authJson != null) 'authJson': authJson,
      if (timeoutMs != null) 'timeoutMs': timeoutMs,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateRequestRunRequestImpl extends CreateRequestRunRequest {
  _CreateRequestRunRequestImpl({
    required int workspaceId,
    int? sourceCollectionId,
    int? sourceEndpointId,
    int? environmentId,
    String? method,
    String? url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    int? timeoutMs,
  }) : super._(
         workspaceId: workspaceId,
         sourceCollectionId: sourceCollectionId,
         sourceEndpointId: sourceEndpointId,
         environmentId: environmentId,
         method: method,
         url: url,
         headersJson: headersJson,
         queryParamsJson: queryParamsJson,
         bodyJson: bodyJson,
         authJson: authJson,
         timeoutMs: timeoutMs,
       );

  /// Returns a shallow copy of this [CreateRequestRunRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateRequestRunRequest copyWith({
    int? workspaceId,
    Object? sourceCollectionId = _Undefined,
    Object? sourceEndpointId = _Undefined,
    Object? environmentId = _Undefined,
    Object? method = _Undefined,
    Object? url = _Undefined,
    Object? headersJson = _Undefined,
    Object? queryParamsJson = _Undefined,
    Object? bodyJson = _Undefined,
    Object? authJson = _Undefined,
    Object? timeoutMs = _Undefined,
  }) {
    return CreateRequestRunRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      sourceCollectionId: sourceCollectionId is int?
          ? sourceCollectionId
          : this.sourceCollectionId,
      sourceEndpointId: sourceEndpointId is int?
          ? sourceEndpointId
          : this.sourceEndpointId,
      environmentId: environmentId is int? ? environmentId : this.environmentId,
      method: method is String? ? method : this.method,
      url: url is String? ? url : this.url,
      headersJson: headersJson is String? ? headersJson : this.headersJson,
      queryParamsJson: queryParamsJson is String?
          ? queryParamsJson
          : this.queryParamsJson,
      bodyJson: bodyJson is String? ? bodyJson : this.bodyJson,
      authJson: authJson is String? ? authJson : this.authJson,
      timeoutMs: timeoutMs is int? ? timeoutMs : this.timeoutMs,
    );
  }
}

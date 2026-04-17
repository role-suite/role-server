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

abstract class RequestRunRequestSnapshotModel implements _i1.SerializableModel {
  RequestRunRequestSnapshotModel._({
    required this.runId,
    required this.method,
    required this.url,
    required this.headersJson,
    required this.queryParamsJson,
    this.bodyJson,
    this.authJson,
    required this.resolvedVariablesJson,
    required this.timeoutMs,
  });

  factory RequestRunRequestSnapshotModel({
    required int runId,
    required String method,
    required String url,
    required String headersJson,
    required String queryParamsJson,
    String? bodyJson,
    String? authJson,
    required String resolvedVariablesJson,
    required int timeoutMs,
  }) = _RequestRunRequestSnapshotModelImpl;

  factory RequestRunRequestSnapshotModel.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RequestRunRequestSnapshotModel(
      runId: jsonSerialization['runId'] as int,
      method: jsonSerialization['method'] as String,
      url: jsonSerialization['url'] as String,
      headersJson: jsonSerialization['headersJson'] as String,
      queryParamsJson: jsonSerialization['queryParamsJson'] as String,
      bodyJson: jsonSerialization['bodyJson'] as String?,
      authJson: jsonSerialization['authJson'] as String?,
      resolvedVariablesJson:
          jsonSerialization['resolvedVariablesJson'] as String,
      timeoutMs: jsonSerialization['timeoutMs'] as int,
    );
  }

  int runId;

  String method;

  String url;

  String headersJson;

  String queryParamsJson;

  String? bodyJson;

  String? authJson;

  String resolvedVariablesJson;

  int timeoutMs;

  /// Returns a shallow copy of this [RequestRunRequestSnapshotModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RequestRunRequestSnapshotModel copyWith({
    int? runId,
    String? method,
    String? url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    String? resolvedVariablesJson,
    int? timeoutMs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RequestRunRequestSnapshotModel',
      'runId': runId,
      'method': method,
      'url': url,
      'headersJson': headersJson,
      'queryParamsJson': queryParamsJson,
      if (bodyJson != null) 'bodyJson': bodyJson,
      if (authJson != null) 'authJson': authJson,
      'resolvedVariablesJson': resolvedVariablesJson,
      'timeoutMs': timeoutMs,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequestRunRequestSnapshotModelImpl
    extends RequestRunRequestSnapshotModel {
  _RequestRunRequestSnapshotModelImpl({
    required int runId,
    required String method,
    required String url,
    required String headersJson,
    required String queryParamsJson,
    String? bodyJson,
    String? authJson,
    required String resolvedVariablesJson,
    required int timeoutMs,
  }) : super._(
         runId: runId,
         method: method,
         url: url,
         headersJson: headersJson,
         queryParamsJson: queryParamsJson,
         bodyJson: bodyJson,
         authJson: authJson,
         resolvedVariablesJson: resolvedVariablesJson,
         timeoutMs: timeoutMs,
       );

  /// Returns a shallow copy of this [RequestRunRequestSnapshotModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RequestRunRequestSnapshotModel copyWith({
    int? runId,
    String? method,
    String? url,
    String? headersJson,
    String? queryParamsJson,
    Object? bodyJson = _Undefined,
    Object? authJson = _Undefined,
    String? resolvedVariablesJson,
    int? timeoutMs,
  }) {
    return RequestRunRequestSnapshotModel(
      runId: runId ?? this.runId,
      method: method ?? this.method,
      url: url ?? this.url,
      headersJson: headersJson ?? this.headersJson,
      queryParamsJson: queryParamsJson ?? this.queryParamsJson,
      bodyJson: bodyJson is String? ? bodyJson : this.bodyJson,
      authJson: authJson is String? ? authJson : this.authJson,
      resolvedVariablesJson:
          resolvedVariablesJson ?? this.resolvedVariablesJson,
      timeoutMs: timeoutMs ?? this.timeoutMs,
    );
  }
}

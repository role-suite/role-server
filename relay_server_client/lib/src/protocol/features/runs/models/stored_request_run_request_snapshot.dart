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

abstract class StoredRequestRunRequestSnapshot
    implements _i1.SerializableModel {
  StoredRequestRunRequestSnapshot._({
    this.id,
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

  factory StoredRequestRunRequestSnapshot({
    int? id,
    required int runId,
    required String method,
    required String url,
    required String headersJson,
    required String queryParamsJson,
    String? bodyJson,
    String? authJson,
    required String resolvedVariablesJson,
    required int timeoutMs,
  }) = _StoredRequestRunRequestSnapshotImpl;

  factory StoredRequestRunRequestSnapshot.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StoredRequestRunRequestSnapshot(
      id: jsonSerialization['id'] as int?,
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int runId;

  String method;

  String url;

  String headersJson;

  String queryParamsJson;

  String? bodyJson;

  String? authJson;

  String resolvedVariablesJson;

  int timeoutMs;

  /// Returns a shallow copy of this [StoredRequestRunRequestSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredRequestRunRequestSnapshot copyWith({
    int? id,
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
      '__className__': 'StoredRequestRunRequestSnapshot',
      if (id != null) 'id': id,
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

class _StoredRequestRunRequestSnapshotImpl
    extends StoredRequestRunRequestSnapshot {
  _StoredRequestRunRequestSnapshotImpl({
    int? id,
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
         id: id,
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

  /// Returns a shallow copy of this [StoredRequestRunRequestSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredRequestRunRequestSnapshot copyWith({
    Object? id = _Undefined,
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
    return StoredRequestRunRequestSnapshot(
      id: id is int? ? id : this.id,
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

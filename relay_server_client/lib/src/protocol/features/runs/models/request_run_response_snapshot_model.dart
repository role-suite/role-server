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

abstract class RequestRunResponseSnapshotModel
    implements _i1.SerializableModel {
  RequestRunResponseSnapshotModel._({
    required this.runId,
    required this.statusCode,
    required this.headersJson,
    this.bodyText,
    this.bodyBase64,
    required this.sizeBytes,
    required this.truncated,
  });

  factory RequestRunResponseSnapshotModel({
    required int runId,
    required int statusCode,
    required String headersJson,
    String? bodyText,
    String? bodyBase64,
    required int sizeBytes,
    required bool truncated,
  }) = _RequestRunResponseSnapshotModelImpl;

  factory RequestRunResponseSnapshotModel.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RequestRunResponseSnapshotModel(
      runId: jsonSerialization['runId'] as int,
      statusCode: jsonSerialization['statusCode'] as int,
      headersJson: jsonSerialization['headersJson'] as String,
      bodyText: jsonSerialization['bodyText'] as String?,
      bodyBase64: jsonSerialization['bodyBase64'] as String?,
      sizeBytes: jsonSerialization['sizeBytes'] as int,
      truncated: _i1.BoolJsonExtension.fromJson(jsonSerialization['truncated']),
    );
  }

  int runId;

  int statusCode;

  String headersJson;

  String? bodyText;

  String? bodyBase64;

  int sizeBytes;

  bool truncated;

  /// Returns a shallow copy of this [RequestRunResponseSnapshotModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RequestRunResponseSnapshotModel copyWith({
    int? runId,
    int? statusCode,
    String? headersJson,
    String? bodyText,
    String? bodyBase64,
    int? sizeBytes,
    bool? truncated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RequestRunResponseSnapshotModel',
      'runId': runId,
      'statusCode': statusCode,
      'headersJson': headersJson,
      if (bodyText != null) 'bodyText': bodyText,
      if (bodyBase64 != null) 'bodyBase64': bodyBase64,
      'sizeBytes': sizeBytes,
      'truncated': truncated,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequestRunResponseSnapshotModelImpl
    extends RequestRunResponseSnapshotModel {
  _RequestRunResponseSnapshotModelImpl({
    required int runId,
    required int statusCode,
    required String headersJson,
    String? bodyText,
    String? bodyBase64,
    required int sizeBytes,
    required bool truncated,
  }) : super._(
         runId: runId,
         statusCode: statusCode,
         headersJson: headersJson,
         bodyText: bodyText,
         bodyBase64: bodyBase64,
         sizeBytes: sizeBytes,
         truncated: truncated,
       );

  /// Returns a shallow copy of this [RequestRunResponseSnapshotModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RequestRunResponseSnapshotModel copyWith({
    int? runId,
    int? statusCode,
    String? headersJson,
    Object? bodyText = _Undefined,
    Object? bodyBase64 = _Undefined,
    int? sizeBytes,
    bool? truncated,
  }) {
    return RequestRunResponseSnapshotModel(
      runId: runId ?? this.runId,
      statusCode: statusCode ?? this.statusCode,
      headersJson: headersJson ?? this.headersJson,
      bodyText: bodyText is String? ? bodyText : this.bodyText,
      bodyBase64: bodyBase64 is String? ? bodyBase64 : this.bodyBase64,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      truncated: truncated ?? this.truncated,
    );
  }
}

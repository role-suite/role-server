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

abstract class StoredRequestRunResponseSnapshot
    implements _i1.SerializableModel {
  StoredRequestRunResponseSnapshot._({
    this.id,
    required this.runId,
    required this.statusCode,
    required this.headersJson,
    this.bodyText,
    this.bodyBase64,
    required this.sizeBytes,
    required this.truncated,
  });

  factory StoredRequestRunResponseSnapshot({
    int? id,
    required int runId,
    required int statusCode,
    required String headersJson,
    String? bodyText,
    String? bodyBase64,
    required int sizeBytes,
    required bool truncated,
  }) = _StoredRequestRunResponseSnapshotImpl;

  factory StoredRequestRunResponseSnapshot.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StoredRequestRunResponseSnapshot(
      id: jsonSerialization['id'] as int?,
      runId: jsonSerialization['runId'] as int,
      statusCode: jsonSerialization['statusCode'] as int,
      headersJson: jsonSerialization['headersJson'] as String,
      bodyText: jsonSerialization['bodyText'] as String?,
      bodyBase64: jsonSerialization['bodyBase64'] as String?,
      sizeBytes: jsonSerialization['sizeBytes'] as int,
      truncated: _i1.BoolJsonExtension.fromJson(jsonSerialization['truncated']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int runId;

  int statusCode;

  String headersJson;

  String? bodyText;

  String? bodyBase64;

  int sizeBytes;

  bool truncated;

  /// Returns a shallow copy of this [StoredRequestRunResponseSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredRequestRunResponseSnapshot copyWith({
    int? id,
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
      '__className__': 'StoredRequestRunResponseSnapshot',
      if (id != null) 'id': id,
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

class _StoredRequestRunResponseSnapshotImpl
    extends StoredRequestRunResponseSnapshot {
  _StoredRequestRunResponseSnapshotImpl({
    int? id,
    required int runId,
    required int statusCode,
    required String headersJson,
    String? bodyText,
    String? bodyBase64,
    required int sizeBytes,
    required bool truncated,
  }) : super._(
         id: id,
         runId: runId,
         statusCode: statusCode,
         headersJson: headersJson,
         bodyText: bodyText,
         bodyBase64: bodyBase64,
         sizeBytes: sizeBytes,
         truncated: truncated,
       );

  /// Returns a shallow copy of this [StoredRequestRunResponseSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredRequestRunResponseSnapshot copyWith({
    Object? id = _Undefined,
    int? runId,
    int? statusCode,
    String? headersJson,
    Object? bodyText = _Undefined,
    Object? bodyBase64 = _Undefined,
    int? sizeBytes,
    bool? truncated,
  }) {
    return StoredRequestRunResponseSnapshot(
      id: id is int? ? id : this.id,
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

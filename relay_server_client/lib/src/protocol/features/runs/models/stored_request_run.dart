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

abstract class StoredRequestRun implements _i1.SerializableModel {
  StoredRequestRun._({
    this.id,
    required this.workspaceId,
    required this.initiatedByUserId,
    required this.sourceType,
    this.sourceCollectionId,
    this.sourceEndpointId,
    required this.status,
    this.startedAt,
    this.completedAt,
    this.durationMs,
    this.errorCode,
    this.errorMessage,
    this.errorJson,
    required this.createdAt,
  });

  factory StoredRequestRun({
    int? id,
    required int workspaceId,
    required int initiatedByUserId,
    required String sourceType,
    int? sourceCollectionId,
    int? sourceEndpointId,
    required String status,
    DateTime? startedAt,
    DateTime? completedAt,
    int? durationMs,
    String? errorCode,
    String? errorMessage,
    String? errorJson,
    required DateTime createdAt,
  }) = _StoredRequestRunImpl;

  factory StoredRequestRun.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoredRequestRun(
      id: jsonSerialization['id'] as int?,
      workspaceId: jsonSerialization['workspaceId'] as int,
      initiatedByUserId: jsonSerialization['initiatedByUserId'] as int,
      sourceType: jsonSerialization['sourceType'] as String,
      sourceCollectionId: jsonSerialization['sourceCollectionId'] as int?,
      sourceEndpointId: jsonSerialization['sourceEndpointId'] as int?,
      status: jsonSerialization['status'] as String,
      startedAt: jsonSerialization['startedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startedAt']),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      durationMs: jsonSerialization['durationMs'] as int?,
      errorCode: jsonSerialization['errorCode'] as String?,
      errorMessage: jsonSerialization['errorMessage'] as String?,
      errorJson: jsonSerialization['errorJson'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int workspaceId;

  int initiatedByUserId;

  String sourceType;

  int? sourceCollectionId;

  int? sourceEndpointId;

  String status;

  DateTime? startedAt;

  DateTime? completedAt;

  int? durationMs;

  String? errorCode;

  String? errorMessage;

  String? errorJson;

  DateTime createdAt;

  /// Returns a shallow copy of this [StoredRequestRun]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredRequestRun copyWith({
    int? id,
    int? workspaceId,
    int? initiatedByUserId,
    String? sourceType,
    int? sourceCollectionId,
    int? sourceEndpointId,
    String? status,
    DateTime? startedAt,
    DateTime? completedAt,
    int? durationMs,
    String? errorCode,
    String? errorMessage,
    String? errorJson,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredRequestRun',
      if (id != null) 'id': id,
      'workspaceId': workspaceId,
      'initiatedByUserId': initiatedByUserId,
      'sourceType': sourceType,
      if (sourceCollectionId != null) 'sourceCollectionId': sourceCollectionId,
      if (sourceEndpointId != null) 'sourceEndpointId': sourceEndpointId,
      'status': status,
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (durationMs != null) 'durationMs': durationMs,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (errorJson != null) 'errorJson': errorJson,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoredRequestRunImpl extends StoredRequestRun {
  _StoredRequestRunImpl({
    int? id,
    required int workspaceId,
    required int initiatedByUserId,
    required String sourceType,
    int? sourceCollectionId,
    int? sourceEndpointId,
    required String status,
    DateTime? startedAt,
    DateTime? completedAt,
    int? durationMs,
    String? errorCode,
    String? errorMessage,
    String? errorJson,
    required DateTime createdAt,
  }) : super._(
         id: id,
         workspaceId: workspaceId,
         initiatedByUserId: initiatedByUserId,
         sourceType: sourceType,
         sourceCollectionId: sourceCollectionId,
         sourceEndpointId: sourceEndpointId,
         status: status,
         startedAt: startedAt,
         completedAt: completedAt,
         durationMs: durationMs,
         errorCode: errorCode,
         errorMessage: errorMessage,
         errorJson: errorJson,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [StoredRequestRun]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredRequestRun copyWith({
    Object? id = _Undefined,
    int? workspaceId,
    int? initiatedByUserId,
    String? sourceType,
    Object? sourceCollectionId = _Undefined,
    Object? sourceEndpointId = _Undefined,
    String? status,
    Object? startedAt = _Undefined,
    Object? completedAt = _Undefined,
    Object? durationMs = _Undefined,
    Object? errorCode = _Undefined,
    Object? errorMessage = _Undefined,
    Object? errorJson = _Undefined,
    DateTime? createdAt,
  }) {
    return StoredRequestRun(
      id: id is int? ? id : this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      initiatedByUserId: initiatedByUserId ?? this.initiatedByUserId,
      sourceType: sourceType ?? this.sourceType,
      sourceCollectionId: sourceCollectionId is int?
          ? sourceCollectionId
          : this.sourceCollectionId,
      sourceEndpointId: sourceEndpointId is int?
          ? sourceEndpointId
          : this.sourceEndpointId,
      status: status ?? this.status,
      startedAt: startedAt is DateTime? ? startedAt : this.startedAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      durationMs: durationMs is int? ? durationMs : this.durationMs,
      errorCode: errorCode is String? ? errorCode : this.errorCode,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      errorJson: errorJson is String? ? errorJson : this.errorJson,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

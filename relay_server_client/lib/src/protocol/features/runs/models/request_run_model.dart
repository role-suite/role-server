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
import '../../../features/runs/models/run_error_model.dart' as _i2;
import 'package:relay_server_client/src/protocol/protocol.dart' as _i3;

abstract class RequestRunModel implements _i1.SerializableModel {
  RequestRunModel._({
    required this.id,
    required this.workspaceId,
    required this.initiatedByUserId,
    required this.status,
    required this.sourceType,
    this.sourceCollectionId,
    this.sourceEndpointId,
    this.startedAt,
    this.completedAt,
    this.durationMs,
    this.error,
    required this.createdAt,
  });

  factory RequestRunModel({
    required int id,
    required int workspaceId,
    required int initiatedByUserId,
    required String status,
    required String sourceType,
    int? sourceCollectionId,
    int? sourceEndpointId,
    DateTime? startedAt,
    DateTime? completedAt,
    int? durationMs,
    _i2.RunErrorModel? error,
    required DateTime createdAt,
  }) = _RequestRunModelImpl;

  factory RequestRunModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return RequestRunModel(
      id: jsonSerialization['id'] as int,
      workspaceId: jsonSerialization['workspaceId'] as int,
      initiatedByUserId: jsonSerialization['initiatedByUserId'] as int,
      status: jsonSerialization['status'] as String,
      sourceType: jsonSerialization['sourceType'] as String,
      sourceCollectionId: jsonSerialization['sourceCollectionId'] as int?,
      sourceEndpointId: jsonSerialization['sourceEndpointId'] as int?,
      startedAt: jsonSerialization['startedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startedAt']),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      durationMs: jsonSerialization['durationMs'] as int?,
      error: jsonSerialization['error'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.RunErrorModel>(
              jsonSerialization['error'],
            ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  int id;

  int workspaceId;

  int initiatedByUserId;

  String status;

  String sourceType;

  int? sourceCollectionId;

  int? sourceEndpointId;

  DateTime? startedAt;

  DateTime? completedAt;

  int? durationMs;

  _i2.RunErrorModel? error;

  DateTime createdAt;

  /// Returns a shallow copy of this [RequestRunModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RequestRunModel copyWith({
    int? id,
    int? workspaceId,
    int? initiatedByUserId,
    String? status,
    String? sourceType,
    int? sourceCollectionId,
    int? sourceEndpointId,
    DateTime? startedAt,
    DateTime? completedAt,
    int? durationMs,
    _i2.RunErrorModel? error,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RequestRunModel',
      'id': id,
      'workspaceId': workspaceId,
      'initiatedByUserId': initiatedByUserId,
      'status': status,
      'sourceType': sourceType,
      if (sourceCollectionId != null) 'sourceCollectionId': sourceCollectionId,
      if (sourceEndpointId != null) 'sourceEndpointId': sourceEndpointId,
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (durationMs != null) 'durationMs': durationMs,
      if (error != null) 'error': error?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequestRunModelImpl extends RequestRunModel {
  _RequestRunModelImpl({
    required int id,
    required int workspaceId,
    required int initiatedByUserId,
    required String status,
    required String sourceType,
    int? sourceCollectionId,
    int? sourceEndpointId,
    DateTime? startedAt,
    DateTime? completedAt,
    int? durationMs,
    _i2.RunErrorModel? error,
    required DateTime createdAt,
  }) : super._(
         id: id,
         workspaceId: workspaceId,
         initiatedByUserId: initiatedByUserId,
         status: status,
         sourceType: sourceType,
         sourceCollectionId: sourceCollectionId,
         sourceEndpointId: sourceEndpointId,
         startedAt: startedAt,
         completedAt: completedAt,
         durationMs: durationMs,
         error: error,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RequestRunModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RequestRunModel copyWith({
    int? id,
    int? workspaceId,
    int? initiatedByUserId,
    String? status,
    String? sourceType,
    Object? sourceCollectionId = _Undefined,
    Object? sourceEndpointId = _Undefined,
    Object? startedAt = _Undefined,
    Object? completedAt = _Undefined,
    Object? durationMs = _Undefined,
    Object? error = _Undefined,
    DateTime? createdAt,
  }) {
    return RequestRunModel(
      id: id ?? this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      initiatedByUserId: initiatedByUserId ?? this.initiatedByUserId,
      status: status ?? this.status,
      sourceType: sourceType ?? this.sourceType,
      sourceCollectionId: sourceCollectionId is int?
          ? sourceCollectionId
          : this.sourceCollectionId,
      sourceEndpointId: sourceEndpointId is int?
          ? sourceEndpointId
          : this.sourceEndpointId,
      startedAt: startedAt is DateTime? ? startedAt : this.startedAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      durationMs: durationMs is int? ? durationMs : this.durationMs,
      error: error is _i2.RunErrorModel? ? error : this.error?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

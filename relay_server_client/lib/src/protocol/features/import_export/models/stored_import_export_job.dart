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

abstract class StoredImportExportJob implements _i1.SerializableModel {
  StoredImportExportJob._({
    this.id,
    required this.workspaceId,
    required this.type,
    required this.status,
    required this.format,
    required this.summaryJson,
    required this.createdByUserId,
    required this.createdAt,
    required this.completedAt,
  });

  factory StoredImportExportJob({
    int? id,
    required int workspaceId,
    required String type,
    required String status,
    required String format,
    required String summaryJson,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime completedAt,
  }) = _StoredImportExportJobImpl;

  factory StoredImportExportJob.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StoredImportExportJob(
      id: jsonSerialization['id'] as int?,
      workspaceId: jsonSerialization['workspaceId'] as int,
      type: jsonSerialization['type'] as String,
      status: jsonSerialization['status'] as String,
      format: jsonSerialization['format'] as String,
      summaryJson: jsonSerialization['summaryJson'] as String,
      createdByUserId: jsonSerialization['createdByUserId'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      completedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['completedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int workspaceId;

  String type;

  String status;

  String format;

  String summaryJson;

  int createdByUserId;

  DateTime createdAt;

  DateTime completedAt;

  /// Returns a shallow copy of this [StoredImportExportJob]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredImportExportJob copyWith({
    int? id,
    int? workspaceId,
    String? type,
    String? status,
    String? format,
    String? summaryJson,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? completedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredImportExportJob',
      if (id != null) 'id': id,
      'workspaceId': workspaceId,
      'type': type,
      'status': status,
      'format': format,
      'summaryJson': summaryJson,
      'createdByUserId': createdByUserId,
      'createdAt': createdAt.toJson(),
      'completedAt': completedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoredImportExportJobImpl extends StoredImportExportJob {
  _StoredImportExportJobImpl({
    int? id,
    required int workspaceId,
    required String type,
    required String status,
    required String format,
    required String summaryJson,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime completedAt,
  }) : super._(
         id: id,
         workspaceId: workspaceId,
         type: type,
         status: status,
         format: format,
         summaryJson: summaryJson,
         createdByUserId: createdByUserId,
         createdAt: createdAt,
         completedAt: completedAt,
       );

  /// Returns a shallow copy of this [StoredImportExportJob]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredImportExportJob copyWith({
    Object? id = _Undefined,
    int? workspaceId,
    String? type,
    String? status,
    String? format,
    String? summaryJson,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return StoredImportExportJob(
      id: id is int? ? id : this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      type: type ?? this.type,
      status: status ?? this.status,
      format: format ?? this.format,
      summaryJson: summaryJson ?? this.summaryJson,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}

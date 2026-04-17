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

abstract class CreateWorkspaceExportRequest implements _i1.SerializableModel {
  CreateWorkspaceExportRequest._({
    required this.workspaceId,
    this.format,
    this.includeCollections,
    this.includeEnvironments,
  });

  factory CreateWorkspaceExportRequest({
    required int workspaceId,
    String? format,
    bool? includeCollections,
    bool? includeEnvironments,
  }) = _CreateWorkspaceExportRequestImpl;

  factory CreateWorkspaceExportRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateWorkspaceExportRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      format: jsonSerialization['format'] as String?,
      includeCollections: jsonSerialization['includeCollections'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(
              jsonSerialization['includeCollections'],
            ),
      includeEnvironments: jsonSerialization['includeEnvironments'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(
              jsonSerialization['includeEnvironments'],
            ),
    );
  }

  int workspaceId;

  String? format;

  bool? includeCollections;

  bool? includeEnvironments;

  /// Returns a shallow copy of this [CreateWorkspaceExportRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateWorkspaceExportRequest copyWith({
    int? workspaceId,
    String? format,
    bool? includeCollections,
    bool? includeEnvironments,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateWorkspaceExportRequest',
      'workspaceId': workspaceId,
      if (format != null) 'format': format,
      if (includeCollections != null) 'includeCollections': includeCollections,
      if (includeEnvironments != null)
        'includeEnvironments': includeEnvironments,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateWorkspaceExportRequestImpl extends CreateWorkspaceExportRequest {
  _CreateWorkspaceExportRequestImpl({
    required int workspaceId,
    String? format,
    bool? includeCollections,
    bool? includeEnvironments,
  }) : super._(
         workspaceId: workspaceId,
         format: format,
         includeCollections: includeCollections,
         includeEnvironments: includeEnvironments,
       );

  /// Returns a shallow copy of this [CreateWorkspaceExportRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateWorkspaceExportRequest copyWith({
    int? workspaceId,
    Object? format = _Undefined,
    Object? includeCollections = _Undefined,
    Object? includeEnvironments = _Undefined,
  }) {
    return CreateWorkspaceExportRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      format: format is String? ? format : this.format,
      includeCollections: includeCollections is bool?
          ? includeCollections
          : this.includeCollections,
      includeEnvironments: includeEnvironments is bool?
          ? includeEnvironments
          : this.includeEnvironments,
    );
  }
}

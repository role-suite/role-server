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

abstract class CreateWorkspaceImportRequest implements _i1.SerializableModel {
  CreateWorkspaceImportRequest._({
    required this.workspaceId,
    this.format,
    required this.payloadJson,
  });

  factory CreateWorkspaceImportRequest({
    required int workspaceId,
    String? format,
    required String payloadJson,
  }) = _CreateWorkspaceImportRequestImpl;

  factory CreateWorkspaceImportRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateWorkspaceImportRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      format: jsonSerialization['format'] as String?,
      payloadJson: jsonSerialization['payloadJson'] as String,
    );
  }

  int workspaceId;

  String? format;

  String payloadJson;

  /// Returns a shallow copy of this [CreateWorkspaceImportRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateWorkspaceImportRequest copyWith({
    int? workspaceId,
    String? format,
    String? payloadJson,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateWorkspaceImportRequest',
      'workspaceId': workspaceId,
      if (format != null) 'format': format,
      'payloadJson': payloadJson,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateWorkspaceImportRequestImpl extends CreateWorkspaceImportRequest {
  _CreateWorkspaceImportRequestImpl({
    required int workspaceId,
    String? format,
    required String payloadJson,
  }) : super._(
         workspaceId: workspaceId,
         format: format,
         payloadJson: payloadJson,
       );

  /// Returns a shallow copy of this [CreateWorkspaceImportRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateWorkspaceImportRequest copyWith({
    int? workspaceId,
    Object? format = _Undefined,
    String? payloadJson,
  }) {
    return CreateWorkspaceImportRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      format: format is String? ? format : this.format,
      payloadJson: payloadJson ?? this.payloadJson,
    );
  }
}

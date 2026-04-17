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

abstract class UpdateEnvironmentRequest implements _i1.SerializableModel {
  UpdateEnvironmentRequest._({
    required this.workspaceId,
    required this.environmentId,
    required this.name,
  });

  factory UpdateEnvironmentRequest({
    required int workspaceId,
    required int environmentId,
    required String name,
  }) = _UpdateEnvironmentRequestImpl;

  factory UpdateEnvironmentRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpdateEnvironmentRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      environmentId: jsonSerialization['environmentId'] as int,
      name: jsonSerialization['name'] as String,
    );
  }

  int workspaceId;

  int environmentId;

  String name;

  /// Returns a shallow copy of this [UpdateEnvironmentRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateEnvironmentRequest copyWith({
    int? workspaceId,
    int? environmentId,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateEnvironmentRequest',
      'workspaceId': workspaceId,
      'environmentId': environmentId,
      'name': name,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UpdateEnvironmentRequestImpl extends UpdateEnvironmentRequest {
  _UpdateEnvironmentRequestImpl({
    required int workspaceId,
    required int environmentId,
    required String name,
  }) : super._(
         workspaceId: workspaceId,
         environmentId: environmentId,
         name: name,
       );

  /// Returns a shallow copy of this [UpdateEnvironmentRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateEnvironmentRequest copyWith({
    int? workspaceId,
    int? environmentId,
    String? name,
  }) {
    return UpdateEnvironmentRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      environmentId: environmentId ?? this.environmentId,
      name: name ?? this.name,
    );
  }
}

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

abstract class CreateWorkspaceRequest implements _i1.SerializableModel {
  CreateWorkspaceRequest._({
    required this.name,
    this.type,
  });

  factory CreateWorkspaceRequest({
    required String name,
    String? type,
  }) = _CreateWorkspaceRequestImpl;

  factory CreateWorkspaceRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateWorkspaceRequest(
      name: jsonSerialization['name'] as String,
      type: jsonSerialization['type'] as String?,
    );
  }

  String name;

  String? type;

  /// Returns a shallow copy of this [CreateWorkspaceRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateWorkspaceRequest copyWith({
    String? name,
    String? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateWorkspaceRequest',
      'name': name,
      if (type != null) 'type': type,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateWorkspaceRequestImpl extends CreateWorkspaceRequest {
  _CreateWorkspaceRequestImpl({
    required String name,
    String? type,
  }) : super._(
         name: name,
         type: type,
       );

  /// Returns a shallow copy of this [CreateWorkspaceRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateWorkspaceRequest copyWith({
    String? name,
    Object? type = _Undefined,
  }) {
    return CreateWorkspaceRequest(
      name: name ?? this.name,
      type: type is String? ? type : this.type,
    );
  }
}

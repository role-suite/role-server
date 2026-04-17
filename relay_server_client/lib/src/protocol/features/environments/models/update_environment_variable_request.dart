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

abstract class UpdateEnvironmentVariableRequest
    implements _i1.SerializableModel {
  UpdateEnvironmentVariableRequest._({
    required this.workspaceId,
    required this.environmentId,
    required this.variableId,
    this.key,
    this.value,
    this.enabled,
    this.isSecret,
    this.position,
  });

  factory UpdateEnvironmentVariableRequest({
    required int workspaceId,
    required int environmentId,
    required int variableId,
    String? key,
    String? value,
    bool? enabled,
    bool? isSecret,
    int? position,
  }) = _UpdateEnvironmentVariableRequestImpl;

  factory UpdateEnvironmentVariableRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpdateEnvironmentVariableRequest(
      workspaceId: jsonSerialization['workspaceId'] as int,
      environmentId: jsonSerialization['environmentId'] as int,
      variableId: jsonSerialization['variableId'] as int,
      key: jsonSerialization['key'] as String?,
      value: jsonSerialization['value'] as String?,
      enabled: jsonSerialization['enabled'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['enabled']),
      isSecret: jsonSerialization['isSecret'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['isSecret']),
      position: jsonSerialization['position'] as int?,
    );
  }

  int workspaceId;

  int environmentId;

  int variableId;

  String? key;

  String? value;

  bool? enabled;

  bool? isSecret;

  int? position;

  /// Returns a shallow copy of this [UpdateEnvironmentVariableRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateEnvironmentVariableRequest copyWith({
    int? workspaceId,
    int? environmentId,
    int? variableId,
    String? key,
    String? value,
    bool? enabled,
    bool? isSecret,
    int? position,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateEnvironmentVariableRequest',
      'workspaceId': workspaceId,
      'environmentId': environmentId,
      'variableId': variableId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (enabled != null) 'enabled': enabled,
      if (isSecret != null) 'isSecret': isSecret,
      if (position != null) 'position': position,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UpdateEnvironmentVariableRequestImpl
    extends UpdateEnvironmentVariableRequest {
  _UpdateEnvironmentVariableRequestImpl({
    required int workspaceId,
    required int environmentId,
    required int variableId,
    String? key,
    String? value,
    bool? enabled,
    bool? isSecret,
    int? position,
  }) : super._(
         workspaceId: workspaceId,
         environmentId: environmentId,
         variableId: variableId,
         key: key,
         value: value,
         enabled: enabled,
         isSecret: isSecret,
         position: position,
       );

  /// Returns a shallow copy of this [UpdateEnvironmentVariableRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateEnvironmentVariableRequest copyWith({
    int? workspaceId,
    int? environmentId,
    int? variableId,
    Object? key = _Undefined,
    Object? value = _Undefined,
    Object? enabled = _Undefined,
    Object? isSecret = _Undefined,
    Object? position = _Undefined,
  }) {
    return UpdateEnvironmentVariableRequest(
      workspaceId: workspaceId ?? this.workspaceId,
      environmentId: environmentId ?? this.environmentId,
      variableId: variableId ?? this.variableId,
      key: key is String? ? key : this.key,
      value: value is String? ? value : this.value,
      enabled: enabled is bool? ? enabled : this.enabled,
      isSecret: isSecret is bool? ? isSecret : this.isSecret,
      position: position is int? ? position : this.position,
    );
  }
}

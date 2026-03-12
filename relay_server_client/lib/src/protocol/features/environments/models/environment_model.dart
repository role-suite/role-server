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
import 'package:relay_server_client/src/protocol/protocol.dart' as _i2;

abstract class EnvironmentModel implements _i1.SerializableModel {
  EnvironmentModel._({
    required this.name,
    required this.variables,
  });

  factory EnvironmentModel({
    required String name,
    required Map<String, String> variables,
  }) = _EnvironmentModelImpl;

  factory EnvironmentModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return EnvironmentModel(
      name: jsonSerialization['name'] as String,
      variables: _i2.Protocol().deserialize<Map<String, String>>(
        jsonSerialization['variables'],
      ),
    );
  }

  String name;

  Map<String, String> variables;

  /// Returns a shallow copy of this [EnvironmentModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EnvironmentModel copyWith({
    String? name,
    Map<String, String>? variables,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EnvironmentModel',
      'name': name,
      'variables': variables.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _EnvironmentModelImpl extends EnvironmentModel {
  _EnvironmentModelImpl({
    required String name,
    required Map<String, String> variables,
  }) : super._(
         name: name,
         variables: variables,
       );

  /// Returns a shallow copy of this [EnvironmentModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EnvironmentModel copyWith({
    String? name,
    Map<String, String>? variables,
  }) {
    return EnvironmentModel(
      name: name ?? this.name,
      variables:
          variables ??
          this.variables.map(
            (
              key0,
              value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
    );
  }
}

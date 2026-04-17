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

abstract class RunErrorModel implements _i1.SerializableModel {
  RunErrorModel._({
    required this.code,
    required this.message,
    this.detailsJson,
  });

  factory RunErrorModel({
    required String code,
    required String message,
    String? detailsJson,
  }) = _RunErrorModelImpl;

  factory RunErrorModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return RunErrorModel(
      code: jsonSerialization['code'] as String,
      message: jsonSerialization['message'] as String,
      detailsJson: jsonSerialization['detailsJson'] as String?,
    );
  }

  String code;

  String message;

  String? detailsJson;

  /// Returns a shallow copy of this [RunErrorModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RunErrorModel copyWith({
    String? code,
    String? message,
    String? detailsJson,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RunErrorModel',
      'code': code,
      'message': message,
      if (detailsJson != null) 'detailsJson': detailsJson,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RunErrorModelImpl extends RunErrorModel {
  _RunErrorModelImpl({
    required String code,
    required String message,
    String? detailsJson,
  }) : super._(
         code: code,
         message: message,
         detailsJson: detailsJson,
       );

  /// Returns a shallow copy of this [RunErrorModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RunErrorModel copyWith({
    String? code,
    String? message,
    Object? detailsJson = _Undefined,
  }) {
    return RunErrorModel(
      code: code ?? this.code,
      message: message ?? this.message,
      detailsJson: detailsJson is String? ? detailsJson : this.detailsJson,
    );
  }
}

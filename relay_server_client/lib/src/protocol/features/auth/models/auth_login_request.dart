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

abstract class AuthLoginRequest implements _i1.SerializableModel {
  AuthLoginRequest._({
    required this.email,
    required this.password,
  });

  factory AuthLoginRequest({
    required String email,
    required String password,
  }) = _AuthLoginRequestImpl;

  factory AuthLoginRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthLoginRequest(
      email: jsonSerialization['email'] as String,
      password: jsonSerialization['password'] as String,
    );
  }

  String email;

  String password;

  /// Returns a shallow copy of this [AuthLoginRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthLoginRequest copyWith({
    String? email,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthLoginRequest',
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AuthLoginRequestImpl extends AuthLoginRequest {
  _AuthLoginRequestImpl({
    required String email,
    required String password,
  }) : super._(
         email: email,
         password: password,
       );

  /// Returns a shallow copy of this [AuthLoginRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthLoginRequest copyWith({
    String? email,
    String? password,
  }) {
    return AuthLoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

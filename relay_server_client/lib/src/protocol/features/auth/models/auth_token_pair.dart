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

abstract class AuthTokenPair implements _i1.SerializableModel {
  AuthTokenPair._({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiresAt,
    required this.refreshTokenExpiresAt,
  });

  factory AuthTokenPair({
    required String accessToken,
    required String refreshToken,
    required DateTime accessTokenExpiresAt,
    required DateTime refreshTokenExpiresAt,
  }) = _AuthTokenPairImpl;

  factory AuthTokenPair.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthTokenPair(
      accessToken: jsonSerialization['accessToken'] as String,
      refreshToken: jsonSerialization['refreshToken'] as String,
      accessTokenExpiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['accessTokenExpiresAt'],
      ),
      refreshTokenExpiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['refreshTokenExpiresAt'],
      ),
    );
  }

  String accessToken;

  String refreshToken;

  DateTime accessTokenExpiresAt;

  DateTime refreshTokenExpiresAt;

  /// Returns a shallow copy of this [AuthTokenPair]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthTokenPair copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiresAt,
    DateTime? refreshTokenExpiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthTokenPair',
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'accessTokenExpiresAt': accessTokenExpiresAt.toJson(),
      'refreshTokenExpiresAt': refreshTokenExpiresAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AuthTokenPairImpl extends AuthTokenPair {
  _AuthTokenPairImpl({
    required String accessToken,
    required String refreshToken,
    required DateTime accessTokenExpiresAt,
    required DateTime refreshTokenExpiresAt,
  }) : super._(
         accessToken: accessToken,
         refreshToken: refreshToken,
         accessTokenExpiresAt: accessTokenExpiresAt,
         refreshTokenExpiresAt: refreshTokenExpiresAt,
       );

  /// Returns a shallow copy of this [AuthTokenPair]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthTokenPair copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiresAt,
    DateTime? refreshTokenExpiresAt,
  }) {
    return AuthTokenPair(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      accessTokenExpiresAt: accessTokenExpiresAt ?? this.accessTokenExpiresAt,
      refreshTokenExpiresAt:
          refreshTokenExpiresAt ?? this.refreshTokenExpiresAt,
    );
  }
}

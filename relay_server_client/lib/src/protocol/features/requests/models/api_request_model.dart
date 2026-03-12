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

abstract class ApiRequestModel implements _i1.SerializableModel {
  ApiRequestModel._({
    required this.id,
    required this.name,
    required this.method,
    required this.urlTemplate,
    required this.headers,
    required this.queryParams,
    this.body,
    required this.bodyType,
    required this.formDataFields,
    required this.authType,
    required this.authConfig,
    this.description,
    this.filePath,
    required this.collectionId,
    this.environmentName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ApiRequestModel({
    required String id,
    required String name,
    required String method,
    required String urlTemplate,
    required Map<String, String> headers,
    required Map<String, String> queryParams,
    String? body,
    required String bodyType,
    required Map<String, String> formDataFields,
    required String authType,
    required Map<String, String> authConfig,
    String? description,
    String? filePath,
    required String collectionId,
    String? environmentName,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ApiRequestModelImpl;

  factory ApiRequestModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return ApiRequestModel(
      id: jsonSerialization['id'] as String,
      name: jsonSerialization['name'] as String,
      method: jsonSerialization['method'] as String,
      urlTemplate: jsonSerialization['urlTemplate'] as String,
      headers: _i2.Protocol().deserialize<Map<String, String>>(
        jsonSerialization['headers'],
      ),
      queryParams: _i2.Protocol().deserialize<Map<String, String>>(
        jsonSerialization['queryParams'],
      ),
      body: jsonSerialization['body'] as String?,
      bodyType: jsonSerialization['bodyType'] as String,
      formDataFields: _i2.Protocol().deserialize<Map<String, String>>(
        jsonSerialization['formDataFields'],
      ),
      authType: jsonSerialization['authType'] as String,
      authConfig: _i2.Protocol().deserialize<Map<String, String>>(
        jsonSerialization['authConfig'],
      ),
      description: jsonSerialization['description'] as String?,
      filePath: jsonSerialization['filePath'] as String?,
      collectionId: jsonSerialization['collectionId'] as String,
      environmentName: jsonSerialization['environmentName'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  String id;

  String name;

  String method;

  String urlTemplate;

  Map<String, String> headers;

  Map<String, String> queryParams;

  String? body;

  String bodyType;

  Map<String, String> formDataFields;

  String authType;

  Map<String, String> authConfig;

  String? description;

  String? filePath;

  String collectionId;

  String? environmentName;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [ApiRequestModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ApiRequestModel copyWith({
    String? id,
    String? name,
    String? method,
    String? urlTemplate,
    Map<String, String>? headers,
    Map<String, String>? queryParams,
    String? body,
    String? bodyType,
    Map<String, String>? formDataFields,
    String? authType,
    Map<String, String>? authConfig,
    String? description,
    String? filePath,
    String? collectionId,
    String? environmentName,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ApiRequestModel',
      'id': id,
      'name': name,
      'method': method,
      'urlTemplate': urlTemplate,
      'headers': headers.toJson(),
      'queryParams': queryParams.toJson(),
      if (body != null) 'body': body,
      'bodyType': bodyType,
      'formDataFields': formDataFields.toJson(),
      'authType': authType,
      'authConfig': authConfig.toJson(),
      if (description != null) 'description': description,
      if (filePath != null) 'filePath': filePath,
      'collectionId': collectionId,
      if (environmentName != null) 'environmentName': environmentName,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ApiRequestModelImpl extends ApiRequestModel {
  _ApiRequestModelImpl({
    required String id,
    required String name,
    required String method,
    required String urlTemplate,
    required Map<String, String> headers,
    required Map<String, String> queryParams,
    String? body,
    required String bodyType,
    required Map<String, String> formDataFields,
    required String authType,
    required Map<String, String> authConfig,
    String? description,
    String? filePath,
    required String collectionId,
    String? environmentName,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         method: method,
         urlTemplate: urlTemplate,
         headers: headers,
         queryParams: queryParams,
         body: body,
         bodyType: bodyType,
         formDataFields: formDataFields,
         authType: authType,
         authConfig: authConfig,
         description: description,
         filePath: filePath,
         collectionId: collectionId,
         environmentName: environmentName,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ApiRequestModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ApiRequestModel copyWith({
    String? id,
    String? name,
    String? method,
    String? urlTemplate,
    Map<String, String>? headers,
    Map<String, String>? queryParams,
    Object? body = _Undefined,
    String? bodyType,
    Map<String, String>? formDataFields,
    String? authType,
    Map<String, String>? authConfig,
    Object? description = _Undefined,
    Object? filePath = _Undefined,
    String? collectionId,
    Object? environmentName = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ApiRequestModel(
      id: id ?? this.id,
      name: name ?? this.name,
      method: method ?? this.method,
      urlTemplate: urlTemplate ?? this.urlTemplate,
      headers:
          headers ??
          this.headers.map(
            (
              key0,
              value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
      queryParams:
          queryParams ??
          this.queryParams.map(
            (
              key0,
              value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
      body: body is String? ? body : this.body,
      bodyType: bodyType ?? this.bodyType,
      formDataFields:
          formDataFields ??
          this.formDataFields.map(
            (
              key0,
              value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
      authType: authType ?? this.authType,
      authConfig:
          authConfig ??
          this.authConfig.map(
            (
              key0,
              value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
      description: description is String? ? description : this.description,
      filePath: filePath is String? ? filePath : this.filePath,
      collectionId: collectionId ?? this.collectionId,
      environmentName: environmentName is String?
          ? environmentName
          : this.environmentName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

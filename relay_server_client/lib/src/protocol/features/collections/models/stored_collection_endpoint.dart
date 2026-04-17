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

abstract class StoredCollectionEndpoint implements _i1.SerializableModel {
  StoredCollectionEndpoint._({
    this.id,
    required this.collectionId,
    this.folderId,
    required this.name,
    required this.method,
    required this.url,
    this.headersJson,
    this.queryParamsJson,
    this.bodyJson,
    this.authJson,
    required this.position,
    required this.createdByUserId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StoredCollectionEndpoint({
    int? id,
    required int collectionId,
    int? folderId,
    required String name,
    required String method,
    required String url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    required int position,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StoredCollectionEndpointImpl;

  factory StoredCollectionEndpoint.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StoredCollectionEndpoint(
      id: jsonSerialization['id'] as int?,
      collectionId: jsonSerialization['collectionId'] as int,
      folderId: jsonSerialization['folderId'] as int?,
      name: jsonSerialization['name'] as String,
      method: jsonSerialization['method'] as String,
      url: jsonSerialization['url'] as String,
      headersJson: jsonSerialization['headersJson'] as String?,
      queryParamsJson: jsonSerialization['queryParamsJson'] as String?,
      bodyJson: jsonSerialization['bodyJson'] as String?,
      authJson: jsonSerialization['authJson'] as String?,
      position: jsonSerialization['position'] as int,
      createdByUserId: jsonSerialization['createdByUserId'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int collectionId;

  int? folderId;

  String name;

  String method;

  String url;

  String? headersJson;

  String? queryParamsJson;

  String? bodyJson;

  String? authJson;

  int position;

  int createdByUserId;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [StoredCollectionEndpoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredCollectionEndpoint copyWith({
    int? id,
    int? collectionId,
    int? folderId,
    String? name,
    String? method,
    String? url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    int? position,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredCollectionEndpoint',
      if (id != null) 'id': id,
      'collectionId': collectionId,
      if (folderId != null) 'folderId': folderId,
      'name': name,
      'method': method,
      'url': url,
      if (headersJson != null) 'headersJson': headersJson,
      if (queryParamsJson != null) 'queryParamsJson': queryParamsJson,
      if (bodyJson != null) 'bodyJson': bodyJson,
      if (authJson != null) 'authJson': authJson,
      'position': position,
      'createdByUserId': createdByUserId,
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

class _StoredCollectionEndpointImpl extends StoredCollectionEndpoint {
  _StoredCollectionEndpointImpl({
    int? id,
    required int collectionId,
    int? folderId,
    required String name,
    required String method,
    required String url,
    String? headersJson,
    String? queryParamsJson,
    String? bodyJson,
    String? authJson,
    required int position,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         collectionId: collectionId,
         folderId: folderId,
         name: name,
         method: method,
         url: url,
         headersJson: headersJson,
         queryParamsJson: queryParamsJson,
         bodyJson: bodyJson,
         authJson: authJson,
         position: position,
         createdByUserId: createdByUserId,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StoredCollectionEndpoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredCollectionEndpoint copyWith({
    Object? id = _Undefined,
    int? collectionId,
    Object? folderId = _Undefined,
    String? name,
    String? method,
    String? url,
    Object? headersJson = _Undefined,
    Object? queryParamsJson = _Undefined,
    Object? bodyJson = _Undefined,
    Object? authJson = _Undefined,
    int? position,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoredCollectionEndpoint(
      id: id is int? ? id : this.id,
      collectionId: collectionId ?? this.collectionId,
      folderId: folderId is int? ? folderId : this.folderId,
      name: name ?? this.name,
      method: method ?? this.method,
      url: url ?? this.url,
      headersJson: headersJson is String? ? headersJson : this.headersJson,
      queryParamsJson: queryParamsJson is String?
          ? queryParamsJson
          : this.queryParamsJson,
      bodyJson: bodyJson is String? ? bodyJson : this.bodyJson,
      authJson: authJson is String? ? authJson : this.authJson,
      position: position ?? this.position,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

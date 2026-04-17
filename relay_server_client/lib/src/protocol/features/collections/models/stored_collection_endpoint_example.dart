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

abstract class StoredCollectionEndpointExample
    implements _i1.SerializableModel {
  StoredCollectionEndpointExample._({
    this.id,
    required this.endpointId,
    required this.name,
    required this.statusCode,
    this.headersJson,
    this.body,
    required this.position,
    required this.createdByUserId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StoredCollectionEndpointExample({
    int? id,
    required int endpointId,
    required String name,
    required int statusCode,
    String? headersJson,
    String? body,
    required int position,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StoredCollectionEndpointExampleImpl;

  factory StoredCollectionEndpointExample.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StoredCollectionEndpointExample(
      id: jsonSerialization['id'] as int?,
      endpointId: jsonSerialization['endpointId'] as int,
      name: jsonSerialization['name'] as String,
      statusCode: jsonSerialization['statusCode'] as int,
      headersJson: jsonSerialization['headersJson'] as String?,
      body: jsonSerialization['body'] as String?,
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

  int endpointId;

  String name;

  int statusCode;

  String? headersJson;

  String? body;

  int position;

  int createdByUserId;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [StoredCollectionEndpointExample]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredCollectionEndpointExample copyWith({
    int? id,
    int? endpointId,
    String? name,
    int? statusCode,
    String? headersJson,
    String? body,
    int? position,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredCollectionEndpointExample',
      if (id != null) 'id': id,
      'endpointId': endpointId,
      'name': name,
      'statusCode': statusCode,
      if (headersJson != null) 'headersJson': headersJson,
      if (body != null) 'body': body,
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

class _StoredCollectionEndpointExampleImpl
    extends StoredCollectionEndpointExample {
  _StoredCollectionEndpointExampleImpl({
    int? id,
    required int endpointId,
    required String name,
    required int statusCode,
    String? headersJson,
    String? body,
    required int position,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         endpointId: endpointId,
         name: name,
         statusCode: statusCode,
         headersJson: headersJson,
         body: body,
         position: position,
         createdByUserId: createdByUserId,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StoredCollectionEndpointExample]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredCollectionEndpointExample copyWith({
    Object? id = _Undefined,
    int? endpointId,
    String? name,
    int? statusCode,
    Object? headersJson = _Undefined,
    Object? body = _Undefined,
    int? position,
    int? createdByUserId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoredCollectionEndpointExample(
      id: id is int? ? id : this.id,
      endpointId: endpointId ?? this.endpointId,
      name: name ?? this.name,
      statusCode: statusCode ?? this.statusCode,
      headersJson: headersJson is String? ? headersJson : this.headersJson,
      body: body is String? ? body : this.body,
      position: position ?? this.position,
      createdByUserId: createdByUserId ?? this.createdByUserId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

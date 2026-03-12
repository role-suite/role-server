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
import '../../../features/requests/models/api_request_model.dart' as _i2;
import 'package:relay_server_client/src/protocol/protocol.dart' as _i3;

abstract class StoredRequest implements _i1.SerializableModel {
  StoredRequest._({
    this.id,
    required this.userId,
    required this.collectionId,
    required this.requestId,
    required this.data,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StoredRequest({
    int? id,
    required int userId,
    required String collectionId,
    required String requestId,
    required _i2.ApiRequestModel data,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StoredRequestImpl;

  factory StoredRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoredRequest(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      collectionId: jsonSerialization['collectionId'] as String,
      requestId: jsonSerialization['requestId'] as String,
      data: _i3.Protocol().deserialize<_i2.ApiRequestModel>(
        jsonSerialization['data'],
      ),
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

  int userId;

  String collectionId;

  String requestId;

  _i2.ApiRequestModel data;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [StoredRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoredRequest copyWith({
    int? id,
    int? userId,
    String? collectionId,
    String? requestId,
    _i2.ApiRequestModel? data,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoredRequest',
      if (id != null) 'id': id,
      'userId': userId,
      'collectionId': collectionId,
      'requestId': requestId,
      'data': data.toJson(),
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

class _StoredRequestImpl extends StoredRequest {
  _StoredRequestImpl({
    int? id,
    required int userId,
    required String collectionId,
    required String requestId,
    required _i2.ApiRequestModel data,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         collectionId: collectionId,
         requestId: requestId,
         data: data,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StoredRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoredRequest copyWith({
    Object? id = _Undefined,
    int? userId,
    String? collectionId,
    String? requestId,
    _i2.ApiRequestModel? data,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoredRequest(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      collectionId: collectionId ?? this.collectionId,
      requestId: requestId ?? this.requestId,
      data: data ?? this.data.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

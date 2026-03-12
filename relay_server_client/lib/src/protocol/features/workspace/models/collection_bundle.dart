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
import '../../../features/collections/models/collection_model.dart' as _i2;
import '../../../features/requests/models/api_request_model.dart' as _i3;
import 'package:relay_server_client/src/protocol/protocol.dart' as _i4;

abstract class CollectionBundle implements _i1.SerializableModel {
  CollectionBundle._({
    required this.collection,
    required this.requests,
  });

  factory CollectionBundle({
    required _i2.CollectionModel collection,
    required List<_i3.ApiRequestModel> requests,
  }) = _CollectionBundleImpl;

  factory CollectionBundle.fromJson(Map<String, dynamic> jsonSerialization) {
    return CollectionBundle(
      collection: _i4.Protocol().deserialize<_i2.CollectionModel>(
        jsonSerialization['collection'],
      ),
      requests: _i4.Protocol().deserialize<List<_i3.ApiRequestModel>>(
        jsonSerialization['requests'],
      ),
    );
  }

  _i2.CollectionModel collection;

  List<_i3.ApiRequestModel> requests;

  /// Returns a shallow copy of this [CollectionBundle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CollectionBundle copyWith({
    _i2.CollectionModel? collection,
    List<_i3.ApiRequestModel>? requests,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CollectionBundle',
      'collection': collection.toJson(),
      'requests': requests.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CollectionBundleImpl extends CollectionBundle {
  _CollectionBundleImpl({
    required _i2.CollectionModel collection,
    required List<_i3.ApiRequestModel> requests,
  }) : super._(
         collection: collection,
         requests: requests,
       );

  /// Returns a shallow copy of this [CollectionBundle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CollectionBundle copyWith({
    _i2.CollectionModel? collection,
    List<_i3.ApiRequestModel>? requests,
  }) {
    return CollectionBundle(
      collection: collection ?? this.collection.copyWith(),
      requests: requests ?? this.requests.map((e0) => e0.copyWith()).toList(),
    );
  }
}

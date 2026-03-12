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
import 'features/collections/models/collection_model.dart' as _i2;
import 'features/collections/models/stored_collection.dart' as _i3;
import 'features/environments/models/environment_model.dart' as _i4;
import 'features/environments/models/stored_environment.dart' as _i5;
import 'features/requests/models/api_request_model.dart' as _i6;
import 'features/requests/models/stored_request.dart' as _i7;
import 'features/workspace/models/collection_bundle.dart' as _i8;
import 'features/workspace/models/stored_workspace.dart' as _i9;
import 'features/workspace/models/workspace_bundle.dart' as _i10;
import 'package:relay_server_client/src/protocol/features/collections/models/collection_model.dart'
    as _i11;
import 'package:relay_server_client/src/protocol/features/environments/models/environment_model.dart'
    as _i12;
import 'package:relay_server_client/src/protocol/features/requests/models/api_request_model.dart'
    as _i13;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i14;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i15;
export 'features/collections/models/collection_model.dart';
export 'features/collections/models/stored_collection.dart';
export 'features/environments/models/environment_model.dart';
export 'features/environments/models/stored_environment.dart';
export 'features/requests/models/api_request_model.dart';
export 'features/requests/models/stored_request.dart';
export 'features/workspace/models/collection_bundle.dart';
export 'features/workspace/models/stored_workspace.dart';
export 'features/workspace/models/workspace_bundle.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.CollectionModel) {
      return _i2.CollectionModel.fromJson(data) as T;
    }
    if (t == _i3.StoredCollection) {
      return _i3.StoredCollection.fromJson(data) as T;
    }
    if (t == _i4.EnvironmentModel) {
      return _i4.EnvironmentModel.fromJson(data) as T;
    }
    if (t == _i5.StoredEnvironment) {
      return _i5.StoredEnvironment.fromJson(data) as T;
    }
    if (t == _i6.ApiRequestModel) {
      return _i6.ApiRequestModel.fromJson(data) as T;
    }
    if (t == _i7.StoredRequest) {
      return _i7.StoredRequest.fromJson(data) as T;
    }
    if (t == _i8.CollectionBundle) {
      return _i8.CollectionBundle.fromJson(data) as T;
    }
    if (t == _i9.StoredWorkspace) {
      return _i9.StoredWorkspace.fromJson(data) as T;
    }
    if (t == _i10.WorkspaceBundle) {
      return _i10.WorkspaceBundle.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CollectionModel?>()) {
      return (data != null ? _i2.CollectionModel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.StoredCollection?>()) {
      return (data != null ? _i3.StoredCollection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.EnvironmentModel?>()) {
      return (data != null ? _i4.EnvironmentModel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.StoredEnvironment?>()) {
      return (data != null ? _i5.StoredEnvironment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ApiRequestModel?>()) {
      return (data != null ? _i6.ApiRequestModel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.StoredRequest?>()) {
      return (data != null ? _i7.StoredRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CollectionBundle?>()) {
      return (data != null ? _i8.CollectionBundle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.StoredWorkspace?>()) {
      return (data != null ? _i9.StoredWorkspace.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.WorkspaceBundle?>()) {
      return (data != null ? _i10.WorkspaceBundle.fromJson(data) : null) as T;
    }
    if (t == Map<String, String>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<String>(v)),
          )
          as T;
    }
    if (t == List<_i6.ApiRequestModel>) {
      return (data as List)
              .map((e) => deserialize<_i6.ApiRequestModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i8.CollectionBundle>) {
      return (data as List)
              .map((e) => deserialize<_i8.CollectionBundle>(e))
              .toList()
          as T;
    }
    if (t == List<_i4.EnvironmentModel>) {
      return (data as List)
              .map((e) => deserialize<_i4.EnvironmentModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i11.CollectionModel>) {
      return (data as List)
              .map((e) => deserialize<_i11.CollectionModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i12.EnvironmentModel>) {
      return (data as List)
              .map((e) => deserialize<_i12.EnvironmentModel>(e))
              .toList()
          as T;
    }
    if (t == List<_i13.ApiRequestModel>) {
      return (data as List)
              .map((e) => deserialize<_i13.ApiRequestModel>(e))
              .toList()
          as T;
    }
    try {
      return _i14.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i15.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.CollectionModel => 'CollectionModel',
      _i3.StoredCollection => 'StoredCollection',
      _i4.EnvironmentModel => 'EnvironmentModel',
      _i5.StoredEnvironment => 'StoredEnvironment',
      _i6.ApiRequestModel => 'ApiRequestModel',
      _i7.StoredRequest => 'StoredRequest',
      _i8.CollectionBundle => 'CollectionBundle',
      _i9.StoredWorkspace => 'StoredWorkspace',
      _i10.WorkspaceBundle => 'WorkspaceBundle',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'relay_server.',
        '',
      );
    }

    switch (data) {
      case _i2.CollectionModel():
        return 'CollectionModel';
      case _i3.StoredCollection():
        return 'StoredCollection';
      case _i4.EnvironmentModel():
        return 'EnvironmentModel';
      case _i5.StoredEnvironment():
        return 'StoredEnvironment';
      case _i6.ApiRequestModel():
        return 'ApiRequestModel';
      case _i7.StoredRequest():
        return 'StoredRequest';
      case _i8.CollectionBundle():
        return 'CollectionBundle';
      case _i9.StoredWorkspace():
        return 'StoredWorkspace';
      case _i10.WorkspaceBundle():
        return 'WorkspaceBundle';
    }
    className = _i14.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i15.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CollectionModel') {
      return deserialize<_i2.CollectionModel>(data['data']);
    }
    if (dataClassName == 'StoredCollection') {
      return deserialize<_i3.StoredCollection>(data['data']);
    }
    if (dataClassName == 'EnvironmentModel') {
      return deserialize<_i4.EnvironmentModel>(data['data']);
    }
    if (dataClassName == 'StoredEnvironment') {
      return deserialize<_i5.StoredEnvironment>(data['data']);
    }
    if (dataClassName == 'ApiRequestModel') {
      return deserialize<_i6.ApiRequestModel>(data['data']);
    }
    if (dataClassName == 'StoredRequest') {
      return deserialize<_i7.StoredRequest>(data['data']);
    }
    if (dataClassName == 'CollectionBundle') {
      return deserialize<_i8.CollectionBundle>(data['data']);
    }
    if (dataClassName == 'StoredWorkspace') {
      return deserialize<_i9.StoredWorkspace>(data['data']);
    }
    if (dataClassName == 'WorkspaceBundle') {
      return deserialize<_i10.WorkspaceBundle>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i14.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i15.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i14.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i15.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}

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
import '../../../features/runs/models/request_run_model.dart' as _i2;
import '../../../features/runs/models/request_run_request_snapshot_model.dart'
    as _i3;
import '../../../features/runs/models/request_run_response_snapshot_model.dart'
    as _i4;
import 'package:relay_server_client/src/protocol/protocol.dart' as _i5;

abstract class RequestRunDetailModel implements _i1.SerializableModel {
  RequestRunDetailModel._({
    required this.run,
    this.requestSnapshot,
    this.responseSnapshot,
  });

  factory RequestRunDetailModel({
    required _i2.RequestRunModel run,
    _i3.RequestRunRequestSnapshotModel? requestSnapshot,
    _i4.RequestRunResponseSnapshotModel? responseSnapshot,
  }) = _RequestRunDetailModelImpl;

  factory RequestRunDetailModel.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RequestRunDetailModel(
      run: _i5.Protocol().deserialize<_i2.RequestRunModel>(
        jsonSerialization['run'],
      ),
      requestSnapshot: jsonSerialization['requestSnapshot'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.RequestRunRequestSnapshotModel>(
              jsonSerialization['requestSnapshot'],
            ),
      responseSnapshot: jsonSerialization['responseSnapshot'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.RequestRunResponseSnapshotModel>(
              jsonSerialization['responseSnapshot'],
            ),
    );
  }

  _i2.RequestRunModel run;

  _i3.RequestRunRequestSnapshotModel? requestSnapshot;

  _i4.RequestRunResponseSnapshotModel? responseSnapshot;

  /// Returns a shallow copy of this [RequestRunDetailModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RequestRunDetailModel copyWith({
    _i2.RequestRunModel? run,
    _i3.RequestRunRequestSnapshotModel? requestSnapshot,
    _i4.RequestRunResponseSnapshotModel? responseSnapshot,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RequestRunDetailModel',
      'run': run.toJson(),
      if (requestSnapshot != null) 'requestSnapshot': requestSnapshot?.toJson(),
      if (responseSnapshot != null)
        'responseSnapshot': responseSnapshot?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequestRunDetailModelImpl extends RequestRunDetailModel {
  _RequestRunDetailModelImpl({
    required _i2.RequestRunModel run,
    _i3.RequestRunRequestSnapshotModel? requestSnapshot,
    _i4.RequestRunResponseSnapshotModel? responseSnapshot,
  }) : super._(
         run: run,
         requestSnapshot: requestSnapshot,
         responseSnapshot: responseSnapshot,
       );

  /// Returns a shallow copy of this [RequestRunDetailModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RequestRunDetailModel copyWith({
    _i2.RequestRunModel? run,
    Object? requestSnapshot = _Undefined,
    Object? responseSnapshot = _Undefined,
  }) {
    return RequestRunDetailModel(
      run: run ?? this.run.copyWith(),
      requestSnapshot: requestSnapshot is _i3.RequestRunRequestSnapshotModel?
          ? requestSnapshot
          : this.requestSnapshot?.copyWith(),
      responseSnapshot: responseSnapshot is _i4.RequestRunResponseSnapshotModel?
          ? responseSnapshot
          : this.responseSnapshot?.copyWith(),
    );
  }
}

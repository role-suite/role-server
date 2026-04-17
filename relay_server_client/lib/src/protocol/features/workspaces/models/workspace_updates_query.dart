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

abstract class WorkspaceUpdatesQuery implements _i1.SerializableModel {
  WorkspaceUpdatesQuery._({
    required this.workspaceId,
    this.sinceId,
    this.limit,
  });

  factory WorkspaceUpdatesQuery({
    required int workspaceId,
    int? sinceId,
    int? limit,
  }) = _WorkspaceUpdatesQueryImpl;

  factory WorkspaceUpdatesQuery.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return WorkspaceUpdatesQuery(
      workspaceId: jsonSerialization['workspaceId'] as int,
      sinceId: jsonSerialization['sinceId'] as int?,
      limit: jsonSerialization['limit'] as int?,
    );
  }

  int workspaceId;

  int? sinceId;

  int? limit;

  /// Returns a shallow copy of this [WorkspaceUpdatesQuery]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WorkspaceUpdatesQuery copyWith({
    int? workspaceId,
    int? sinceId,
    int? limit,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WorkspaceUpdatesQuery',
      'workspaceId': workspaceId,
      if (sinceId != null) 'sinceId': sinceId,
      if (limit != null) 'limit': limit,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WorkspaceUpdatesQueryImpl extends WorkspaceUpdatesQuery {
  _WorkspaceUpdatesQueryImpl({
    required int workspaceId,
    int? sinceId,
    int? limit,
  }) : super._(
         workspaceId: workspaceId,
         sinceId: sinceId,
         limit: limit,
       );

  /// Returns a shallow copy of this [WorkspaceUpdatesQuery]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WorkspaceUpdatesQuery copyWith({
    int? workspaceId,
    Object? sinceId = _Undefined,
    Object? limit = _Undefined,
  }) {
    return WorkspaceUpdatesQuery(
      workspaceId: workspaceId ?? this.workspaceId,
      sinceId: sinceId is int? ? sinceId : this.sinceId,
      limit: limit is int? ? limit : this.limit,
    );
  }
}

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

abstract class WorkspaceEventModel implements _i1.SerializableModel {
  WorkspaceEventModel._({
    required this.id,
    required this.workspaceId,
    required this.actorUserId,
    required this.entity,
    required this.action,
    this.entityId,
    this.payloadJson,
    required this.createdAt,
  });

  factory WorkspaceEventModel({
    required int id,
    required int workspaceId,
    required int actorUserId,
    required String entity,
    required String action,
    int? entityId,
    String? payloadJson,
    required DateTime createdAt,
  }) = _WorkspaceEventModelImpl;

  factory WorkspaceEventModel.fromJson(Map<String, dynamic> jsonSerialization) {
    return WorkspaceEventModel(
      id: jsonSerialization['id'] as int,
      workspaceId: jsonSerialization['workspaceId'] as int,
      actorUserId: jsonSerialization['actorUserId'] as int,
      entity: jsonSerialization['entity'] as String,
      action: jsonSerialization['action'] as String,
      entityId: jsonSerialization['entityId'] as int?,
      payloadJson: jsonSerialization['payloadJson'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  int id;

  int workspaceId;

  int actorUserId;

  String entity;

  String action;

  int? entityId;

  String? payloadJson;

  DateTime createdAt;

  /// Returns a shallow copy of this [WorkspaceEventModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WorkspaceEventModel copyWith({
    int? id,
    int? workspaceId,
    int? actorUserId,
    String? entity,
    String? action,
    int? entityId,
    String? payloadJson,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WorkspaceEventModel',
      'id': id,
      'workspaceId': workspaceId,
      'actorUserId': actorUserId,
      'entity': entity,
      'action': action,
      if (entityId != null) 'entityId': entityId,
      if (payloadJson != null) 'payloadJson': payloadJson,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WorkspaceEventModelImpl extends WorkspaceEventModel {
  _WorkspaceEventModelImpl({
    required int id,
    required int workspaceId,
    required int actorUserId,
    required String entity,
    required String action,
    int? entityId,
    String? payloadJson,
    required DateTime createdAt,
  }) : super._(
         id: id,
         workspaceId: workspaceId,
         actorUserId: actorUserId,
         entity: entity,
         action: action,
         entityId: entityId,
         payloadJson: payloadJson,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [WorkspaceEventModel]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WorkspaceEventModel copyWith({
    int? id,
    int? workspaceId,
    int? actorUserId,
    String? entity,
    String? action,
    Object? entityId = _Undefined,
    Object? payloadJson = _Undefined,
    DateTime? createdAt,
  }) {
    return WorkspaceEventModel(
      id: id ?? this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      actorUserId: actorUserId ?? this.actorUserId,
      entity: entity ?? this.entity,
      action: action ?? this.action,
      entityId: entityId is int? ? entityId : this.entityId,
      payloadJson: payloadJson is String? ? payloadJson : this.payloadJson,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

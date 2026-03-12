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
import '../../../features/workspace/models/collection_bundle.dart' as _i2;
import '../../../features/environments/models/environment_model.dart' as _i3;
import 'package:relay_server_client/src/protocol/protocol.dart' as _i4;

abstract class WorkspaceBundle implements _i1.SerializableModel {
  WorkspaceBundle._({
    required this.version,
    required this.exportedAt,
    required this.collections,
    required this.environments,
    this.source,
  });

  factory WorkspaceBundle({
    required int version,
    required DateTime exportedAt,
    required List<_i2.CollectionBundle> collections,
    required List<_i3.EnvironmentModel> environments,
    String? source,
  }) = _WorkspaceBundleImpl;

  factory WorkspaceBundle.fromJson(Map<String, dynamic> jsonSerialization) {
    return WorkspaceBundle(
      version: jsonSerialization['version'] as int,
      exportedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['exportedAt'],
      ),
      collections: _i4.Protocol().deserialize<List<_i2.CollectionBundle>>(
        jsonSerialization['collections'],
      ),
      environments: _i4.Protocol().deserialize<List<_i3.EnvironmentModel>>(
        jsonSerialization['environments'],
      ),
      source: jsonSerialization['source'] as String?,
    );
  }

  int version;

  DateTime exportedAt;

  List<_i2.CollectionBundle> collections;

  List<_i3.EnvironmentModel> environments;

  String? source;

  /// Returns a shallow copy of this [WorkspaceBundle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WorkspaceBundle copyWith({
    int? version,
    DateTime? exportedAt,
    List<_i2.CollectionBundle>? collections,
    List<_i3.EnvironmentModel>? environments,
    String? source,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WorkspaceBundle',
      'version': version,
      'exportedAt': exportedAt.toJson(),
      'collections': collections.toJson(valueToJson: (v) => v.toJson()),
      'environments': environments.toJson(valueToJson: (v) => v.toJson()),
      if (source != null) 'source': source,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WorkspaceBundleImpl extends WorkspaceBundle {
  _WorkspaceBundleImpl({
    required int version,
    required DateTime exportedAt,
    required List<_i2.CollectionBundle> collections,
    required List<_i3.EnvironmentModel> environments,
    String? source,
  }) : super._(
         version: version,
         exportedAt: exportedAt,
         collections: collections,
         environments: environments,
         source: source,
       );

  /// Returns a shallow copy of this [WorkspaceBundle]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WorkspaceBundle copyWith({
    int? version,
    DateTime? exportedAt,
    List<_i2.CollectionBundle>? collections,
    List<_i3.EnvironmentModel>? environments,
    Object? source = _Undefined,
  }) {
    return WorkspaceBundle(
      version: version ?? this.version,
      exportedAt: exportedAt ?? this.exportedAt,
      collections:
          collections ?? this.collections.map((e0) => e0.copyWith()).toList(),
      environments:
          environments ?? this.environments.map((e0) => e0.copyWith()).toList(),
      source: source is String? ? source : this.source,
    );
  }
}

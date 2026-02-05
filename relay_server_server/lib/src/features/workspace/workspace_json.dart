import 'package:relay_server_server/src/generated/protocol.dart';

/// Converts server [WorkspaceBundle] to JSON map compatible with Röle client
/// (RemoteWorkspaceClient expects this shape at GET /workspace).
Map<String, dynamic> workspaceBundleToClientJson(WorkspaceBundle bundle) {
  return {
    'version': bundle.version,
    'exportedAt': bundle.exportedAt.toUtc().toIso8601String(),
    'source': bundle.source,
    'collections': bundle.collections.map(collectionBundleToClientJson).toList(),
    'environments': bundle.environments.map(environmentToClientJson).toList(),
  };
}

Map<String, dynamic> collectionBundleToClientJson(CollectionBundle cb) {
  return {
    'collection': collectionModelToClientJson(cb.collection),
    'requests': cb.requests.map(apiRequestToClientJson).toList(),
  };
}

Map<String, dynamic> collectionModelToClientJson(CollectionModel c) {
  return {
    'id': c.id,
    'name': c.name,
    'description': c.description,
    'createdAt': c.createdAt.toUtc().toIso8601String(),
    'updatedAt': c.updatedAt.toUtc().toIso8601String(),
  };
}

Map<String, dynamic> apiRequestToClientJson(ApiRequestModel r) {
  return {
    'id': r.id,
    'name': r.name,
    'method': r.method,
    'urlTemplate': r.urlTemplate,
    'headers': r.headers,
    'queryParams': r.queryParams,
    'body': r.body,
    'bodyType': r.bodyType,
    'formDataFields': r.formDataFields,
    'authType': r.authType,
    'authConfig': r.authConfig,
    'description': r.description,
    'filePath': r.filePath,
    'collectionId': r.collectionId,
    'environmentName': r.environmentName,
    'createdAt': r.createdAt.toUtc().toIso8601String(),
    'updatedAt': r.updatedAt.toUtc().toIso8601String(),
  };
}

Map<String, dynamic> environmentToClientJson(EnvironmentModel e) {
  return {'name': e.name, 'variables': e.variables};
}

/// Parses client JSON (from PUT /workspace body) into server [WorkspaceBundle].
WorkspaceBundle workspaceBundleFromClientJson(Map<String, dynamic> json) {
  final version = json['version'] is int ? json['version'] as int : 1;
  final exportedAtRaw = json['exportedAt'];
  final DateTime exportedAt = exportedAtRaw is String
      ? (DateTime.tryParse(exportedAtRaw) ?? DateTime.now().toUtc())
      : DateTime.now().toUtc();
  final collectionsJson = json['collections'];
  final environmentsJson = json['environments'];
  final collections = collectionsJson is List
      ? (collectionsJson)
          .whereType<Map<String, dynamic>>()
          .map(collectionBundleFromClientJson)
          .toList()
      : <CollectionBundle>[];
  final environments = environmentsJson is List
      ? (environmentsJson)
          .whereType<Map<String, dynamic>>()
          .map(environmentFromClientJson)
          .toList()
      : <EnvironmentModel>[];

  return WorkspaceBundle(
    version: version,
    exportedAt: exportedAt,
    source: json['source'] as String?,
    collections: collections,
    environments: environments,
  );
}

CollectionBundle collectionBundleFromClientJson(Map<String, dynamic> json) {
  final collectionJson = json['collection'];
  final requestsJson = json['requests'];
  return CollectionBundle(
    collection: collectionJson is Map<String, dynamic>
        ? collectionModelFromClientJson(collectionJson)
        : CollectionModel(
            id: 'imported-${DateTime.now().millisecondsSinceEpoch}',
            name: 'Imported Collection',
            description: '',
            createdAt: DateTime.now().toUtc(),
            updatedAt: DateTime.now().toUtc(),
          ),
    requests: requestsJson is List
        ? (requestsJson)
            .whereType<Map<String, dynamic>>()
            .map(apiRequestFromClientJson)
            .toList()
        : <ApiRequestModel>[],
  );
}

CollectionModel collectionModelFromClientJson(Map<String, dynamic> json) {
  return CollectionModel(
    id: json['id'] as String? ?? '',
    name: json['name'] as String? ?? 'Unnamed',
    description: json['description'] as String? ?? '',
    createdAt: _parseDateTime(json['createdAt']),
    updatedAt: _parseDateTime(json['updatedAt']),
  );
}

ApiRequestModel apiRequestFromClientJson(Map<String, dynamic> json) {
  return ApiRequestModel(
    id: json['id'] as String? ?? '',
    name: json['name'] as String? ?? '',
    method: json['method'] as String? ?? 'get',
    urlTemplate: json['urlTemplate'] as String? ?? '',
    headers: Map<String, String>.from(json['headers'] ?? const {}),
    queryParams: Map<String, String>.from(json['queryParams'] ?? const {}),
    body: json['body'] as String?,
    bodyType: json['bodyType'] as String? ?? 'raw',
    formDataFields: Map<String, String>.from(json['formDataFields'] ?? const {}),
    authType: json['authType'] as String? ?? 'none',
    authConfig: Map<String, String>.from(json['authConfig'] ?? const {}),
    description: json['description'] as String?,
    filePath: json['filePath'] as String?,
    collectionId: json['collectionId'] as String? ?? 'default',
    environmentName: json['environmentName'] as String?,
    createdAt: _parseDateTime(json['createdAt']),
    updatedAt: _parseDateTime(json['updatedAt']),
  );
}

EnvironmentModel environmentFromClientJson(Map<String, dynamic> json) {
  return EnvironmentModel(
    name: json['name'] as String? ?? 'default',
    variables: Map<String, String>.from(json['variables'] ?? const {}),
  );
}

DateTime _parseDateTime(dynamic value) {
  if (value is String) {
    return DateTime.tryParse(value) ?? DateTime.now().toUtc();
  }
  return DateTime.now().toUtc();
}

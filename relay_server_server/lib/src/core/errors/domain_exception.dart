class DomainException implements Exception {
  DomainException(this.message, {this.code, this.statusCode = 400});

  final String message;
  final String? code;
  final int statusCode;

  @override
  String toString() => message;
}

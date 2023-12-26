class ApiException implements Exception {
  const ApiException({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;
}

class ServerException implements Exception {
  const ServerException({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;
}

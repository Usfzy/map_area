class ServerException implements Exception {
  final Object? message;
  const ServerException({required this.message});
}

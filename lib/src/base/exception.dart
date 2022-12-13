class ServerException {
  final String message;
  final dynamic error;
  final int statusCode;
  ServerException(
      {required this.message, required this.statusCode, required this.error});
}

class LocalException {
  final String message;
  final dynamic error;
  LocalException({required this.message, required this.error});
}

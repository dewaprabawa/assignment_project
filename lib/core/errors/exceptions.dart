class ServerException implements Exception {
  final String message;

  ServerException({this.message = 'Server Error'});

  @override
  String toString() {
    return 'ServerException: $message';
  }
}

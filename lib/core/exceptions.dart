sealed class AppException implements Exception {
  final String message;
  const AppException(this.message);
}

final class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection']);
}

final class ServerException extends AppException {
  const ServerException([super.message = 'Server error']);
}

final class AppDatabaseException extends AppException {
  const AppDatabaseException([super.message = 'Database error']);
}

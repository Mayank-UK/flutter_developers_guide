sealed class AppException implements Exception {
  final String message;
  final Object? cause;

  const AppException(this.message, {this.cause});

  @override
  String toString() {
    if (cause != null) return '$runtimeType: $message\n  caused by: $cause';
    return '$runtimeType: $message';
  }
}

final class NetworkException extends AppException {
  const NetworkException([
    String message = 'No internet connection',
    Object? cause,
  ]) : super(message, cause: cause);
}

final class ServerException extends AppException {
  const ServerException([
    String message = 'Server error',
    Object? cause,
  ]) : super(message, cause: cause);
}

final class AppDatabaseException extends AppException {
  const AppDatabaseException([
    String message = 'Database error',
    Object? cause,
  ]) : super(message, cause: cause);
}

final class AuthException extends AppException {
  const AuthException([
    String message = 'Authentication error',
    Object? cause,
  ]) : super(message, cause: cause);
}

final class FirebaseFirestoreException extends AppDatabaseException {
  const FirebaseFirestoreException([
    String message = 'Firestore error',
    Object? cause,
  ]) : super(message, cause);
}

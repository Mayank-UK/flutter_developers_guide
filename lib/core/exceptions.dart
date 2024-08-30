class AppDatabaseException implements Exception {
  final String message;
  AppDatabaseException(this.message);
  @override
  String toString() => 'DatabaseException: $message';
}

class RepositoryException implements Exception {
  final String message;
  RepositoryException(this.message);
  @override
  String toString() => 'RepositoryException: $message';
}

class UseCaseException implements Exception {
  final String message;
  UseCaseException(this.message);
  @override
  String toString() => 'UseCaseException: $message';
}

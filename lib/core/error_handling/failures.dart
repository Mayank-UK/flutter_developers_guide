enum FailureSeverity { info, warning, critical }

sealed class Failure {
  final String _rawMessage;
  final FailureSeverity severity;
  final Failure? cause;

  const Failure(this._rawMessage, this.severity, {this.cause});

  String get message {
    if (cause != null) {
      return '${cause!.message} + $_rawMessage';
    }
    return '$_rawMessage';
  }

  String get chain {
    final buffer = StringBuffer(_rawMessage);
    Failure? current = cause;
    while (current != null) {
      buffer.write('\n  → caused by: ${current._rawMessage}');
      current = current.cause;
    }
    return buffer.toString();
  }
}

final class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'No internet connection', Failure? cause]) : super(message, FailureSeverity.critical, cause: cause);
}

final class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server error', Failure? cause]) : super(message, FailureSeverity.critical, cause: cause);
}

final class CacheFailure extends Failure {
  const CacheFailure([String message = 'No cached data available', Failure? cause]) : super(message, FailureSeverity.warning, cause: cause);
}

final class UnknownFailure extends Failure {
  const UnknownFailure([String message = 'Something went wrong', Failure? cause]) : super(message, FailureSeverity.critical, cause: cause);
}

final class AuthFailure extends Failure {
  const AuthFailure([String message = 'Authentication failed', Failure? cause]) : super(message, FailureSeverity.warning, cause: cause);
}

final class FirestoreFailure extends Failure {
  const FirestoreFailure([String message = 'Firestore error', Failure? cause]) : super(message, FailureSeverity.critical, cause: cause);
}

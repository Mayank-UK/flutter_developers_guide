enum FailureSeverity { info, warning, critical }

sealed class Failure {
  final String _rawMessage; // Rename the internal storage field
  final FailureSeverity severity;
  final Failure? cause;

  const Failure(this._rawMessage, this.severity, {this.cause});

  // This is what the UI will read. It automatically chains the messages together!
  String get message {
    if (cause != null) {
      // This flips the order: "Server error + Database error"
      return '${cause!.message} + $_rawMessage';
    }
    return '$_rawMessage';
  }

  /// Used strictly for developer logging (terminal console text)
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
  const NetworkFailure([String message = 'No internet connection', Failure? cause])
      : super(
          message,
          FailureSeverity.critical,
          cause: cause,
        );
}

final class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server error', Failure? cause])
      : super(
          message,
          FailureSeverity.critical,
          cause: cause,
        );
}

final class CacheFailure extends Failure {
  const CacheFailure([String message = 'No cached data available', Failure? cause])
      : super(
          message,
          FailureSeverity.warning,
          cause: cause,
        );
}

final class UnknownFailure extends Failure {
  const UnknownFailure([String message = 'Something went wrong', Failure? cause])
      : super(
          message,
          FailureSeverity.critical,
          cause: cause,
        );
}

final class AuthFailure extends Failure {
  const AuthFailure([String message = 'Authentication failed', Failure? cause])
      : super(
          message,
          FailureSeverity.warning, // user-recoverable: wrong password, etc.
          cause: cause,
        );
}

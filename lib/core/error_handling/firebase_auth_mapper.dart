import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';

/// Maps [FirebaseAuthException] codes to [AuthException] with readable messages.
/// Called inside [AuthRemoteDataSource] — Firebase types never leak past this layer.
AuthException mapFirebaseAuthException(FirebaseAuthException e) {
  final message = switch (e.code) {
    'user-not-found' => 'No account found for this email.',
    'wrong-password' => 'Incorrect password.',
    'invalid-email' => 'The email address is not valid.',
    'email-already-in-use' => 'An account already exists for this email.',
    'weak-password' => 'Password must be at least 6 characters.',
    'user-disabled' => 'This account has been disabled.',
    'too-many-requests' => 'Too many attempts. Please try again later.',
    'network-request-failed' => 'No internet connection.',
    _ => e.message ?? 'Authentication error.',
  };

  return AuthException(message, e);
}

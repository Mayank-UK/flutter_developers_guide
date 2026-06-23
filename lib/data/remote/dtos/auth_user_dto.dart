import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter_developers_guide/domain/models/auth_user.dart';

/// Wraps [firebase_auth.User] — the raw data object from Firebase.
/// Responsible for converting Firebase's type into our domain [AuthUser].
/// Firebase's [User] is the DTO here; no JSON serialization needed.
class AuthUserDto {
  final String uid;
  final String email;
  final String? displayName;

  const AuthUserDto({
    required this.uid,
    required this.email,
    this.displayName,
  });

  factory AuthUserDto.fromFirebaseUser(User user) {
    return AuthUserDto(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
    );
  }

  AuthUser toAuthUser() {
    return AuthUser(
      uid: uid,
      email: email,
      displayName: displayName,
    );
  }
}

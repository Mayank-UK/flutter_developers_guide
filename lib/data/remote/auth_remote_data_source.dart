import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_developers_guide/core/error_handling/firebase_auth_mapper.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/data/remote/dtos/auth_user_dto.dart';
import 'package:logging/logging.dart';

abstract class AuthRemoteDataSource {
  Future<AuthUserDto> signIn({
    required String email,
    required String password,
  });

  Future<AuthUserDto> register({
    required String email,
    required String password,
  });

  /// Ensures an authenticated Firebase session exists, signing in anonymously
  /// when no user is present. Anonymous auth lets the Firestore/Storage demos
  /// satisfy auth-required security rules without forcing a manual login.
  /// Returns the current (anonymous or real) user. If a real user is already
  /// signed in, they are returned unchanged — this never downgrades a session.
  Future<AuthUserDto> ensureAnonymousSession();

  Stream<AuthUserDto?> authStateChanges();

  Future<void> signOut();
}

class FirebaseAuthRemoteDataSource implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final Logger logger;

  FirebaseAuthRemoteDataSource({
    required this.firebaseAuth,
    required this.logger,
  });

  @override
  Future<AuthUserDto> signIn({
    required String email,
    required String password,
  }) =>
      guardedApiCall(
        () async {
          logger.info('Signing in: $email');

          try {
            final credential = await firebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            );

            return AuthUserDto.fromFirebaseUser(credential.user!);
          } on FirebaseAuthException catch (e) {
            throw mapFirebaseAuthException(e);
          }
        },
      );

  @override
  Future<AuthUserDto> register({
    required String email,
    required String password,
  }) =>
      guardedApiCall(
        () async {
          logger.info('Registering: $email');

          try {
            final credential =
                await firebaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            );

            return AuthUserDto.fromFirebaseUser(credential.user!);
          } on FirebaseAuthException catch (e) {
            throw mapFirebaseAuthException(e);
          }
        },
      );

  @override
  Future<AuthUserDto> ensureAnonymousSession() => guardedApiCall(
        () async {
          final current = firebaseAuth.currentUser;
          if (current != null) {
            return AuthUserDto.fromFirebaseUser(current);
          }

          logger.info('Signing in anonymously for data demos');
          final result = await firebaseAuth.signInAnonymously();
          return AuthUserDto.fromFirebaseUser(result.user!);
        },
      );

  @override
  Stream<AuthUserDto?> authStateChanges() {
    // Anonymous sessions are an infrastructure detail used to satisfy auth-
    // required security rules for the Firestore/Storage demos. They are not
    // "real" logins, so they are reported as null here to keep the FirebaseAuth
    // demo UI in its logged-out state (showing the login/register form).
    return firebaseAuth.authStateChanges().map(
          (user) =>
              (user == null || user.isAnonymous) ? null : AuthUserDto.fromFirebaseUser(user),
        );
  }

  @override
  Future<void> signOut() => guardedApiCall(
        () async {
          await firebaseAuth.signOut();
        },
      );
}

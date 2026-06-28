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
  Stream<AuthUserDto?> authStateChanges() {
    return firebaseAuth.authStateChanges().map(
          (user) => user == null ? null : AuthUserDto.fromFirebaseUser(user),
        );
  }

  @override
  Future<void> signOut() => guardedApiCall(
        () async {
          await firebaseAuth.signOut();
        },
      );
}

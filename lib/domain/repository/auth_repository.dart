import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/auth_user.dart';

abstract class AuthRepository {
  Future<Result<AuthUser>> signIn({
    required String email,
    required String password,
  });

  Future<Result<AuthUser>> register({
    required String email,
    required String password,
  });

  Stream<AuthUser?> authStateChanges();

  /// Ensures an authenticated session exists (signing in anonymously if
  /// needed) so that Firebase-gated demos work under auth-required rules.
  /// See [AuthRemoteDataSource.ensureAnonymousSession].
  Future<Result<AuthUser>> ensureAnonymousSession();

  Future<Result<void>> signOut();
}

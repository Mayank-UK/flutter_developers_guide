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

  Future<void> signOut();
}

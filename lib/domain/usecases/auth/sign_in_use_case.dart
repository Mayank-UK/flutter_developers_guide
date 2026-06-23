import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/auth_user.dart';
import 'package:flutter_developers_guide/domain/repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Result<AuthUser>> call({
    required String email,
    required String password,
  }) =>
      repository.signIn(email: email, password: password);
}

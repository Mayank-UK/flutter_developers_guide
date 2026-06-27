import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/auth_user.dart';
import 'package:flutter_developers_guide/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Result<AuthUser>> call({
    required String email,
    required String password,
  }) =>
      repository.register(email: email, password: password);
}

import 'package:flutter_developers_guide/domain/models/auth_user.dart';
import 'package:flutter_developers_guide/domain/repository/auth_repository.dart';

class AuthStateChangesUseCase {
  final AuthRepository repository;

  AuthStateChangesUseCase(this.repository);

  Stream<AuthUser?> call() {
    return repository.authStateChanges();
  }
}

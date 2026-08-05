import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<Result<void>> call() {
    return repository.signOut();
  }
}

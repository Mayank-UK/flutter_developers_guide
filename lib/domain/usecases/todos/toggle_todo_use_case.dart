import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/repository/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ToggleTodoUseCase {
  final TodoRepository repository;
  ToggleTodoUseCase(this.repository);

  Future<Result<void>> call(String id, bool isCompleted) =>
      repository.toggleTodo(id, isCompleted);
}

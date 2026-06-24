import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/repository/todo_repository.dart';

class DeleteTodoUseCase {
  final TodoRepository repository;
  DeleteTodoUseCase(this.repository);

  Future<Result<void>> call(String id) => repository.deleteTodo(id);
}

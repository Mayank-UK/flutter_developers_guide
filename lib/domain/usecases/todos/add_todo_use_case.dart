import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/todo.dart';
import 'package:flutter_developers_guide/domain/repository/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddTodoUseCase {
  final TodoRepository repository;
  AddTodoUseCase(this.repository);

  Future<Result<Todo>> call(String title) => repository.addTodo(title);
}

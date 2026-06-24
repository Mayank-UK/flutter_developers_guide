import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/todo.dart';
import 'package:flutter_developers_guide/domain/repository/todo_repository.dart';

class WatchTodosUseCase {
  final TodoRepository repository;
  WatchTodosUseCase(this.repository);

  Stream<Result<List<Todo>>> call() => repository.watchTodos();
}

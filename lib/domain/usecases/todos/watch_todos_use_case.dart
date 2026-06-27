import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/todo.dart';
import 'package:flutter_developers_guide/domain/repository/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchTodosUseCase {
  final TodoRepository repository;
  WatchTodosUseCase(this.repository);

  Stream<Result<List<Todo>>> call() => repository.watchTodos();
}

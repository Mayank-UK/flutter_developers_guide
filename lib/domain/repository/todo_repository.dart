import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/todo.dart';

abstract class TodoRepository {
  Stream<Result<List<Todo>>> watchTodos();
  Future<Result<Todo>> addTodo(String title);
  Future<Result<void>> toggleTodo(String id, bool isCompleted);
  Future<Result<void>> deleteTodo(String id);
}

import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/scenario/api_scenario.dart';
import 'package:flutter_developers_guide/data/remote/dtos/todo_dto.dart';
import 'package:flutter_developers_guide/data/remote/fake_api_simulator.dart';
import 'package:flutter_developers_guide/data/remote/todo_remote_data_source.dart';

/// Single-responsibility fake of [TodoRemoteDataSource]. Replaces the todo
/// slice of the former `FakeApiService` god-fake; simulation mechanics are
/// shared via [FakeApiSimulator].
class FakeTodoRemoteDataSource
    with FakeApiSimulator
    implements TodoRemoteDataSource {
  @override
  final ApiScenario scenario;

  FakeTodoRemoteDataSource({required this.scenario});

  final List<TodoDto> _todos = [
    TodoDto(
      id: '1',
      title: 'Learn Flutter',
      isCompleted: false,
    ),
  ];

  @override
  Stream<List<TodoDto>> watchTodos() async* {
    yield await simulate(() => List.unmodifiable(_todos));
  }

  @override
  Future<TodoDto> addTodo(String title) {
    return simulate(() {
      final todo = TodoDto(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        isCompleted: false,
      );

      _todos.add(todo);

      return todo;
    });
  }

  @override
  Future<void> toggleTodo(
    String id,
    bool isCompleted,
  ) {
    return simulate(() {
      final index = _todos.indexWhere((t) => t.id == id);

      if (index == -1) {
        throw const AppDatabaseException(
          'Todo not found',
        );
      }

      _todos[index] = TodoDto(
        id: _todos[index].id,
        title: _todos[index].title,
        isCompleted: isCompleted,
      );
    });
  }

  @override
  Future<void> deleteTodo(String id) {
    return simulate(() {
      _todos.removeWhere(
        (todo) => todo.id == id,
      );
    });
  }
}

// lib/core/testing/fake_api_service.dart
import 'dart:io';

import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/data/remote/dtos/auth_user_dto.dart';
import 'package:flutter_developers_guide/data/remote/dtos/image_item_dto.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:flutter_developers_guide/data/remote/dtos/todo_dto.dart';

enum ApiScenario { success, networkError, timeout, serverError, invalidJson }

/* 
  FakeApiService has 2 main objectives: 
    - To continue development without backend
    - To simulate different types of failures and their handling
*/
class FakeApiService implements ApiService {
  ApiScenario scenario;

  FakeApiService({
    this.scenario = ApiScenario.success,
  });

  final _authUser = AuthUserDto(
    email: 'test@gmail.com',
    uid: '14345634',
    displayName: 'test',
  );

  final List<TodoDTO> _todos = [
    TodoDTO(
      id: '1',
      title: 'Learn Flutter',
      isCompleted: false,
    ),
  ];

  final List<PostDTO> _posts = [
    PostDTO(
      id: 1,
      title: 'Fake post',
      body: 'From fake API',
    ),
  ];

  Future<T> _simulate<T>(T Function() onSuccess) async {
    await Future.delayed(const Duration(milliseconds: 600));

    switch (scenario) {
      case ApiScenario.success:
        return onSuccess();

      case ApiScenario.networkError:
        throw const NetworkException();

      case ApiScenario.timeout:
        throw const NetworkException(
          'Simulated request timed out',
        );

      case ApiScenario.serverError:
        throw const ServerException(
          'Simulated server returned 500',
        );

      case ApiScenario.invalidJson:
        throw const ServerException(
          'Simulated invalid response format',
        );
    }
  }

  @override
  Future<AuthUserDto> signIn({
    required String email,
    required String password,
  }) {
    return _simulate(
      () => _authUser,
    );
  }

  @override
  Future<AuthUserDto> register({
    required String email,
    required String password,
  }) {
    return _simulate(
      () => _authUser,
    );
  }

  @override
  Stream<AuthUserDto?> authStateChanges() {
    return Stream.value(
      _authUser,
    );
  }

  @override
  Future<void> signOut() async {}

  @override
  Future<List<PostDTO>> getPosts() {
    return _simulate(
      () => _posts,
    );
  }

  @override
  Stream<List<TodoDTO>> watchTodos() async* {
    yield List.unmodifiable(_todos);
  }

  @override
  Future<TodoDTO> addTodo(String title) {
    return _simulate(() {
      final todo = TodoDTO(
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
    return _simulate(() {
      final index = _todos.indexWhere((t) => t.id == id);

      if (index == -1) {
        throw const AppDatabaseException(
          'Todo not found',
        );
      }

      _todos[index] = TodoDTO(
        id: _todos[index].id,
        title: _todos[index].title,
        isCompleted: isCompleted,
      );
    });
  }

  @override
  Future<void> deleteTodo(String id) {
    return _simulate(() {
      _todos.removeWhere(
        (todo) => todo.id == id,
      );
    });
  }

  @override
  Stream<List<ImageItemDTO>> watchImages() => Stream.value([]);

  @override
  Future<ImageItemDTO> uploadImage(File file, String userId) async => ImageItemDTO(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        url: 'https://picsum.photos/200',
        fileName: file.path.split('/').last,
        uploadedAt: DateTime.now(),
      );

  @override
  Future<void> deleteImage(String id, String fileName, String userId) async {}
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/data/remote/dtos/todo_dto.dart';

abstract class TodoRemoteDataSource {
  Stream<List<TodoDto>> watchTodos();

  Future<TodoDto> addTodo(String title);

  Future<void> toggleTodo(String id, bool isCompleted);

  Future<void> deleteTodo(String id);
}

class FirestoreTodoRemoteDataSource implements TodoRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  FirestoreTodoRemoteDataSource({
    required this.firebaseFirestore,
  });

  CollectionReference<Map<String, dynamic>> get _todosCollection =>
      firebaseFirestore.collection('todos');

  @override
  Stream<List<TodoDto>> watchTodos() {
    return guardedStream(_todosCollection.snapshots()).map((snapshot) {
      return snapshot.docs
          .map((doc) => TodoDto.fromJson(doc.id, doc.data()))
          .toList();
    });
  }

  @override
  Future<TodoDto> addTodo(String title) => guardedApiCall(
        () async {
          final ref = await _todosCollection.add({
            'title': title,
            'isCompleted': false,
          });

          return TodoDto(id: ref.id, title: title, isCompleted: false);
        },
      );

  @override
  Future<void> toggleTodo(String id, bool isCompleted) => guardedApiCall(
        () async {
          await _todosCollection.doc(id).update({'isCompleted': isCompleted});
        },
      );

  @override
  Future<void> deleteTodo(String id) => guardedApiCall(
        () async {
          await _todosCollection.doc(id).delete();
        },
      );
}

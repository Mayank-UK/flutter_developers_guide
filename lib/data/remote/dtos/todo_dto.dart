import 'package:flutter_developers_guide/domain/models/todo.dart';

class TodoDto {
  final String id;
  final String title;
  final bool isCompleted;

  TodoDto({required this.id, required this.title, required this.isCompleted});

  // Firestore gives Map<String, dynamic> natively, cleaner than RTDB's Map<dynamic, dynamic>
  factory TodoDto.fromJson(String id, Map<String, dynamic> json) {
    return TodoDto(
      id: id,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      // id excluded — Firestore doc ID is the document path, not a field
    };
  }

  Todo toTodo() => Todo(id: id, title: title, isCompleted: isCompleted);

  static TodoDto fromTodo(Todo todo) =>
      TodoDto(id: todo.id, title: todo.title, isCompleted: todo.isCompleted);
}

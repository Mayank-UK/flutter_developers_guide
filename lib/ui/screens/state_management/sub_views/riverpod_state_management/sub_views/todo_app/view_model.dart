import 'package:flutter_developers_guide/domain/models/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

// Disposed automatically when the screen is no longer in the tree, don't use autoDispose in sharedViewModel
class RiverpodTodoViewModel extends AutoDisposeNotifier<List<Todo>> {
  static const _uuid = Uuid();

  @override
  List<Todo> build() => [
        Todo(id: _uuid.v4(), title: 'Finish the app', isCompleted: false),
        Todo(id: _uuid.v4(), title: 'Write a blog post', isCompleted: false),
        Todo(id: _uuid.v4(), title: 'Share with community', isCompleted: true),
      ];

  void addTodo(String title, {bool isCompleted = false}) {
    final trimmed = title.trim();
    if (trimmed.isEmpty) return;

    state = [
      ...state,
      Todo(id: _uuid.v4(), title: trimmed, isCompleted: isCompleted),
    ];
  }

  void toggleTodo(Todo todo) {
    state = state.map((t) => t.id == todo.id ? t.copyWith(isCompleted: !t.isCompleted) : t).toList();
  }

  void deleteTodo(Todo todo) {
    state = state.where((t) => t.id != todo.id).toList();
  }
}

/* 
  In Provider, MultiProvider in main.dart is doing this registration work for you, invisibly:
      main.dart — you wrote this once and forgot about it
      ChangeNotifierProvider(create: (_) => TodosViewModel())

  In Riverpod, that registration lives next to the class itself instead of in main.dart like done below

  That's it. Same concept, different location.
*/
final todosProvider = NotifierProvider.autoDispose<RiverpodTodoViewModel, List<Todo>>(
  RiverpodTodoViewModel.new,
);

/* 
  In Provider you had getters:
      UnmodifiableListView<Task> get incompleteTasks => ...
      UnmodifiableListView<Task> get completedTasks => ...

  In Riverpod, those same getters become separately registered providers so widgets can subscribe to them independently. 
  Same data, same logic — just registered so Riverpod can cache and track them.
*/
final incompleteTodosProvider = Provider.autoDispose<List<Todo>>((ref) {
  return ref.watch(todosProvider).where((t) => !t.isCompleted).toList();
});

final completedTodosProvider = Provider.autoDispose<List<Todo>>((ref) {
  return ref.watch(todosProvider).where((t) => t.isCompleted).toList();
});

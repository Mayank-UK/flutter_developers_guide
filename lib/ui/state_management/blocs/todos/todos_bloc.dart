import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/todo.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/add_todo_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/delete_todo_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/toggle_todo_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/watch_todos_use_case.dart';

// Events
sealed class TodosEvent {}

class WatchTodos extends TodosEvent {}

class AddTodo extends TodosEvent {
  final String title;
  AddTodo(this.title);
}

class ToggleTodo extends TodosEvent {
  final String id;
  final bool isCompleted;
  ToggleTodo(this.id, this.isCompleted);
}

class DeleteTodo extends TodosEvent {
  final String id;
  DeleteTodo(this.id);
}

// States
sealed class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object?> get props => [];
}

class TodosInitial extends TodosState {}

class TodosLoading extends TodosState {}

class TodosLoaded extends TodosState {
  final List<Todo> todos;
  const TodosLoaded(this.todos);

  @override
  List<Object?> get props => [todos];
}

class TodosError extends TodosState {
  final Failure failure;
  const TodosError(this.failure);

  @override
  List<Object?> get props => [failure];
}

// BLoC
class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final WatchTodosUseCase watchTodosUseCase;
  final AddTodoUseCase addTodoUseCase;
  final ToggleTodoUseCase toggleTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;

  StreamSubscription<Result<List<Todo>>>? _todosSubscription;

  TodosBloc({
    required this.watchTodosUseCase,
    required this.addTodoUseCase,
    required this.toggleTodoUseCase,
    required this.deleteTodoUseCase,
  }) : super(TodosInitial()) {
    on<WatchTodos>(_onWatchTodos);
    on<AddTodo>(_onAddTodo);
    on<ToggleTodo>(_onToggleTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  void _onWatchTodos(WatchTodos event, Emitter<TodosState> emit) async {
    emit(TodosLoading());

    // Cancel any existing subscription before starting a new one
    await _todosSubscription?.cancel();

    // emit.forEach drives the stream and handles cancellation when bloc closes
    await emit.forEach<Result<List<Todo>>>(
      watchTodosUseCase(),
      onData: (result) => switch (result) {
        Success(value: final todos) => TodosLoaded(todos),
        Failed(failure: final failure) => TodosError(failure),
      },
      onError: (_, __) => TodosError(UnknownFailure('Stream error')),
    );
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodosState> emit) async {
    final result = await addTodoUseCase(event.title.trim());
    if (result case Failed(failure: final failure)) {
      emit(TodosError(failure));
    }
    // On success: stream emits updated list — no manual state change needed
  }

  Future<void> _onToggleTodo(ToggleTodo event, Emitter<TodosState> emit) async {
    final result = await toggleTodoUseCase(event.id, event.isCompleted);
    if (result case Failed(failure: final failure)) {
      emit(TodosError(failure));
    }
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodosState> emit) async {
    final result = await deleteTodoUseCase(event.id);
    if (result case Failed(failure: final failure)) {
      emit(TodosError(failure));
    }
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}

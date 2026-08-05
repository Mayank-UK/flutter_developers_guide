import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/todo.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/add_todo_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/delete_todo_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/toggle_todo_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/todos/watch_todos_use_case.dart';
import 'package:flutter_developers_guide/ui/blocs/todos/todos_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockWatchTodosUseCase extends Mock implements WatchTodosUseCase {}

class MockAddTodoUseCase extends Mock implements AddTodoUseCase {}

class MockToggleTodoUseCase extends Mock implements ToggleTodoUseCase {}

class MockDeleteTodoUseCase extends Mock implements DeleteTodoUseCase {}

void main() {
  late MockWatchTodosUseCase mockWatch;
  late MockAddTodoUseCase mockAdd;
  late MockToggleTodoUseCase mockToggle;
  late MockDeleteTodoUseCase mockDelete;

  final tTodos = [
    Todo(id: 't1', title: 'First', isCompleted: false),
    Todo(id: 't2', title: 'Second', isCompleted: true),
  ];

  setUpAll(() {
    registerFallbackValue('');
  });

  setUp(() {
    mockWatch = MockWatchTodosUseCase();
    mockAdd = MockAddTodoUseCase();
    mockToggle = MockToggleTodoUseCase();
    mockDelete = MockDeleteTodoUseCase();
  });

  TodosBloc buildBloc() => TodosBloc(
        watchTodosUseCase: mockWatch,
        addTodoUseCase: mockAdd,
        toggleTodoUseCase: mockToggle,
        deleteTodoUseCase: mockDelete,
      );

  group('TodosBloc — initial state', () {
    blocTest<TodosBloc, TodosState>(
      'initial state is TodosInitial',
      build: buildBloc,
      act: (_) {},
      expect: () => [],
      verify: (bloc) => expect(bloc.state, isA<TodosInitial>()),
    );
  });

  group('TodosBloc — WatchTodos event', () {
    blocTest<TodosBloc, TodosState>(
      'emits TodosLoading then TodosLoaded for each stream emission on success',
      build: () {
        when(() => mockWatch()).thenAnswer(
          (_) => Stream.fromIterable([Success(tTodos)]),
        );
        return buildBloc();
      },
      act: (bloc) => bloc.add(WatchTodos()),
      // Stream emits one Success value then completes; expect loading + loaded.
      expect: () => [
        isA<TodosLoading>(),
        TodosLoaded(tTodos),
      ],
    );

    blocTest<TodosBloc, TodosState>(
      'emits TodosError when stream emits Failed(FirestoreFailure)',
      build: () {
        when(() => mockWatch()).thenAnswer(
          (_) => Stream.fromIterable(
            [const Failed(FirestoreFailure('permission-denied'))],
          ),
        );
        return buildBloc();
      },
      act: (bloc) => bloc.add(WatchTodos()),
      expect: () => [
        isA<TodosLoading>(),
        predicate<TodosState>(
          (s) => s is TodosError && s.failure is FirestoreFailure,
          'TodosError with FirestoreFailure',
        ),
      ],
    );
  });

  group('TodosBloc — AddTodo event', () {
    blocTest<TodosBloc, TodosState>(
      'does not emit anything on success (stream drives state)',
      // The bloc must be in a Loaded state for a successful add — otherwise
      // the stream never re-emits. We seed Loaded and assert no new emission.
      seed: () => TodosLoaded(tTodos),
      build: () {
        when(() => mockAdd(any()))
            .thenAnswer((_) async => Success(tTodos.first));
        return buildBloc();
      },
      act: (bloc) => bloc.add(AddTodo('New item')),
      expect: () => [],
      verify: (_) {
        verify(() => mockAdd('New item')).called(1);
      },
    );

    blocTest<TodosBloc, TodosState>(
      'emits TodosError when add fails',
      build: () {
        when(() => mockAdd(any()))
            .thenAnswer((_) async => const Failed(ServerFailure()));
        return buildBloc();
      },
      act: (bloc) => bloc.add(AddTodo('New item')),
      expect: () => [
        predicate<TodosState>(
          (s) => s is TodosError && s.failure is ServerFailure,
          'TodosError with ServerFailure',
        ),
      ],
    );
  });

  group('TodosBloc — ToggleTodo event', () {
    blocTest<TodosBloc, TodosState>(
      'does not emit anything on success',
      seed: () => TodosLoaded(tTodos),
      build: () {
        when(() => mockToggle(any(), any()))
            .thenAnswer((_) async => const Success(null));
        return buildBloc();
      },
      act: (bloc) => bloc.add(ToggleTodo('t1', true)),
      expect: () => [],
      verify: (_) => verify(() => mockToggle('t1', true)).called(1),
    );

    blocTest<TodosBloc, TodosState>(
      'emits TodosError when toggle fails',
      build: () {
        when(() => mockToggle(any(), any()))
            .thenAnswer((_) async => const Failed(NetworkFailure()));
        return buildBloc();
      },
      act: (bloc) => bloc.add(ToggleTodo('t1', true)),
      expect: () => [
        predicate<TodosState>(
          (s) => s is TodosError && s.failure is NetworkFailure,
          'TodosError with NetworkFailure',
        ),
      ],
    );
  });

  group('TodosBloc — DeleteTodo event', () {
    blocTest<TodosBloc, TodosState>(
      'does not emit anything on success',
      seed: () => TodosLoaded(tTodos),
      build: () {
        when(() => mockDelete(any()))
            .thenAnswer((_) async => const Success(null));
        return buildBloc();
      },
      act: (bloc) => bloc.add(DeleteTodo('t1')),
      expect: () => [],
      verify: (_) => verify(() => mockDelete('t1')).called(1),
    );

    blocTest<TodosBloc, TodosState>(
      'emits TodosError when delete fails',
      build: () {
        when(() => mockDelete(any()))
            .thenAnswer((_) async => const Failed(CacheFailure()));
        return buildBloc();
      },
      act: (bloc) => bloc.add(DeleteTodo('t1')),
      expect: () => [
        predicate<TodosState>(
          (s) => s is TodosError && s.failure is CacheFailure,
          'TodosError with CacheFailure',
        ),
      ],
    );
  });
}

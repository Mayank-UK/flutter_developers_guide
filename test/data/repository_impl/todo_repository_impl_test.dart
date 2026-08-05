import 'package:flutter_developers_guide/core/analytics/analytics_service.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/remote/dtos/todo_dto.dart';
import 'package:flutter_developers_guide/data/remote/todo_remote_data_source.dart';
import 'package:flutter_developers_guide/data/repository_impl/todo_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockTodoRemoteDataSource extends Mock implements TodoRemoteDataSource {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

// --- Helpers ---
final tTodoDto = TodoDto(id: 't1', title: 'Test todo', isCompleted: false);

void main() {
  late MockTodoRemoteDataSource mockRemote;
  late MockAnalyticsService mockAnalytics;
  late TodoRepositoryImpl repository;

  setUp(() {
    mockRemote = MockTodoRemoteDataSource();
    mockAnalytics = MockAnalyticsService();

    when(() => mockAnalytics.logTodoCreated()).thenAnswer((_) async {});
    when(() => mockAnalytics.logTodoCompleted()).thenAnswer((_) async {});
    when(() => mockAnalytics.logTodoDeleted()).thenAnswer((_) async {});

    repository = TodoRepositoryImpl(
      remoteDataSource: mockRemote,
      logger: Logger('test'),
      analytics: mockAnalytics,
    );
  });

  group('TodoRepositoryImpl.addTodo', () {
    test('returns Success(Todo) and logs analytics on success', () async {
      when(() => mockRemote.addTodo(any())).thenAnswer((_) async => tTodoDto);

      final result = await repository.addTodo('Test todo');

      expect(result, isA<Success>());
      final todo = (result as Success).value;
      expect(todo.id, 't1');
      expect(todo.title, 'Test todo');
      verify(() => mockAnalytics.logTodoCreated()).called(1);
    });

    test('returns Failed(ServerFailure) when remote throws ServerException',
        () async {
      when(() => mockRemote.addTodo(any()))
          .thenThrow(const ServerException('boom'));

      final result = await repository.addTodo('Test todo');

      expect(result, isA<Failed>());
      expect((result as Failed).failure, isA<ServerFailure>());
      verifyNever(() => mockAnalytics.logTodoCreated());
    });

    test('returns Failed(FirestoreFailure) on FirebaseFirestoreException',
        () async {
      when(() => mockRemote.addTodo(any()))
          .thenThrow(const FirebaseFirestoreException('permission-denied'));

      final result = await repository.addTodo('Test todo');

      expect(result, isA<Failed>());
      expect((result as Failed).failure, isA<FirestoreFailure>());
    });
  });

  group('TodoRepositoryImpl.toggleTodo', () {
    test('returns Success and logs completion analytics when isCompleted=true',
        () async {
      when(() => mockRemote.toggleTodo(any(), any()))
          .thenAnswer((_) async {});

      final result = await repository.toggleTodo('t1', true);

      expect(result, isA<Success>());
      verify(() => mockAnalytics.logTodoCompleted()).called(1);
    });

    test('does not log completion analytics when isCompleted=false', () async {
      when(() => mockRemote.toggleTodo(any(), any()))
          .thenAnswer((_) async {});

      await repository.toggleTodo('t1', false);

      verifyNever(() => mockAnalytics.logTodoCompleted());
    });

    test('returns Failed(NetworkFailure) when remote throws NetworkException',
        () async {
      when(() => mockRemote.toggleTodo(any(), any()))
          .thenThrow(const NetworkException());

      final result = await repository.toggleTodo('t1', true);

      expect(result, isA<Failed>());
      expect((result as Failed).failure, isA<NetworkFailure>());
    });
  });

  group('TodoRepositoryImpl.deleteTodo', () {
    test('returns Success and logs analytics on success', () async {
      when(() => mockRemote.deleteTodo(any())).thenAnswer((_) async {});

      final result = await repository.deleteTodo('t1');

      expect(result, isA<Success>());
      verify(() => mockAnalytics.logTodoDeleted()).called(1);
    });

    test('returns Failed when remote throws', () async {
      when(() => mockRemote.deleteTodo(any()))
          .thenThrow(const AppDatabaseException('missing'));

      final result = await repository.deleteTodo('t1');

      expect(result, isA<Failed>());
      expect((result as Failed).failure, isA<CacheFailure>());
      verifyNever(() => mockAnalytics.logTodoDeleted());
    });
  });

  group('TodoRepositoryImpl.watchTodos', () {
    test('emits Success(mapped Todos) for each upstream emission', () async {
      when(() => mockRemote.watchTodos()).thenAnswer(
        (_) => Stream.fromIterable([
          [tTodoDto],
          [TodoDto(id: 't2', title: 'Second', isCompleted: true)],
        ]),
      );

      final results = await repository.watchTodos().toList();

      expect(results.length, 2);
      expect(results.first, isA<Success<List>>());
      expect((results.first as Success).value.first.id, 't1');
      expect((results.last as Success).value.first.id, 't2');
    });

    test('emits Failed(FirestoreFailure) when upstream stream errors with '
        'FirebaseFirestoreException', () async {
      // A simple error-only stream exercises the repository's catch path.
      // guardedStream re-throws AppException unchanged; the repo's catch block
      // then maps it through mapExceptionToFailure → FirestoreFailure.
      when(() => mockRemote.watchTodos()).thenAnswer(
        (_) => Stream<List<TodoDto>>.error(
          const FirebaseFirestoreException('permission-denied'),
        ),
      );

      final results = await repository.watchTodos().toList();

      expect(results.length, 1);
      expect(results.first, isA<Failed<List>>());
      expect((results.first as Failed).failure, isA<FirestoreFailure>());
    });

    test('emits Failed(ServerFailure) for unexpected stream errors', () async {
      // The repository routes upstream through guardedStream, which wraps non-
      // AppException errors as ServerException('Stream error') → ServerFailure.
      when(() => mockRemote.watchTodos()).thenAnswer(
        (_) => Stream<List<TodoDto>>.error(StateError('boom')),
      );

      final results = await repository.watchTodos().toList();

      expect(results.length, 1);
      expect(results.first, isA<Failed<List>>());
      expect((results.first as Failed).failure, isA<ServerFailure>());
    });
  });
}

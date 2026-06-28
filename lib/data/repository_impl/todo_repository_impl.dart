import 'package:flutter_developers_guide/core/analytics/analytics_service.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/remote/todo_remote_data_source.dart';
import 'package:flutter_developers_guide/domain/models/todo.dart';
import 'package:flutter_developers_guide/domain/repository/todo_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;
  final Logger logger;
  final AnalyticsService analytics;

  TodoRepositoryImpl({
    required this.remoteDataSource,
    required this.logger,
    required this.analytics,
  });

  @override
  Stream<Result<List<Todo>>> watchTodos() async* {
    try {
      await for (final dtos in remoteDataSource.watchTodos()) {
        yield Success(dtos.map((d) => d.toTodo()).toList());
      }
    } catch (e, st) {
      logger.severe('Todo stream error', e, st);
      final failure = e is AppException
          ? mapExceptionToFailure(e)
          : UnknownFailure(e.toString());
      yield Failed(failure);
    }
  }

  @override
  Future<Result<Todo>> addTodo(String title) => safeRepositoryCall(
        logger: logger,
        call: () async {
          final dto = await remoteDataSource.addTodo(title);
          await analytics.logTodoCreated();
          return dto.toTodo();
        },
      );

  @override
  Future<Result<void>> toggleTodo(String id, bool isCompleted) =>
      safeRepositoryCall(
        logger: logger,
        call: () async {
          await remoteDataSource.toggleTodo(id, isCompleted);

          if (isCompleted) {
            await analytics.logTodoCompleted();
          }
        },
      );

  @override
  Future<Result<void>> deleteTodo(String id) => safeRepositoryCall(
        logger: logger,
        call: () async {
          await remoteDataSource.deleteTodo(id);
          await analytics.logTodoDeleted();
        },
      );
}

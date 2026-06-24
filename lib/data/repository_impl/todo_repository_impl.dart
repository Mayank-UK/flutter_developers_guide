import 'dart:async';

import 'package:flutter_developers_guide/core/analytics/analytics_service.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/domain/models/todo.dart';
import 'package:flutter_developers_guide/domain/repository/todo_repository.dart';
import 'package:logging/logging.dart';

class TodoRepositoryImpl implements TodoRepository {
  final ApiService remoteDataSource;
  final Logger logger;
  final AnalyticsService analytics;

  TodoRepositoryImpl({
    required this.remoteDataSource,
    required this.logger,
    required this.analytics,
  });

  @override
  Stream<Result<List<Todo>>> watchTodos() {
    final controller = StreamController<Result<List<Todo>>>();

    remoteDataSource
        .watchTodos()
        .map<Result<List<Todo>>>(
          (dtos) => Success(dtos.map((d) => d.toTodo()).toList()),
        )
        .listen(
      controller.add,
      onError: (Object e, StackTrace st) {
        logger.severe('Todo stream error', e, st);
        final failure = e is AppException ? mapExceptionToFailure(e) : UnknownFailure(e.toString());
        controller.add(Failed(failure));
      },
      onDone: controller.close,
    );

    return controller.stream;
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
  Future<Result<void>> toggleTodo(String id, bool isCompleted) => safeRepositoryCall(
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

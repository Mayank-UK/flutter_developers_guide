import 'package:flutter_developers_guide/core/error_handling/failures.dart';

sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  final T value;
  final Failure? warning;

  const Success(
    this.value, [
    this.warning,
  ]);
}

final class Failed<T> extends Result<T> {
  final Failure failure;
  const Failed(this.failure);
}

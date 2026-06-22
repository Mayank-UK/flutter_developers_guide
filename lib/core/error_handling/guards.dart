import 'dart:async';
import 'dart:io';

import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:logging/logging.dart';

Future<T> guardedApiCall<T>(Future<T> Function() call) async {
  try {
    return await call();
  } on SocketException catch (e) {
    throw NetworkException('No internet connection', e);
  } on TimeoutException catch (e) {
    throw NetworkException('Request timed out', e);
  } on HttpException catch (e) {
    throw NetworkException('Network error', e);
  } on FormatException catch (e) {
    throw ServerException('Invalid response format', e);
  }
}

Future<Result<ResultType>> safeRepositoryCall<ResultType>({
  required Future<ResultType> Function() call,
  required Logger logger,
  Future<Result<ResultType>> Function(AppException cause)? onNetworkError,
  Future<Result<ResultType>> Function(AppException cause)? onServerError,
}) async {
  try {
    return Success(await call());
  } on NetworkException catch (e) {
    if (onNetworkError != null) return onNetworkError(e);
    return Failed(mapExceptionToFailure(e));
  } on ServerException catch (e) {
    if (onServerError != null) return onServerError(e);
    return Failed(mapExceptionToFailure(e));
  } on AppDatabaseException catch (e) {
    return Failed(mapExceptionToFailure(e));
  } on AppException catch (e) {
    return Failed(mapExceptionToFailure(e));
  } catch (e, st) {
    logger.severe('Unexpected repository error', e, st);
    return const Failed(UnknownFailure());
  }
}

Failure mapExceptionToFailure(AppException e) {
  // If the inner cause is also an AppException, map it down the chain
  final Failure? innerCause = e.cause is AppException ? mapExceptionToFailure(e.cause as AppException) : null;

  return switch (e) {
    NetworkException() => NetworkFailure(e.message, innerCause),
    ServerException() => ServerFailure(e.message, innerCause),
    AppDatabaseException() => CacheFailure(e.message, innerCause),
  };
}

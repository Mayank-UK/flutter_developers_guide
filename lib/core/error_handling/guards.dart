import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:logging/logging.dart';

Future<T> guardedApiCall<T>(
  Future<T> Function() call,
) async {
  try {
    return await call();
  } on AppException {
    rethrow;
  } on FirebaseException catch (e) {
    throw FirebaseFirestoreException(
      e.message ?? 'Firestore error (${e.code})',
      e,
    );
  } on DioException catch (e) {
    throw switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        NetworkException('Request timed out', e),
      DioExceptionType.connectionError =>
        NetworkException('No internet connection', e),
      DioExceptionType.badResponse => (() {
          final data = e.response?.data;
          if (data is Map<String, dynamic>) {
            return ServerException(
              data['message']?.toString() ??
                  'Server returned ${e.response?.statusCode}',
              e,
            );
          }
          return ServerException(
              'Server returned ${e.response?.statusCode}', e);
        })(),
      DioExceptionType.cancel => NetworkException('Request was cancelled', e),
      DioExceptionType.badCertificate =>
        NetworkException('Bad SSL certificate', e),
      DioExceptionType.unknown =>
        NetworkException(e.message ?? 'Network error', e),
    };
  } on FormatException catch (e) {
    throw ServerException('Invalid response format', e);
  } catch (e) {
    throw ServerException('Unexpected error', e);
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
  } on FirebaseFirestoreException catch (e) {
    return Failed(mapExceptionToFailure(e));
  } on AppDatabaseException catch (e) {
    return Failed(mapExceptionToFailure(e));
  } on AuthException catch (e) {
    return Failed(mapExceptionToFailure(e));
  } catch (e, st) {
    logger.severe('Unexpected repository error', e, st);
    return const Failed(UnknownFailure());
  }
}

Failure mapExceptionToFailure(AppException e) {
  final Failure? innerCause = e.cause is AppException
      ? mapExceptionToFailure(e.cause as AppException)
      : null;

  return switch (e) {
    NetworkException() => NetworkFailure(e.message, innerCause),
    ServerException() => ServerFailure(e.message, innerCause),
    FirebaseFirestoreException() => FirestoreFailure(e.message, innerCause),
    AppDatabaseException() => CacheFailure(e.message, innerCause),
    AuthException() => AuthFailure(e.message, innerCause),
  };
}

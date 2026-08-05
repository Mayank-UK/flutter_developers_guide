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
    throw FirebaseFirestoreException(_firebaseMessage(e), e);
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
    // Failure.cause is itself typed `Failure?` (not Object?), so the raw
    // exception object cannot be stored directly in the cause chain without
    // widening the Failure API. Preserve its detail in the message instead;
    // the full exception + stack trace is already captured by the logger
    // above.
    return Failed(UnknownFailure('Unexpected error: $e'));
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

/// Translates a [FirebaseException] into a readable message, special-casing the
/// permission-denied codes so users see an actionable hint instead of Firebase's
/// raw "Missing or insufficient permissions" text. Covers both Firestore
/// (`permission-denied`) and Storage (`unauthorized`) codes.
String _firebaseMessage(FirebaseException e) {
  if (e.code == 'permission-denied' || e.code == 'unauthorized') {
    return 'Sign in required to access this data.';
  }
  return e.message ?? 'Firebase error (${e.code})';
}

/// Wraps a Firebase [Stream] so that any [FirebaseException] it errors with is
/// mapped to an [AppException], mirroring [guardedApiCall] for write operations.
/// Without this, stream errors (e.g. expired test-mode rules) surface as
/// [UnknownFailure] in the repositories instead of [FirestoreFailure].
Stream<T> guardedStream<T>(Stream<T> stream) {
  return stream.handleError(
    (Object error, StackTrace st) {
      if (error is AppException) {
        throw error;
      }
      if (error is FirebaseException) {
        throw FirebaseFirestoreException(_firebaseMessage(error), error);
      }
      throw ServerException('Stream error', error);
    },
    test: (error) => error is! AppException,
  );
}

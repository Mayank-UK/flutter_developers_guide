import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';

void main() {
  group('mapExceptionToFailure', () {
    test('maps NetworkException → NetworkFailure', () {
      const exception = NetworkException('No internet connection');
      final failure = mapExceptionToFailure(exception);

      expect(failure, isA<NetworkFailure>());
      expect(failure.message, 'No internet connection');
      expect(failure.cause, isNull);
    });

    test('maps ServerException → ServerFailure', () {
      const exception = ServerException('Server error');
      final failure = mapExceptionToFailure(exception);

      expect(failure, isA<ServerFailure>());
      expect(failure.message, 'Server error');
    });

    test('maps FirebaseFirestoreException → FirestoreFailure (not CacheFailure)',
        () {
      // FirebaseFirestoreException extends AppDatabaseException, so this guards
      // the switch-case ordering: it must surface as FirestoreFailure.
      const exception = FirebaseFirestoreException('permission-denied');
      final failure = mapExceptionToFailure(exception);

      expect(failure, isA<FirestoreFailure>());
      expect(failure, isNot(isA<CacheFailure>()));
      expect(failure.message, 'permission-denied');
    });

    test('maps AppDatabaseException → CacheFailure', () {
      const exception = AppDatabaseException('No rows');
      final failure = mapExceptionToFailure(exception);

      expect(failure, isA<CacheFailure>());
      expect(failure.message, 'No rows');
    });

    test('maps AuthException → AuthFailure', () {
      const exception = AuthException('Invalid credentials');
      final failure = mapExceptionToFailure(exception);

      expect(failure, isA<AuthFailure>());
      expect(failure.message, 'Invalid credentials');
    });

    test('preserves default messages when no message is supplied', () {
      // Each AppException subtype has a default message; mapExceptionToFailure
      // threads e.message straight through to the matching Failure.
      expect(mapExceptionToFailure(const NetworkException()).message,
          'No internet connection');
      expect(
          mapExceptionToFailure(const ServerException()).message, 'Server error');
      expect(mapExceptionToFailure(const AuthException()).message,
          'Authentication error');
    });

    test('recursively maps an AppException cause into a Failure cause', () {
      // mimic a Firebase error whose cause is itself an AppException.
      // Subtypes take cause as a positional arg (see exceptions.dart).
      const inner = NetworkException('No internet connection');
      const outer = ServerException('Remote call failed', inner);

      final failure = mapExceptionToFailure(outer);

      expect(failure, isA<ServerFailure>());
      expect(failure.cause, isA<NetworkFailure>());
      expect(failure.cause!.message, 'No internet connection');
    });

    test('does not chain when cause is a non-AppException object', () {
      // cause is typed Object? — only AppException causes get mapped.
      const outer = ServerException('boom', 'a raw string');

      final failure = mapExceptionToFailure(outer);

      expect(failure, isA<ServerFailure>());
      expect(failure.cause, isNull);
    });
  });

  group('safeRepositoryCall', () {
    late Logger logger;

    setUp(() {
      logger = Logger('test');
    });

    test('passes the successful value through as Success', () async {
      final result = await safeRepositoryCall<int>(
        logger: logger,
        call: () async => 42,
      );

      expect(result, isA<Success<int>>());
      expect((result as Success<int>).value, 42);
    });

    test('maps NetworkException to Failed(NetworkFailure) by default',
        () async {
      final result = await safeRepositoryCall<int>(
        logger: logger,
        call: () async => throw const NetworkException('offline'),
      );

      expect(result, isA<Failed<int>>());
      expect((result as Failed<int>).failure, isA<NetworkFailure>());
    });

    test('maps ServerException to Failed(ServerFailure) by default', () async {
      final result = await safeRepositoryCall<int>(
        logger: logger,
        call: () async => throw const ServerException('500'),
      );

      expect(result, isA<Failed<int>>());
      expect((result as Failed<int>).failure, isA<ServerFailure>());
    });

    test('maps FirebaseFirestoreException to Failed(FirestoreFailure)',
        () async {
      final result = await safeRepositoryCall<int>(
        logger: logger,
        call: () async =>
            throw const FirebaseFirestoreException('permission-denied'),
      );

      expect(result, isA<Failed<int>>());
      expect((result as Failed<int>).failure, isA<FirestoreFailure>());
    });

    test('maps AppDatabaseException to Failed(CacheFailure)', () async {
      final result = await safeRepositoryCall<int>(
        logger: logger,
        call: () async => throw const AppDatabaseException('disk error'),
      );

      expect(result, isA<Failed<int>>());
      expect((result as Failed<int>).failure, isA<CacheFailure>());
    });

    test('maps AuthException to Failed(AuthFailure)', () async {
      final result = await safeRepositoryCall<int>(
        logger: logger,
        call: () async => throw const AuthException('bad credentials'),
      );

      expect(result, isA<Failed<int>>());
      expect((result as Failed<int>).failure, isA<AuthFailure>());
    });

    test('catches unexpected errors as Failed(UnknownFailure) with detail',
        () async {
      // A non-AppException throw is the safeRepositoryCall's catch-all bucket.
      final result = await safeRepositoryCall<int>(
        logger: logger,
        call: () async => throw StateError('unexpected!'),
      );

      expect(result, isA<Failed<int>>());
      final failure = (result as Failed<int>).failure;
      expect(failure, isA<UnknownFailure>());
      // The raw exception detail is preserved in the message (cause chain can't
      // hold Object?, per the Failure API — see guards.dart).
      expect(failure.message, contains('Bad state'));
      expect(failure.message, contains('unexpected!'));
    });

    test('invokes onNetworkError fallback when provided', () async {
      final result = await safeRepositoryCall<List<String>>(
        logger: logger,
        call: () async => throw const NetworkException(),
        onNetworkError: (e) async => const Success(<String>['cached']),
      );

      // The cache-fallback handler wins over the default Failed mapping.
      expect(result, isA<Success<List<String>>>());
      expect((result as Success<List<String>>).value, ['cached']);
    });

    test('invokes onServerError fallback when provided', () async {
      final result = await safeRepositoryCall<List<String>>(
        logger: logger,
        call: () async => throw const ServerException(),
        onServerError: (e) async => const Success(<String>['cached']),
      );

      expect(result, isA<Success<List<String>>>());
      expect((result as Success<List<String>>).value, ['cached']);
    });

    test('preserves cause fidelity through mapping (exception → Failure chain)',
        () async {
      // safeRepositoryCall must not flatten the cause when it converts an
      // AppException that carries its own AppException cause.
      final result = await safeRepositoryCall<int>(
        logger: logger,
        call: () async => throw const ServerException(
          'remote failed',
          NetworkException('offline'),
        ),
      );

      final failure = (result as Failed<int>).failure;
      expect(failure, isA<ServerFailure>());
      expect(failure.cause, isA<NetworkFailure>());
    });
  });
}

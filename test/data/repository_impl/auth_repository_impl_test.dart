import 'package:flutter_developers_guide/core/analytics/analytics_service.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/remote/dtos/auth_user_dto.dart';
import 'package:flutter_developers_guide/data/remote/auth_remote_data_source.dart';
import 'package:flutter_developers_guide/data/repository_impl/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

// --- Helpers ---
const tAuthUserDto = AuthUserDto(
  uid: 'uid-123',
  email: 'test@example.com',
  displayName: 'Test',
);

void main() {
  late MockAuthRemoteDataSource mockRemote;
  late MockAnalyticsService mockAnalytics;
  late AuthRepositoryImpl repository;

  setUp(() {
    mockRemote = MockAuthRemoteDataSource();
    mockAnalytics = MockAnalyticsService();

    // Analytics calls are fire-and-forget in the repository; default to success
    // so tests focus on the data path under test.
    when(() => mockAnalytics.setUserId(any())).thenAnswer((_) async {});
    when(() => mockAnalytics.logLogin()).thenAnswer((_) async {});
    when(() => mockAnalytics.logRegister()).thenAnswer((_) async {});
    when(() => mockAnalytics.logLogout()).thenAnswer((_) async {});

    repository = AuthRepositoryImpl(
      remoteDataSource: mockRemote,
      logger: Logger('test'),
      analytics: mockAnalytics,
    );
  });

  group('AuthRepositoryImpl.signIn', () {
    test('returns Success(AuthUser) and logs analytics when remote succeeds',
        () async {
      when(() => mockRemote.signIn(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => tAuthUserDto);

      final result = await repository.signIn(
        email: 'test@example.com',
        password: 'password',
      );

      expect(result, isA<Success>());
      final user = (result as Success).value;
      expect(user.uid, 'uid-123');
      expect(user.email, 'test@example.com');

      verify(() => mockAnalytics.setUserId('uid-123')).called(1);
      verify(() => mockAnalytics.logLogin()).called(1);
    });

    test('returns Failed(AuthFailure) when remote throws AuthException',
        () async {
      when(() => mockRemote.signIn(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(const AuthException('Invalid credentials'));

      final result = await repository.signIn(
        email: 'test@example.com',
        password: 'password',
      );

      expect(result, isA<Failed>());
      final failure = (result as Failed).failure;
      expect(failure, isA<AuthFailure>());
      expect(failure.message, 'Invalid credentials');

      // Analytics login must NOT fire when the remote call fails.
      verifyNever(() => mockAnalytics.logLogin());
    });

    test('returns Failed(NetworkFailure) when remote throws NetworkException',
        () async {
      when(() => mockRemote.signIn(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(const NetworkException('offline'));

      final result = await repository.signIn(
        email: 'test@example.com',
        password: 'password',
      );

      expect(result, isA<Failed>());
      expect((result as Failed).failure, isA<NetworkFailure>());
    });
  });

  group('AuthRepositoryImpl.register', () {
    test('returns Success(AuthUser) and logs analytics on success', () async {
      when(() => mockRemote.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => tAuthUserDto);

      final result = await repository.register(
        email: 'new@example.com',
        password: 'password',
      );

      expect(result, isA<Success>());
      verify(() => mockAnalytics.logRegister()).called(1);
    });

    test('returns Failed(AuthFailure) when remote throws AuthException',
        () async {
      when(() => mockRemote.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(const AuthException('email-already-in-use'));

      final result = await repository.register(
        email: 'new@example.com',
        password: 'password',
      );

      expect(result, isA<Failed>());
      expect((result as Failed).failure, isA<AuthFailure>());
    });
  });

  group('AuthRepositoryImpl.signOut', () {
    test('returns Success and re-establishes anonymous session on success',
        () async {
      when(() => mockRemote.signOut()).thenAnswer((_) async {});
      when(() => mockRemote.ensureAnonymousSession())
          .thenAnswer((_) async => tAuthUserDto);

      final result = await repository.signOut();

      expect(result, isA<Success>());
      verify(() => mockRemote.signOut()).called(1);
      verify(() => mockRemote.ensureAnonymousSession()).called(1);
      verify(() => mockAnalytics.logLogout()).called(1);
      verify(() => mockAnalytics.setUserId(null)).called(1);
    });

    test('returns Failed(ServerFailure) when signOut throws ServerException',
        () async {
      when(() => mockRemote.signOut())
          .thenThrow(const ServerException('boom'));

      final result = await repository.signOut();

      expect(result, isA<Failed>());
      expect((result as Failed).failure, isA<ServerFailure>());
      verifyNever(() => mockRemote.ensureAnonymousSession());
    });
  });

  group('AuthRepositoryImpl.ensureAnonymousSession', () {
    test('returns Success(AuthUser) when remote succeeds', () async {
      when(() => mockRemote.ensureAnonymousSession())
          .thenAnswer((_) async => tAuthUserDto);

      final result = await repository.ensureAnonymousSession();

      expect(result, isA<Success>());
      expect((result as Success).value.uid, 'uid-123');
    });

    test('returns Failed(AuthFailure) when remote throws AuthException',
        () async {
      when(() => mockRemote.ensureAnonymousSession())
          .thenThrow(const AuthException('anonymous-disabled'));

      final result = await repository.ensureAnonymousSession();

      expect(result, isA<Failed>());
      expect((result as Failed).failure, isA<AuthFailure>());
    });
  });

  group('AuthRepositoryImpl.authStateChanges', () {
    test('maps dtos from the remote stream to domain AuthUser (and null → null)',
        () async {
      when(() => mockRemote.authStateChanges()).thenAnswer(
        (_) => Stream.fromIterable([
          null,
          tAuthUserDto,
        ]),
      );

      final emitted = await repository.authStateChanges().toList();

      expect(emitted.length, 2);
      expect(emitted.first, isNull);
      expect(emitted.last, isNotNull);
      expect(emitted.last!.uid, 'uid-123');
    });
  });
}

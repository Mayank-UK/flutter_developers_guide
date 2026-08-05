import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/auth_user.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/auth_state_changes_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/register_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/sign_in_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/signout_use_case.dart';
import 'package:flutter_developers_guide/ui/blocs/auth/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockSignInUseCase extends Mock implements SignInUseCase {}

class MockRegisterUseCase extends Mock implements RegisterUseCase {}

class MockSignOutUseCase extends Mock implements SignOutUseCase {}

class MockAuthStateChangesUseCase extends Mock
    implements AuthStateChangesUseCase {}

void main() {
  late MockSignInUseCase mockSignIn;
  late MockRegisterUseCase mockRegister;
  late MockSignOutUseCase mockSignOut;
  late MockAuthStateChangesUseCase mockAuthStateChanges;

  final tUser = AuthUser(
    uid: 'uid-1',
    email: 'test@example.com',
    displayName: 'Test',
  );

  setUpAll(() {
    registerFallbackValue('');
  });

  setUp(() {
    mockSignIn = MockSignInUseCase();
    mockRegister = MockRegisterUseCase();
    mockSignOut = MockSignOutUseCase();
    mockAuthStateChanges = MockAuthStateChangesUseCase();

    // The bloc subscribes to this in its constructor — keep it quiet by default
    // so tests only observe states from the events they dispatch.
    when(() => mockAuthStateChanges())
        .thenAnswer((_) => const Stream<AuthUser?>.empty());
  });

  AuthBloc buildBloc() => AuthBloc(
        signInUseCase: mockSignIn,
        registerUseCase: mockRegister,
        signOutUseCase: mockSignOut,
        authStateChangesUseCase: mockAuthStateChanges,
      );

  group('AuthBloc — initial state', () {
    blocTest<AuthBloc, AuthState>(
      'initial state is AuthUnknown',
      build: buildBloc,
      act: (_) {},
      expect: () => [],
      verify: (bloc) => expect(bloc.state, isA<AuthUnknown>()),
    );
  });

  group('AuthBloc — AuthStatusChanged event', () {
    blocTest<AuthBloc, AuthState>(
      'emits AuthUnauthenticated when user is null',
      build: buildBloc,
      act: (bloc) => bloc.add(AuthStatusChanged(null)),
      expect: () => [isA<AuthUnauthenticated>()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits AuthAuthenticated(user) when user is non-null',
      build: buildBloc,
      act: (bloc) => bloc.add(AuthStatusChanged(tUser)),
      expect: () => [AuthAuthenticated(tUser)],
    );
  });

  group('AuthBloc — SignInRequested event', () {
    blocTest<AuthBloc, AuthState>(
      'emits AuthLoading then nothing else on success (auth stream takes over)',
      build: () {
        when(() => mockSignIn(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => Success(tUser));
        return buildBloc();
      },
      act: (bloc) => bloc.add(SignInRequested(
        email: 'test@example.com',
        password: 'password',
      )),
      expect: () => [isA<AuthLoading>()],
      verify: (_) {
        verify(() => mockSignIn(
              email: 'test@example.com',
              password: 'password',
            )).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits AuthError with AuthFailure on failed sign-in',
      build: () {
        when(() => mockSignIn(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => const Failed(AuthFailure('bad creds')));
        return buildBloc();
      },
      act: (bloc) => bloc.add(SignInRequested(
        email: 'test@example.com',
        password: 'password',
      )),
      expect: () => [
        isA<AuthLoading>(),
        predicate<AuthState>(
          (s) => s is AuthError && s.failure is AuthFailure,
          'AuthError with AuthFailure',
        ),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits AuthError on network failure',
      build: () {
        when(() => mockSignIn(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => const Failed(NetworkFailure()));
        return buildBloc();
      },
      act: (bloc) => bloc.add(SignInRequested(
        email: 'test@example.com',
        password: 'password',
      )),
      expect: () => [
        isA<AuthLoading>(),
        isA<AuthError>(),
      ],
    );
  });

  group('AuthBloc — RegisterRequested event', () {
    blocTest<AuthBloc, AuthState>(
      'emits AuthLoading then nothing else on success',
      build: () {
        when(() => mockRegister(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => Success(tUser));
        return buildBloc();
      },
      act: (bloc) => bloc.add(RegisterRequested(
        email: 'new@example.com',
        password: 'password',
      )),
      expect: () => [isA<AuthLoading>()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits AuthError on failed registration',
      build: () {
        when(() => mockRegister(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer(
            (_) async => const Failed(AuthFailure('email-already-in-use')));
        return buildBloc();
      },
      act: (bloc) => bloc.add(RegisterRequested(
        email: 'new@example.com',
        password: 'password',
      )),
      expect: () => [
        isA<AuthLoading>(),
        predicate<AuthState>(
          (s) => s is AuthError && s.failure is AuthFailure,
          'AuthError with AuthFailure',
        ),
      ],
    );
  });

  group('AuthBloc — SignOutRequested event', () {
    blocTest<AuthBloc, AuthState>(
      'emits nothing on success (auth stream emits null → AuthUnauthenticated)',
      build: () {
        when(() => mockSignOut()).thenAnswer((_) async => const Success(null));
        return buildBloc();
      },
      act: (bloc) => bloc.add(SignOutRequested()),
      expect: () => [],
      verify: (_) => verify(() => mockSignOut()).called(1),
    );

    blocTest<AuthBloc, AuthState>(
      'emits AuthError when sign-out fails',
      build: () {
        when(() => mockSignOut())
            .thenAnswer((_) async => const Failed(ServerFailure()));
        return buildBloc();
      },
      act: (bloc) => bloc.add(SignOutRequested()),
      expect: () => [
        predicate<AuthState>(
          (s) => s is AuthError && s.failure is ServerFailure,
          'AuthError with ServerFailure',
        ),
      ],
    );
  });
}

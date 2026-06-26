import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/auth_user.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/auth_state_changes_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/register_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/sign_in_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/auth/signout_use_case.dart';

// ─────────────────────────────────────────────
// Events
// ─────────────────────────────────────────────

sealed class AuthEvent {}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested({
    required this.email,
    required this.password,
  });
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;

  RegisterRequested({
    required this.email,
    required this.password,
  });
}

class SignOutRequested extends AuthEvent {}

class AuthStatusChanged extends AuthEvent {
  final AuthUser? user;

  AuthStatusChanged(this.user);
}

// ─────────────────────────────────────────────
// States
// ─────────────────────────────────────────────

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthUnknown extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final AuthUser user;

  const AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final Failure failure;

  const AuthError(this.failure);

  @override
  List<Object?> get props => [failure];
}

// ─────────────────────────────────────────────
// BLoC
// ─────────────────────────────────────────────

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final RegisterUseCase registerUseCase;
  final SignOutUseCase signOutUseCase;
  final AuthStateChangesUseCase authStateChangesUseCase;

  late final StreamSubscription<AuthUser?> _authSubscription;

  AuthBloc({
    required this.signInUseCase,
    required this.registerUseCase,
    required this.signOutUseCase,
    required this.authStateChangesUseCase,
  }) : super(AuthUnknown()) {
    _authSubscription = authStateChangesUseCase().listen(
      (user) => add(AuthStatusChanged(user)),
    );

    on<AuthStatusChanged>(_onAuthStatusChanged);
    on<SignInRequested>(_onSignInRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  void _onAuthStatusChanged(
    AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) {
    if (event.user == null) {
      emit(AuthUnauthenticated());
    } else {
      emit(AuthAuthenticated(event.user!));
    }
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await signInUseCase(
      email: event.email,
      password: event.password,
    );

    switch (result) {
      case Success():
        // Firebase auth stream will emit the user.
        break;

      case Failed(failure: final failure):
        emit(AuthError(failure));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await registerUseCase(
      email: event.email,
      password: event.password,
    );

    switch (result) {
      case Success():
        // Firebase auth stream will emit the user.
        break;

      case Failed(failure: final failure):
        emit(AuthError(failure));
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await signOutUseCase();

    // No emit here.
    // Firebase auth stream will emit null,
    // which triggers AuthUnauthenticated.
  }

  @override
  Future<void> close() async {
    await _authSubscription.cancel();
    return super.close();
  }
}

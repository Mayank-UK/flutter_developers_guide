import 'package:flutter_developers_guide/core/scenario/api_scenario.dart';
import 'package:flutter_developers_guide/data/remote/auth_remote_data_source.dart';
import 'package:flutter_developers_guide/data/remote/dtos/auth_user_dto.dart';
import 'package:flutter_developers_guide/data/remote/fake_api_simulator.dart';

/// Single-responsibility fake of [AuthRemoteDataSource]. Replaces the auth
/// slice of the former `FakeApiService` god-fake; simulation mechanics are
/// shared via [FakeApiSimulator].
class FakeAuthRemoteDataSource
    with FakeApiSimulator
    implements AuthRemoteDataSource {
  @override
  final ApiScenario scenario;

  FakeAuthRemoteDataSource({required this.scenario});

  final _authUser = AuthUserDto(
    email: 'test@gmail.com',
    uid: '14345634',
    displayName: 'test',
  );

  @override
  Future<AuthUserDto> signIn({
    required String email,
    required String password,
  }) =>
      simulate(() => _authUser);

  @override
  Future<AuthUserDto> register({
    required String email,
    required String password,
  }) =>
      simulate(() => _authUser);

  @override
  Future<AuthUserDto> ensureAnonymousSession() => simulate(() => _authUser);

  @override
  Stream<AuthUserDto?> authStateChanges() => Stream.value(_authUser);

  @override
  Future<void> signOut() async {}
}

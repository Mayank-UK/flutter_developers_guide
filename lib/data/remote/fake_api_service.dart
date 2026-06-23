// lib/core/testing/fake_api_service.dart
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/data/remote/dtos/auth_user_dto.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';

enum ApiScenario { success, networkError, timeout, serverError, invalidJson }

class FakeApiService implements ApiService {
  ApiScenario scenario;

  FakeApiService({
    this.scenario = ApiScenario.success,
  });

  Future<T> _simulate<T>(T Function() onSuccess) async {
    await Future.delayed(const Duration(milliseconds: 600));

    switch (scenario) {
      case ApiScenario.success:
        return onSuccess();

      case ApiScenario.networkError:
        throw const NetworkException();

      case ApiScenario.timeout:
        throw const NetworkException(
          'Simulated request timed out',
        );

      case ApiScenario.serverError:
        throw const ServerException(
          'Simulated server returned 500',
        );

      case ApiScenario.invalidJson:
        throw const ServerException(
          'Simulated invalid response format',
        );
    }
  }

  @override
  Future<AuthUserDto> signIn({
    required String email,
    required String password,
  }) {
    return _simulate(
      () => AuthUserDto(
        email: 'test@gmail.com',
        uid: '14345634',
        displayName: 'test',
      ),
    );
  }

  @override
  Future<AuthUserDto> register({
    required String email,
    required String password,
  }) {
    return _simulate(
      () => AuthUserDto(
        email: 'test@gmail.com',
        uid: '14345634',
        displayName: 'test',
      ),
    );
  }

  @override
  Stream<AuthUserDto?> authStateChanges() {
    return Stream.value(
      AuthUserDto(
        email: 'test@gmail.com',
        uid: '14345634',
        displayName: 'test',
      ),
    );
  }

  @override
  Future<void> signOut() async {}

  @override
  Future<List<PostDTO>> getPosts() {
    return _simulate(
      () => [
        PostDTO(
          id: 1,
          title: 'Fake post',
          body: 'From fake API',
        ),
      ],
    );
  }
}

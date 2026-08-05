import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/scenario/api_scenario.dart';

/// Shared latency + failure-injection mechanics for the single-responsibility
/// fake remote data sources. Each fake composes this mixin so the simulated
/// scenario (success/network/timeout/server/invalidJson) behavior stays
/// identical across the auth, post, todo and image fakes — preserving the
/// original `FakeApiService._simulate` contract after the god-fake split.
mixin FakeApiSimulator {
  ApiScenario get scenario;

  Future<T> simulate<T>(T Function() onSuccess) async {
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
}

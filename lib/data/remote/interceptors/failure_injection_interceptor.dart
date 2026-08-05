import 'package:dio/dio.dart';
import 'package:flutter_developers_guide/core/scenario/api_scenario.dart';

/// Dev-only Dio [Interceptor] that injects API failures on the client side, in
/// front of the **real** Dio client. It throws or fabricates the same
/// [DioException]s / [Response]s a real failing network would, so the app's
/// `guardedApiCall` (see [lib/core/error_handling/guards.dart]) maps them
/// exactly as it would in production — no fake service required for REST.
///
/// Edit [scenario] below to pick a path (success / network error / timeout /
/// server error / invalid JSON). Because it is mutable, it can also be flipped
/// at runtime from a debug menu.
///
/// Mirrors Android's `data/remote/FailureInjectionInterceptor`.
class FailureInjectionInterceptor extends Interceptor {
  ApiScenario scenario;

  FailureInjectionInterceptor({
    required this.scenario,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    switch (scenario) {
      case ApiScenario.success:
        // Proceed to the real API.
        handler.next(options);

      case ApiScenario.networkError:
        handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.connectionError,
            message: 'Simulated network error (no connection)',
          ),
          true,
        );

      case ApiScenario.timeout:
        handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.connectionTimeout,
            message: 'Simulated request timeout',
          ),
          true,
        );

      case ApiScenario.serverError:
        // Fabricate a 500 response. `guardedApiCall` maps the resulting
        // `DioExceptionType.badResponse` to a [ServerException].
        handler.resolve(
          _fakeResponse(
            options,
            code: 500,
            body: 'Simulated server error',
          ),
          true,
        );

      case ApiScenario.invalidJson:
        // Fabricate a 200 response with a malformed body. Downstream
        // `PostDto.fromJson` will throw, which `guardedApiCall` maps to a
        // [ServerException] (invalid response format).
        handler.resolve(
          _fakeResponse(
            options,
            code: 200,
            body: '{{invalid-json',
            contentType: Headers.jsonContentType,
          ),
          true,
        );
    }
  }

  Response<dynamic> _fakeResponse(
    RequestOptions options, {
    required int code,
    required String body,
    String contentType = Headers.textPlainContentType,
  }) {
    return Response<dynamic>(
      requestOptions: options,
      statusCode: code,
      statusMessage: 'Simulated',
      data: body,
      headers: Headers.fromMap({
        Headers.contentTypeHeader: [contentType],
      }),
    );
  }
}

import 'package:dio/dio.dart';

/// Dio [Interceptor] that retries transient failures with linear backoff
/// before letting the error propagate to `guardedApiCall`.
///
/// Transient conditions:
/// - [DioExceptionType.connectionTimeout] / [DioExceptionType.sendTimeout] /
///   [DioExceptionType.receiveTimeout] / [DioExceptionType.connectionError]
/// - [DioExceptionType.badResponse] with an HTTP status in the `500..599` range
///
/// The attempt count is tracked on `RequestOptions.extra[_retryKey]`. After
/// [maxRetries] attempts, the error is forwarded unchanged so the app's error
/// handling maps it as usual.
///
/// Because an interceptor needs the owning [Dio] to re-enqueue a request, call
/// [attach] immediately after adding this interceptor to the [Dio] instance.
/// Retries then flow through the full interceptor chain (auth headers, etc.).
class RetryInterceptor extends Interceptor {
  static const String _retryKey = '__retry_attempt';

  final int maxRetries;
  final Duration baseDelay;

  Dio? _dio;

  RetryInterceptor({
    this.maxRetries = 2,
    this.baseDelay = const Duration(milliseconds: 300),
  });

  /// Bind the owning [Dio] so retries can be re-enqueued. Call this right after
  /// `dio.interceptors.add(retryInterceptor)`.
  void attach(Dio dio) => _dio = dio;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final attempt = (err.requestOptions.extra[_retryKey] as int?) ?? 0;
    final dio = _dio;

    if (dio == null || !_isTransient(err) || attempt >= maxRetries) {
      handler.next(err);
      return;
    }

    err.requestOptions.extra[_retryKey] = attempt + 1;

    // Linear backoff: baseDelay * (attempt + 1).
    await Future<void>.delayed(baseDelay * (attempt + 1));

    try {
      final response = await dio.fetch(err.requestOptions);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    } catch (e) {
      handler.next(err);
    }
  }

  bool _isTransient(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return true;
      case DioExceptionType.badResponse:
        final code = err.response?.statusCode ?? 0;
        return code >= 500 && code <= 599;
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        return false;
    }
  }
}

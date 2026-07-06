import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Dio [Interceptor] that attaches common headers and the current Firebase auth
/// token to every outgoing request.
///
/// - Always sets `Accept: application/json`.
/// - When a user is signed in, attaches `Authorization: Bearer <idToken>`.
///   When there is no current user (e.g. dev with fake auth, or signed-out),
///   the header is skipped gracefully rather than failing the request.
///
/// This is a demonstrator of the auth-header pattern; jsonplaceholder does not
/// require auth, but real backends typically do.
class AuthTokenInterceptor extends Interceptor {
  final FirebaseAuth firebaseAuth;

  AuthTokenInterceptor({
    required this.firebaseAuth,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.putIfAbsent(Headers.acceptHeader, () => Headers.jsonContentType);

    final token = await firebaseAuth.currentUser?.getIdToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}

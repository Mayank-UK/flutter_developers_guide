import 'package:flutter_developers_guide/core/analytics/analytics_service.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/domain/models/auth_user.dart';
import 'package:flutter_developers_guide/domain/repository/auth_repository.dart';
import 'package:logging/logging.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService remoteDataSource;
  final Logger logger;
  final AnalyticsService analytics;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.logger,
    required this.analytics,
  });

  @override
  Future<Result<AuthUser>> signIn({
    required String email,
    required String password,
  }) =>
      safeRepositoryCall(
        logger: logger,
        call: () async {
          final dto = await remoteDataSource.signIn(
            email: email,
            password: password,
          );

          await analytics.setUserId(
            dto.uid,
          );

          await analytics.logLogin();

          return dto.toAuthUser();
        },
        // Auth has no cache fallback — no onNetworkError / onServerError handlers.
        // safeRepositoryCall will map exceptions to failures automatically.
      );

  @override
  Future<Result<AuthUser>> register({
    required String email,
    required String password,
  }) =>
      safeRepositoryCall(
        logger: logger,
        call: () async {
          final dto = await remoteDataSource.register(
            email: email,
            password: password,
          );

          await analytics.setUserId(
            dto.uid,
          );

          await analytics.logRegister();

          return dto.toAuthUser();
        },
      );

  @override
  Stream<AuthUser?> authStateChanges() {
    return remoteDataSource.authStateChanges().map(
          (dto) => dto?.toAuthUser(),
        );
  }

  @override
  Future<void> signOut() async {
    await analytics.logLogout();

    await analytics.setUserId(
      null,
    );

    return remoteDataSource.signOut();
  }
}

import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/data/remote/post_remote_data_source.dart';
import 'package:flutter_developers_guide/domain/models/post.dart';
import 'package:flutter_developers_guide/domain/repository/post_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final AppDatabase localDataSource;
  final Logger logger;

  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.logger,
  });

  @override
  Future<Result<List<Post>>> getPosts() async {
    Future<Result<List<Post>>> _cachedPostsResult(AppException cause) async {
      logger.warning(
        'Remote fetch failed (${cause.runtimeType}), falling back to cache',
      );

      try {
        final localPosts = await localDataSource.getPosts();
        return Success(localPosts.map((dto) => dto.toPost()).toList());
      } on AppDatabaseException catch (e) {
        final originalFailure = mapExceptionToFailure(cause);

        // Link them up here by passing originalFailure into the cause parameter
        final chained = CacheFailure(e.message, originalFailure);

        logger.severe('Cache fallback also failed:\n${chained.chain}');
        return Failed(chained);
      }
    }

    return safeRepositoryCall(
      logger: logger,
      call: () async {
        final remotePosts = await remoteDataSource.getPosts();
        try {
          await localDataSource.insertPosts(remotePosts);
        } catch (e, st) {
          logger.warning('Failed to cache posts', e, st);
        }
        return remotePosts.map((dto) => dto.toPost()).toList();
      },
      onNetworkError: _cachedPostsResult,
      onServerError: _cachedPostsResult,
    );
  }
}

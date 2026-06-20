import 'package:flutter_developers_guide/core/exceptions.dart';
import 'package:flutter_developers_guide/core/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/domain/models/post.dart';
import 'package:flutter_developers_guide/domain/repository/post_repository.dart';
import 'package:logging/logging.dart';

class PostRepositoryImpl implements PostRepository {
  final ApiService remoteDataSource;
  final AppDatabase localDataSource;
  final Logger logger;

  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.logger,
  });

  Failure _mapToFailure(AppException e) => switch (e) {
        NetworkException() => NetworkFailure(e.message),
        ServerException() => ServerFailure(e.message),
        AppDatabaseException() => CacheFailure(e.message),
      };

  @override
  Future<Result<List<Post>>> getPosts() async {
    Future<Result<List<Post>>> _cachedPostsResult() async {
      try {
        final localPosts = await localDataSource.getPosts();

        return Success(
          localPosts.map((dto) => dto.toPost()).toList(),
        );
      } on AppDatabaseException catch (e) {
        return Failed(CacheFailure(e.message));
      } catch (_) {
        return const Failed(
          UnknownFailure(),
        );
      }
    }

    try {
      final remotePosts = await remoteDataSource.getPosts();

      /* 
        Why have nested try/catch block when it's already inside the try block?

        The reason is the behaviour of the execution, when put directly outside and in main try block, if
        localDatabase fails then it will still throw an error, so we put it inside it's own nested try block,
        so even if there is an exception it won't show error to the user
      */
      try {
        await localDataSource.insertPosts(remotePosts);
      } catch (e, st) {
        logger.warning('Failed to cache posts', e, st);
      }

      return Success(remotePosts.map((dto) => dto.toPost()).toList());
    }
    // repository contains these exceptions other than apiService because it decides what to do when data fails,
    // this work is not part of apiService
    on NetworkException catch (_) {
      // If the ApiService throws network exception then repository will provide cached data
      // At this stage, an exception is converted into a failure and will be handled alternatively
      return _cachedPostsResult();
    } on ServerException catch (_) {
      return _cachedPostsResult();
    } on AppException catch (e) {
      return Failed(_mapToFailure(e));
    } catch (e, st) {
      logger.severe('Unexpected error fetching posts', e, st);
      return const Failed(UnknownFailure());
    }
  }
}

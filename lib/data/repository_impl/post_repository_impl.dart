import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/domain/models/post.dart';
import 'package:flutter_developers_guide/domain/repository/post_repository.dart';
import 'package:sqflite/sqflite.dart';

class PostRepositoryImpl implements PostRepository {
  final ApiService remoteDataSource;
  final AppDatabase localDataSource;

  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Post>> getPosts() async {
    try {
      final remotePosts = await remoteDataSource.getPosts();
      await localDataSource.insertPosts(remotePosts);
      return remotePosts.map((dto) => dto.toPost()).toList();
    } catch (e) {
      try {
        final localPosts = await localDataSource.getPosts();
        return localPosts.map((dto) => dto.toPost()).toList();
      } on DatabaseException {
        throw RepositoryException(
            'Failed to fetch posts from both remote and local sources');
      }
    }
  }
}

class RepositoryException implements Exception {
  final String message;
  RepositoryException(this.message);
  @override
  String toString() => 'RepositoryException: $message';
}

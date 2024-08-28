import 'package:flutter_developers_guide/domain/models/post.dart';
import 'package:flutter_developers_guide/domain/repository/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<Post>> call() async {
    try {
      return await repository.getPosts();
    } catch (e) {
      throw UseCaseException('Failed to get posts: $e');
    }
  }
}

class UseCaseException implements Exception {
  final String message;
  UseCaseException(this.message);
  @override
  String toString() => 'UseCaseException: $message';
}

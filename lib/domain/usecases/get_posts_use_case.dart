import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/post.dart';
import 'package:flutter_developers_guide/domain/repository/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;
  GetPostsUseCase(this.repository);

  Future<Result<List<Post>>> call() => repository.getPosts();
}

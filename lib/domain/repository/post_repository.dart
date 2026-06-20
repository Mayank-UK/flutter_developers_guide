import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/post.dart';

abstract class PostRepository {
  Future<Result<List<Post>>> getPosts();
}

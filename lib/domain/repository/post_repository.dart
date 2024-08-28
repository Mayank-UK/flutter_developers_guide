import 'package:flutter_developers_guide/domain/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}

import 'package:dio/dio.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';

abstract class PostRemoteDataSource {
  Future<List<PostDto>> getPosts();
}

class JsonPlaceholderPostRemoteDataSource implements PostRemoteDataSource {
  final Dio dio;

  JsonPlaceholderPostRemoteDataSource({
    required this.dio,
  });

  @override
  Future<List<PostDto>> getPosts() => guardedApiCall(
        () async {
          final response = await dio.get('/posts');

          if (response.statusCode != 200) {
            throw ServerException(
              'Server returned ${response.statusCode}',
            );
          }

          final jsonList = response.data as List<dynamic>;

          return jsonList
              .map(
                (json) => PostDto.fromJson(
                  json as Map<String, dynamic>,
                ),
              )
              .toList();
        },
      );
}

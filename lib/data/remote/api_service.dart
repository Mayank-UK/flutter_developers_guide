import 'dart:convert';
import 'dart:io';
import 'package:flutter_developers_guide/core/exceptions.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:http/http.dart' as http;

abstract class ApiService {
  Future<List<PostDTO>> getPosts();
}

class ApiServiceImpl implements ApiService {
  final http.Client client;
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  ApiServiceImpl({required this.client});

  @override
  Future<List<PostDTO>> getPosts() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/posts'),
      );

      // to handle server responses other than status 200
      if (response.statusCode != 200) {
        throw ServerException(
          'Server returned ${response.statusCode}',
        );
      }

      final List<dynamic> jsonList = json.decode(response.body);

      return jsonList.map((json) => PostDTO.fromJson(json)).toList();
    } on SocketException {
      // this is thrown so that repository can catch it and show cached data from the database
      throw NetworkException();
    }
  }
}

import 'dart:convert';
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
    final response = await client.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => PostDTO.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}

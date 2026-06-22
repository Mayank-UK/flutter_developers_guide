import 'dart:async';
import 'dart:convert';
import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

abstract class ApiService {
  Future<List<PostDTO>> getPosts();
}

class ApiServiceImpl implements ApiService {
  final http.Client client;
  final AppConfig config;
  final Logger logger;

  ApiServiceImpl({
    required this.client,
    required this.config,
    required this.logger,
  });

  @override
  Future<List<PostDTO>> getPosts() => guardedApiCall(
        () async {
          logger.info('GET ${config.baseUrl}/posts');

          final response = await client.get(Uri.parse('${config.baseUrl}/posts')).timeout(
                const Duration(seconds: 10),
              );

          logger.info('Response status: ${response.statusCode}');
          logger.info('Response body: ${response.body}');

          if (response.statusCode != 200) {
            logger.warning('Network error while fetching posts');

            throw ServerException('Server returned ${response.statusCode}');
          }

          final List<dynamic> jsonList = json.decode(response.body);
          return jsonList.map((json) => PostDTO.fromJson(json)).toList();
        },
      );
}

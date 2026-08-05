import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:logging/logging.dart';
import 'package:sqflite/sqflite.dart';

class PostDAO {
  final Database _database;
  final Logger _logger;

  PostDAO({
    required Database database,
    required Logger logger,
  })  : _database = database,
        _logger = logger;

  Future<void> insertPost(PostDto post) async {
    try {
      await _database.insert(
        'posts',
        post.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e, st) {
      _logger.warning('Failed to insert post', e, st);
      throw AppDatabaseException('Failed to insert post: $e');
    }
  }

  Future<List<PostDto>> getAllPosts() async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query('posts');
      return List.generate(maps.length, (i) {
        return PostDto.fromJson(maps[i]);
      });
    } catch (e, st) {
      _logger.warning('Failed to get posts', e, st);
      throw AppDatabaseException('Failed to get posts: $e');
    }
  }

  Future<PostDto?> getPost(int id) async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query(
        'posts',
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isNotEmpty) {
        return PostDto.fromJson(maps.first);
      }
      return null;
    } catch (e, st) {
      _logger.warning('Failed to get post $id', e, st);
      throw AppDatabaseException('Failed to get post: $e');
    }
  }
}

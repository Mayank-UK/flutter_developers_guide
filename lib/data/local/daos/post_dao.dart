import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
  @override
  String toString() => 'DatabaseException: $message';
}

class PostDAO {
  final Database _database;

  PostDAO({required Database database}) : _database = database;

  Future<void> insertPost(PostDTO post) async {
    try {
      await _database.insert(
        'posts',
        post.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e, stackTrace) {
      print('Error inserting post: $e');
      print(stackTrace);
      throw DatabaseException('Failed to insert post: $e');
    }
  }

  Future<List<PostDTO>> getAllPosts() async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query('posts');
      return List.generate(maps.length, (i) {
        return PostDTO.fromJson(maps[i]);
      });
    } catch (e, stackTrace) {
      print('Error getting posts: $e');
      print(stackTrace);
      throw DatabaseException('Failed to get posts: $e');
    }
  }

  Future<PostDTO?> getPost(int id) async {
    try {
      final List<Map<String, dynamic>> maps = await _database.query(
        'posts',
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isNotEmpty) {
        return PostDTO.fromJson(maps.first);
      }
      return null;
    } catch (e, stackTrace) {
      print('Error getting post: $e');
      print(stackTrace);
      throw DatabaseException('Failed to get post: $e');
    }
  }
}

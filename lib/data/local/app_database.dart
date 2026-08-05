import 'dart:async';

import 'package:flutter_developers_guide/data/local/daos/post_dao.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class AppDatabase {
  Future<void> insertPosts(List<PostDto> posts);
  Future<List<PostDto>> getPosts();
}

class DatabaseProvider {
  static const String _databaseName = 'app_database.db';
  static const int _databaseVersion = 1;

  // Completer-based init guard: the first caller opens the DB and completes
  // the future; any concurrent caller awaits the same future instead of
  // racing into a second `openDatabase` call. Only `bootstrapApp` should
  // trigger this in practice, but the guard makes the cache thread-safe.
  static Completer<Database>? _initCompleter;

  static Future<Database> get database async {
    if (_initCompleter != null) return _initCompleter!.future;
    _initCompleter = Completer<Database>();
    try {
      final db = await _initDatabase();
      _initCompleter!.complete(db);
      return db;
    } catch (e, st) {
      _initCompleter!.completeError(e, st);
      // Allow a future attempt to retry from a clean slate.
      _initCompleter = null;
      rethrow;
    }
  }

  static Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        onCreate: _onCreate, version: _databaseVersion);
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE posts(id INTEGER PRIMARY KEY, title TEXT, body TEXT)');
  }
}

class AppDatabaseImpl implements AppDatabase {
  final PostDAO _postDAO;

  AppDatabaseImpl({required PostDAO postDAO}) : _postDAO = postDAO;

  @override
  Future<void> insertPosts(List<PostDto> posts) async {
    for (var post in posts) {
      await _postDAO.insertPost(post);
    }
  }

  @override
  Future<List<PostDto>> getPosts() async {
    return await _postDAO.getAllPosts();
  }
}

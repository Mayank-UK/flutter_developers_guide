import 'package:flutter_developers_guide/data/local/daos/post_dao.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class AppDatabase {
  Future<void> insertPosts(List<PostDTO> posts);
  Future<List<PostDTO>> getPosts();
}

class AppDatabaseImpl implements AppDatabase {
  final PostDAO _postDAO;

  AppDatabaseImpl({required PostDAO postDAO}) : _postDAO = postDAO;

  @override
  Future<void> insertPosts(List<PostDTO> posts) async {
    for (var post in posts) {
      await _postDAO.insertPost(post);
    }
  }

  @override
  Future<List<PostDTO>> getPosts() async {
    return await _postDAO.getAllPosts();
  }
}

class DatabaseProvider {
  static const String _databaseName = 'app_database.db';
  static const int _databaseVersion = 1;

  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
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

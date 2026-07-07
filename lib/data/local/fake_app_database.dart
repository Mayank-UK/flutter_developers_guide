import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/data/local/app_database.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';

enum DbScenario { success, empty, readError, writeError }

// Just make it for a single feature to test the DB functionality at least once, do not maintain it for all the features

class FakeAppDatabase implements AppDatabase {
  DbScenario scenario;
  List<PostDTO> _cache = [];

  FakeAppDatabase({
    this.scenario = DbScenario.success,
  });

  Future<T> _simulateRead<T>(T Function() operation) async {
    switch (scenario) {
      case DbScenario.success:
      case DbScenario.writeError:
        return operation();

      case DbScenario.empty:
        if (T == List<PostDTO>) {
          return [] as T;
        }
        return operation();

      case DbScenario.readError:
        throw const AppDatabaseException(
          'Simulated DB read error',
        );
    }
  }

  Future<void> _simulateWrite(void Function() operation) async {
    if (scenario == DbScenario.writeError) {
      throw const AppDatabaseException(
        'Simulated DB write error',
      );
    }

    operation();
  }

  @override
  Future<List<PostDTO>> getPosts() {
    return _simulateRead(() => _cache);
  }

  @override
  Future<void> insertPosts(List<PostDTO> posts) {
    return _simulateWrite(() {
      _cache = List.of(posts);
    });
  }
}

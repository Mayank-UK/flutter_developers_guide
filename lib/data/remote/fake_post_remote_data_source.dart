import 'package:flutter_developers_guide/core/scenario/api_scenario.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:flutter_developers_guide/data/remote/fake_api_simulator.dart';
import 'package:flutter_developers_guide/data/remote/post_remote_data_source.dart';

/// Single-responsibility fake of [PostRemoteDataSource]. Replaces the post
/// slice of the former `FakeApiService` god-fake; simulation mechanics are
/// shared via [FakeApiSimulator].
class FakePostRemoteDataSource
    with FakeApiSimulator
    implements PostRemoteDataSource {
  @override
  final ApiScenario scenario;

  FakePostRemoteDataSource({required this.scenario});

  final List<PostDto> _posts = [
    PostDto(
      id: 1,
      title: 'Fake post',
      body: 'From fake API',
    ),
  ];

  @override
  Future<List<PostDto>> getPosts() => simulate(() => _posts);
}

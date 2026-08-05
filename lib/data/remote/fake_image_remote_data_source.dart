import 'dart:io';

import 'package:flutter_developers_guide/core/scenario/api_scenario.dart';
import 'package:flutter_developers_guide/data/remote/dtos/image_item_dto.dart';
import 'package:flutter_developers_guide/data/remote/fake_api_simulator.dart';
import 'package:flutter_developers_guide/data/remote/image_remote_data_source.dart';

/// Single-responsibility fake of [ImageRemoteDataSource]. Replaces the image
/// slice of the former `FakeApiService` god-fake; simulation mechanics are
/// shared via [FakeApiSimulator]. Unlike the original god-fake, every method
/// (including [watchImages], [uploadImage] and [deleteImage]) routes through
/// `simulate` so the image feature gains the same latency/failure-injection
/// parity as auth/post/todo. State semantics are preserved: `watchImages`
/// still emits an empty collection (the prior behavior) and uploads do not
/// accumulate — the focus of Fix 2 is simulation parity, not new state.
class FakeImageRemoteDataSource
    with FakeApiSimulator
    implements ImageRemoteDataSource {
  @override
  final ApiScenario scenario;

  FakeImageRemoteDataSource({required this.scenario});

  @override
  Stream<List<ImageItemDto>> watchImages() async* {
    // Respect simulated latency before emitting, mirroring the await-delay
    // gate the other fakes apply to every call.
    yield await simulate(() => <ImageItemDto>[]);
  }

  @override
  Future<ImageItemDto> uploadImage(File file, String userId) {
    return simulate(
      () => ImageItemDto(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        url: 'https://picsum.photos/200',
        fileName: file.path.split('/').last,
        uploadedAt: DateTime.now(),
      ),
    );
  }

  @override
  Future<void> deleteImage(String id, String fileName, String userId) {
    return simulate(() {});
  }
}

import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/image_item.dart';
import 'package:flutter_developers_guide/domain/repository/image_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchImagesUseCase {
  final ImageRepository repository;
  WatchImagesUseCase(this.repository);

  Stream<Result<List<ImageItem>>> call() => repository.watchImages();
}

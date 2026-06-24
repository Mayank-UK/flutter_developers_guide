import 'dart:io';

import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/image_item.dart';

abstract class ImageRepository {
  Stream<Result<List<ImageItem>>> watchImages();
  Future<Result<ImageItem>> uploadImage(File file, String userId);
  Future<Result<void>> deleteImage(String id, String fileName, String userId);
}

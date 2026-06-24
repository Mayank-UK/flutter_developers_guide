import 'dart:async';
import 'dart:io';

import 'package:flutter_developers_guide/core/analytics/analytics_service.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/domain/models/image_item.dart';
import 'package:flutter_developers_guide/domain/repository/image_repository.dart';
import 'package:logging/logging.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ApiService remoteDataSource;
  final Logger logger;
  final AnalyticsService analytics;

  ImageRepositoryImpl({
    required this.remoteDataSource,
    required this.logger,
    required this.analytics,
  });

  @override
  Stream<Result<List<ImageItem>>> watchImages() {
    final controller = StreamController<Result<List<ImageItem>>>();

    remoteDataSource
        .watchImages()
        .map<Result<List<ImageItem>>>(
          (dtos) => Success(dtos.map((d) => d.toImageItem()).toList()),
        )
        .listen(
      controller.add,
      onError: (Object e, StackTrace st) {
        logger.severe('Image stream error', e, st);
        final failure = e is AppException ? mapExceptionToFailure(e) : UnknownFailure(e.toString());
        controller.add(Failed(failure));
      },
      onDone: controller.close,
    );

    return controller.stream;
  }

  @override
  Future<Result<ImageItem>> uploadImage(File file, String userId) => safeRepositoryCall(
        logger: logger,
        call: () async {
          final dto = await remoteDataSource.uploadImage(file, userId);
          await analytics.logImageUploaded();
          return dto.toImageItem();
        },
      );

  @override
  Future<Result<void>> deleteImage(String id, String fileName, String userId) => safeRepositoryCall(
      logger: logger,
      call: () async {
        await remoteDataSource.deleteImage(id, fileName, userId);
        await analytics.logImageDeleted();
      });
}

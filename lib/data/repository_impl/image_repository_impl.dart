import 'dart:io';

import 'package:flutter_developers_guide/core/analytics/analytics_service.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/data/remote/image_remote_data_source.dart';
import 'package:flutter_developers_guide/domain/models/image_item.dart';
import 'package:flutter_developers_guide/domain/repository/image_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@LazySingleton(as: ImageRepository)
class ImageRepositoryImpl implements ImageRepository {
  final ImageRemoteDataSource remoteDataSource;
  final Logger logger;
  final AnalyticsService analytics;

  ImageRepositoryImpl({
    required this.remoteDataSource,
    required this.logger,
    required this.analytics,
  });

  @override
  Stream<Result<List<ImageItem>>> watchImages() async* {
    try {
      await for (final dtos in remoteDataSource.watchImages()) {
        yield Success(dtos.map((d) => d.toImageItem()).toList());
      }
    } catch (e, st) {
      logger.severe('Image stream error', e, st);
      final failure = e is AppException
          ? mapExceptionToFailure(e)
          : UnknownFailure(e.toString());
      yield Failed(failure);
    }
  }

  @override
  Future<Result<ImageItem>> uploadImage(File file, String userId) =>
      safeRepositoryCall(
        logger: logger,
        call: () async {
          final dto = await remoteDataSource.uploadImage(file, userId);
          await analytics.logImageUploaded();
          return dto.toImageItem();
        },
      );

  @override
  Future<Result<void>> deleteImage(String id, String fileName, String userId) =>
      safeRepositoryCall(
          logger: logger,
          call: () async {
            await remoteDataSource.deleteImage(id, fileName, userId);
            await analytics.logImageDeleted();
          });
}

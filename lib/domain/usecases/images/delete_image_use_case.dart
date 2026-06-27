import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/repository/image_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteImageUseCase {
  final ImageRepository repository;
  DeleteImageUseCase(this.repository);

  Future<Result<void>> call(String id, String fileName, String userId) => repository.deleteImage(id, fileName, userId);
}

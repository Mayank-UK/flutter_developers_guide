import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/data/remote/dtos/image_item_dto.dart';

abstract class ImageRemoteDataSource {
  Stream<List<ImageItemDto>> watchImages();

  Future<ImageItemDto> uploadImage(File file, String userId);

  Future<void> deleteImage(String id, String fileName, String userId);
}

class FirebaseStorageImageRemoteDataSource implements ImageRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  FirebaseStorageImageRemoteDataSource({
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });

  CollectionReference<Map<String, dynamic>> get _imagesCollection =>
      firebaseFirestore.collection('images');

  @override
  Stream<List<ImageItemDto>> watchImages() {
    return guardedStream(
      _imagesCollection
          .orderBy('uploadedAt', descending: true)
          .snapshots(),
    ).map((snapshot) => snapshot.docs
        .map((doc) => ImageItemDto.fromJson(doc.id, doc.data()))
        .toList());
  }

  @override
  Future<ImageItemDto> uploadImage(File file, String userId) =>
      guardedApiCall(() async {
        final fileName =
            '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';

        final storageRef =
            firebaseStorage.ref().child('images/$userId/$fileName');
        await storageRef.putFile(file);

        final url = await storageRef.getDownloadURL();
        final now = DateTime.now();
        final dto = ImageItemDto(
          id: '',
          url: url,
          fileName: fileName,
          uploadedAt: now,
        );
        final ref = await _imagesCollection.add(dto.toJson());

        return ImageItemDto(
          id: ref.id,
          url: url,
          fileName: fileName,
          uploadedAt: now,
        );
      });

  @override
  Future<void> deleteImage(String id, String fileName, String userId) =>
      guardedApiCall(() async {
        await firebaseStorage.ref().child('images/$userId/$fileName').delete();
        await _imagesCollection.doc(id).delete();
      });
}

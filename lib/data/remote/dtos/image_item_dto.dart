import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_developers_guide/domain/models/image_item.dart';

class ImageItemDto {
  final String id;
  final String url;
  final String fileName;
  final DateTime uploadedAt;

  ImageItemDto({
    required this.id,
    required this.url,
    required this.fileName,
    required this.uploadedAt,
  });

  factory ImageItemDto.fromJson(String id, Map<String, dynamic> json) {
    return ImageItemDto(
      id: id,
      url: json['url'] as String,
      fileName: json['fileName'] as String,
      uploadedAt: (json['uploadedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'fileName': fileName,
      'uploadedAt': Timestamp.fromDate(uploadedAt),
      // id excluded — Firestore doc ID is the document path, not a field
    };
  }

  ImageItem toImageItem() => ImageItem(
        id: id,
        url: url,
        fileName: fileName,
        uploadedAt: uploadedAt,
      );
}

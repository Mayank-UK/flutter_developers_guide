import 'package:flutter_developers_guide/domain/models/post.dart';

class PostDTO {
  final int id;
  final String title;
  final String body;

  PostDTO({required this.id, required this.title, required this.body});

  factory PostDTO.fromJson(Map<String, dynamic> json) {
    return PostDTO(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  // PostEntity toEntity() {
  //   return PostEntity(id: id, title: title, body: body);
  // }

  // static PostDTO fromEntity(PostEntity entity) {
  //   return PostDTO(id: entity.id, title: entity.title, body: entity.body);
  // }

  Post toPost() {
    return Post(id: id, title: title, body: body);
  }

  static PostDTO fromPost(Post post) {
    return PostDTO(id: post.id, title: post.title, body: post.body);
  }
}

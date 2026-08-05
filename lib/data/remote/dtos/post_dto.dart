import 'package:flutter_developers_guide/domain/models/post.dart';

class PostDto {
  final int id;
  final String title;
  final String body;

  PostDto({required this.id, required this.title, required this.body});

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
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

  Post toPost() {
    return Post(id: id, title: title, body: body);
  }

  static PostDto fromPost(Post post) {
    return PostDto(id: post.id, title: post.title, body: post.body);
  }
}

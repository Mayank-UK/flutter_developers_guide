import 'dart:io';

import 'package:flutter_developers_guide/data/remote/dtos/auth_user_dto.dart';
import 'package:flutter_developers_guide/data/remote/dtos/image_item_dto.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:flutter_developers_guide/data/remote/dtos/todo_dto.dart';

abstract class ApiService {
  Future<AuthUserDto> signIn({
    required String email,
    required String password,
  });

  Future<AuthUserDto> register({
    required String email,
    required String password,
  });

  Future<List<PostDTO>> getPosts();

  Stream<AuthUserDto?> authStateChanges();

  Future<void> signOut();

  Stream<List<TodoDTO>> watchTodos();
  Future<TodoDTO> addTodo(String title);
  Future<void> toggleTodo(String id, bool isCompleted);
  Future<void> deleteTodo(String id);

// Add to abstract ApiService:
  Stream<List<ImageItemDTO>> watchImages();
  Future<ImageItemDTO> uploadImage(File file, String userId);
  Future<void> deleteImage(String id, String fileName, String userId);
}

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/firebase_auth_mapper.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_developers_guide/data/remote/dtos/auth_user_dto.dart';
import 'package:flutter_developers_guide/data/remote/dtos/image_item_dto.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:flutter_developers_guide/data/remote/dtos/todo_dto.dart';
import 'package:logging/logging.dart';

class ApiServiceImpl implements ApiService {
  final Dio dio;
  final AppConfig config;
  final Logger logger;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  ApiServiceImpl({
    required this.dio,
    required this.config,
    required this.logger,
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });

  CollectionReference<Map<String, dynamic>> get _todosCollection => firebaseFirestore.collection('todos');

  CollectionReference<Map<String, dynamic>> get _imagesCollection => firebaseFirestore.collection('images');

  @override
  Future<AuthUserDto> signIn({
    required String email,
    required String password,
  }) =>
      guardedApiCall(
        () async {
          logger.info('Signing in: $email');

          try {
            final credential = await firebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            );

            return AuthUserDto.fromFirebaseUser(
              credential.user!,
            );
          } on FirebaseAuthException catch (e) {
            throw mapFirebaseAuthException(e);
          }
        },
      );

  @override
  Future<AuthUserDto> register({
    required String email,
    required String password,
  }) =>
      guardedApiCall(
        () async {
          logger.info('Registering: $email');

          try {
            final credential = await firebaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            );

            return AuthUserDto.fromFirebaseUser(
              credential.user!,
            );
          } on FirebaseAuthException catch (e) {
            throw mapFirebaseAuthException(e);
          }
        },
      );

  @override
  Stream<AuthUserDto?> authStateChanges() {
    return firebaseAuth.authStateChanges().map(
          (user) => user == null ? null : AuthUserDto.fromFirebaseUser(user),
        );
  }

  @override
  Future<void> signOut() => guardedApiCall(
        () async {
          await firebaseAuth.signOut();
        },
      );

  @override
  Future<List<PostDTO>> getPosts() => guardedApiCall(
        () async {
          final response = await dio.get('/posts');

          if (response.statusCode != 200) {
            throw ServerException(
              'Server returned ${response.statusCode}',
            );
          }

          final List<dynamic> jsonList = response.data as List<dynamic>;

          return jsonList
              .map(
                (json) => PostDTO.fromJson(
                  json as Map<String, dynamic>,
                ),
              )
              .toList();
        },
      );

  @override
  Stream<List<TodoDTO>> watchTodos() {
    // No guardedApiCall — same reason as before: Stream, not Future
    return _todosCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => TodoDTO.fromJson(doc.id, doc.data())).toList();
    });
  }

  @override
  Future<TodoDTO> addTodo(String title) => guardedApiCall(
        () async {
          final ref = await _todosCollection.add({
            'title': title,
            'isCompleted': false,
          });
          return TodoDTO(id: ref.id, title: title, isCompleted: false);
        },
      );

  @override
  Future<void> toggleTodo(String id, bool isCompleted) => guardedApiCall(
        () async {
          await _todosCollection.doc(id).update({'isCompleted': isCompleted});
        },
      );

  @override
  Future<void> deleteTodo(String id) => guardedApiCall(
        () async {
          await _todosCollection.doc(id).delete();
        },
      );

  @override
  Stream<List<ImageItemDTO>> watchImages() {
    return _imagesCollection
        .orderBy('uploadedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => ImageItemDTO.fromJson(doc.id, doc.data())).toList());
  }

  @override
  Future<ImageItemDTO> uploadImage(File file, String userId) => guardedApiCall(() async {
        final fileName = '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';

        // 1. Upload file to Firebase Storage
        final storageRef = firebaseStorage.ref().child('images/$userId/$fileName');
        await storageRef.putFile(file);

        // 2. Get the download URL
        final url = await storageRef.getDownloadURL();

        // 3. Save URL + metadata to Firestore
        final now = DateTime.now();
        final dto = ImageItemDTO(
          id: '', // will be replaced with Firestore doc id below
          url: url,
          fileName: fileName,
          uploadedAt: now,
        );
        final ref = await _imagesCollection.add(dto.toJson());

        return ImageItemDTO(
          id: ref.id,
          url: url,
          fileName: fileName,
          uploadedAt: now,
        );
      });

  @override
  Future<void> deleteImage(String id, String fileName, String userId) => guardedApiCall(() async {
        // 1. Delete from Storage
        await firebaseStorage.ref().child('images/$userId/$fileName').delete();

        // 2. Delete from Firestore
        await _imagesCollection.doc(id).delete();
      });
}

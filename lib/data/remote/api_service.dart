import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/core/error_handling/firebase_auth_mapper.dart';
import 'package:flutter_developers_guide/core/error_handling/guards.dart';
import 'package:flutter_developers_guide/data/remote/dtos/auth_user_dto.dart';
import 'package:flutter_developers_guide/data/remote/dtos/post_dto.dart';
import 'package:logging/logging.dart';

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
}

class ApiServiceImpl implements ApiService {
  final Dio dio;
  final AppConfig config;
  final Logger logger;
  final FirebaseAuth firebaseAuth;

  ApiServiceImpl({
    required this.dio,
    required this.config,
    required this.logger,
    required this.firebaseAuth,
  });

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
}

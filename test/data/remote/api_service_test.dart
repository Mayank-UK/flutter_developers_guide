import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockDio extends Mock implements Dio {}

class MockAppConfig extends Mock implements AppConfig {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  late MockDio mockDio;
  late MockAppConfig mockConfig;
  late ApiServiceImpl apiService;
  late MockFirebaseAuth mockFirebaseAuth;

  // A valid JSON list that maps to PostDTO
  final tPostsJson = jsonEncode([
    {'id': 1, 'title': 'Test Post', 'body': 'Test Body'},
  ]);

  setUp(() {
    mockDio = MockDio();
    mockConfig = MockAppConfig();
    mockFirebaseAuth = MockFirebaseAuth();

    when(() => mockConfig.baseUrl).thenReturn('https://fake.api');

    apiService = ApiServiceImpl(
      dio: mockDio,
      config: mockConfig,
      logger: Logger('test'),
      firebaseAuth: mockFirebaseAuth,
    );

    // Required by mocktail: register fallback for Uri
    registerFallbackValue(
      RequestOptions(path: ''),
    );
  });

  group('ApiServiceImpl.getPosts', () {
    test('returns list of PostDTO on 200 response', () async {
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/posts'),
          statusCode: 200,
          data: jsonDecode(tPostsJson),
        ),
      );

      final result = await apiService.getPosts();

      expect(result.length, 1);
      expect(result.first.id, 1);
      expect(result.first.title, 'Test Post');
    });

    test('throws ServerException on non-200 status code', () async {
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/posts'),
          statusCode: 500,
          data: 'Internal Server Error',
        ),
      );

      expect(() => apiService.getPosts(), throwsA(isA<ServerException>()));
    });

    test('throws NetworkException on SocketException', () async {
      when(() => mockDio.get(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/posts'),
          type: DioExceptionType.connectionError,
          error: const SocketException('No network'),
        ),
      );

      expect(() => apiService.getPosts(), throwsA(isA<NetworkException>()));
    });

    test('throws NetworkException on TimeoutException', () async {
      when(() => mockDio.get(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/posts'),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      expect(() => apiService.getPosts(), throwsA(isA<NetworkException>()));
    });

    test('throws ServerException on FormatException (invalid JSON)', () async {
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/posts'),
          statusCode: 200,
          data: 'not valid json',
        ),
      );

      expect(() => apiService.getPosts(), throwsA(isA<ServerException>()));
    });
  });
}

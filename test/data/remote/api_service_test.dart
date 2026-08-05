import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/data/remote/post_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late JsonPlaceholderPostRemoteDataSource remoteDataSource;

  // A valid JSON list that maps to PostDto
  final tPostsJson = jsonEncode([
    {'id': 1, 'title': 'Test Post', 'body': 'Test Body'},
  ]);

  setUp(() {
    mockDio = MockDio();
    remoteDataSource = JsonPlaceholderPostRemoteDataSource(
      dio: mockDio,
    );

    // Required by mocktail: register fallback for Uri
    registerFallbackValue(
      RequestOptions(path: ''),
    );
  });

  group('JsonPlaceholderPostRemoteDataSource.getPosts', () {
    test('returns list of PostDto on 200 response', () async {
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/posts'),
          statusCode: 200,
          data: jsonDecode(tPostsJson),
        ),
      );

      final result = await remoteDataSource.getPosts();

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

      expect(() => remoteDataSource.getPosts(), throwsA(isA<ServerException>()));
    });

    test('throws NetworkException on SocketException', () async {
      when(() => mockDio.get(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/posts'),
          type: DioExceptionType.connectionError,
          error: const SocketException('No network'),
        ),
      );

      expect(() => remoteDataSource.getPosts(), throwsA(isA<NetworkException>()));
    });

    test('throws NetworkException on TimeoutException', () async {
      when(() => mockDio.get(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/posts'),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      expect(() => remoteDataSource.getPosts(), throwsA(isA<NetworkException>()));
    });

    test('throws ServerException on FormatException (invalid JSON)', () async {
      when(() => mockDio.get(any())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/posts'),
          statusCode: 200,
          data: 'not valid json',
        ),
      );

      expect(() => remoteDataSource.getPosts(), throwsA(isA<ServerException>()));
    });
  });
}

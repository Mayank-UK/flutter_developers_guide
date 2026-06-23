import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:flutter_developers_guide/core/error_handling/exceptions.dart';
import 'package:flutter_developers_guide/data/remote/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';

// --- Mocks ---
class MockHttpClient extends Mock implements http.Client {}

class MockAppConfig extends Mock implements AppConfig {}

void main() {
  late MockHttpClient mockClient;
  late MockAppConfig mockConfig;
  late ApiServiceImpl apiService;

  // A valid JSON list that maps to PostDTO
  final tPostsJson = jsonEncode([
    {'id': 1, 'title': 'Test Post', 'body': 'Test Body'},
  ]);

  setUp(() {
    mockClient = MockHttpClient();
    mockConfig = MockAppConfig();

    when(() => mockConfig.baseUrl).thenReturn('https://fake.api');

    apiService = ApiServiceImpl(
      client: mockClient,
      config: mockConfig,
      logger: Logger('test'),
    );

    // Required by mocktail: register fallback for Uri
    registerFallbackValue(Uri.parse(''));
  });

  group('ApiServiceImpl.getPosts', () {
    test('returns list of PostDTO on 200 response', () async {
      when(() => mockClient.get(any())).thenAnswer(
        (_) async => http.Response(tPostsJson, 200),
      );

      final result = await apiService.getPosts();

      expect(result.length, 1);
      expect(result.first.id, 1);
      expect(result.first.title, 'Test Post');
    });

    test('throws ServerException on non-200 status code', () async {
      when(() => mockClient.get(any())).thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );

      expect(() => apiService.getPosts(), throwsA(isA<ServerException>()));
    });

    test('throws NetworkException on SocketException', () async {
      when(() => mockClient.get(any())).thenThrow(
        const SocketException('No network'),
      );

      expect(() => apiService.getPosts(), throwsA(isA<NetworkException>()));
    });

    test('throws NetworkException on TimeoutException', () async {
      when(() => mockClient.get(any())).thenThrow(
        TimeoutException('Timed out'),
      );

      expect(() => apiService.getPosts(), throwsA(isA<NetworkException>()));
    });

    test('throws ServerException on FormatException (invalid JSON)', () async {
      when(() => mockClient.get(any())).thenAnswer(
        (_) async => http.Response('not valid json', 200),
      );

      expect(() => apiService.getPosts(), throwsA(isA<ServerException>()));
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/provider/repository_search_provider.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

// クライアントのモック
class MockClient extends Mock implements http.Client {}
void main() {
  group('RepositorySearchProvider', () {
    final mockClient = MockClient();
    late RepositorySearchProvider provider;

    setUp(() {
      provider = RepositorySearchProvider();
      // TextEditingControllerのモックを設定
    });

    test('searchRepositories - success', () async {
      final keyword = 'your_keyword';
      final url = Uri.https('api.github.com', '/search/repositories', {'q': keyword});
      final response = http.Response('{"items": []}', 200);

      when(mockClient.get(url)).thenAnswer((_) async => response);

      await provider.searchRepositories(keyword);

      expect(provider.searchResults, isEmpty);
      // モックの動作を検証
      verify(mockClient.get(url)).called(1);
    });

    test('searchRepositories - failure', () async {
      final keyword = 'your_keyword';
      final url = Uri.https('api.github.com', '/search/repositories', {'q': keyword});
      final response = http.Response('Failed to get response', 400);

      when(mockClient.get(url)).thenAnswer((_) async => response);

      await expectLater(
        provider.searchRepositories(keyword),
        throwsException, // Exceptionをスローすることを期待
      );

      expect(provider.searchResults, isEmpty);
      // モックの動作を検証
      verify(mockClient.get(url)).called(1);
    });
  });
}

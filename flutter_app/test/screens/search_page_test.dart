import 'package:flutter/material.dart';
import 'package:flutter_app/model/repository_model.dart';
import 'package:flutter_app/screens/widgets/search_page/repository_list.dart';
import 'package:flutter_app/screens/widgets/search_page/search_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/provider/repository_search_provider.dart';
import 'package:flutter_app/screens/search_page.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('SearchPage ウィジェットテスト', (WidgetTester tester) async {
    // テスト用のキーワードを設定します
    const testKeyword = 'flutter';

    // テスト用の RepositorySearchProvider のモックを作成します
    final mockSearchProvider = MockRepositorySearchProvider();

    // モックの検索結果を設定します（適切なレスポンスを設定）
    mockSearchProvider.searchResults =[
      RepositoryModel(
        name: 'Test Repository',
        ownerIconUrl: 'https://images.app.goo.gl/wvLjgGZKXHCWJD3Y9',
        language: 'Dart',
        stars: 100,
        watchers: 50,
        forks: 30,
        issues: 10,
      ),
    ];

    // テストを実行する前に isSearched をリセットします
    mockSearchProvider.isSearched = false;

    // RepositorySearchProvider の searchRepositories メソッドにキーワードを渡して呼び出します
    await mockSearchProvider.searchRepositories(testKeyword);

    // モックのプロバイダーを使って SearchPage をビルドします。
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<RepositorySearchProvider>(
          create: (_) => mockSearchProvider,
          child: SearchPage(),
        ),
      ),
    );

    // AppBar のタイトルが正しいことを検証します
    expect(find.text('GitHub Repository Search'), findsOneWidget);

    // 検索バーがページに表示されていることを検証します
    expect(find.byType(SearchBar), findsOneWidget);

    // 検索結果がある場合、RepositoryList ウィジェットが表示されることを検証します
    await tester.pump();
    expect(find.byType(RepositoryList), findsOneWidget);
  });
}

// モックの RepositorySearchProvider クラス
class MockRepositorySearchProvider extends RepositorySearchProvider {
  // searchRepositories メソッドをオーバーライドして適切なレスポンスを返す
  @override
  Future<void> searchRepositories(String keyword) async {
    // 適切なレスポンスを設定
    searchResults = [
      RepositoryModel(
        name: 'Test Repository',
        ownerIconUrl: 'https://images.app.goo.gl/wvLjgGZKXHCWJD3Y9',
        language: 'Dart',
        stars: 100,
        watchers: 50,
        forks: 30,
        issues: 10,
      ),
    ];
    isSearched = true;
    notifyListeners();
  }
}

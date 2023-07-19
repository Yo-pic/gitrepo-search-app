import 'package:flutter/material.dart';
import 'package:flutter_app/model/repository_model.dart';
import 'package:flutter_app/provider/repository_search_provider.dart';
import 'package:flutter_app/screens/widgets/search_page/repository_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RepositoryList should display search results correctly', (WidgetTester tester) async {
    // Create a test RepositorySearchProvider
    RepositorySearchProvider testSearchProvider = RepositorySearchProvider();

    // Create test repository data
    List<RepositoryModel> testRepositories = [
      RepositoryModel(
        name: 'Sample Repo1',
        ownerIconUrl: 'https://example.com/avatar.png',
        language: 'Dart',
        stars: 10,
        watchers: 5,
        forks: 3,
        issues: 2,
        url: 'https://github.com/octocat',
      ),
      RepositoryModel(
        name: 'Sample Repo2',
        ownerIconUrl: 'https://example.com/avatar.png',
        language: 'Java',
        stars: 100,
        watchers: 50,
        forks: 31,
        issues: 2,
        url: 'https://github.com/octocat',
      ),
      RepositoryModel(
        name: 'Sample Repo',
        ownerIconUrl: 'https://example.com/avatar.png',
        language: 'Python',
        stars: 10000,
        watchers: 5,
        forks: 3111,
        issues: 233,
        url: 'https://github.com/octocat',
      ),
    ];

    // Set the test search results
    testSearchProvider.searchResults = testRepositories;

    // Build the RepositoryList widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RepositoryList(searchProvider: testSearchProvider),
        ),
      ),
    );

    // Ensure that each repository item is displayed correctly
    for (var repository in testRepositories) {
      expect(find.text(repository.name), findsOneWidget);
      expect(find.text('Language: ${repository.watchers}'), findsOneWidget);
      expect(find.text('Stars: ${repository.stars.toString()}'), findsOneWidget);
    }
  });
}

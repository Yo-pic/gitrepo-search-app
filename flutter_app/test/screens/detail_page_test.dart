import 'package:flutter/material.dart';
import 'package:flutter_app/model/repository_model.dart';
import 'package:flutter_app/screens/detail_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DetailPage displays repository information', (WidgetTester tester) async {
    // Create a RepositoryModel instance with test data
    RepositoryModel testRepository = RepositoryModel(
      name: 'Test Repository',
      language: 'Dart',
      stars: 100,
      watchers: 50,
      forks: 30,
      issues: 5,
      ownerIconUrl: 'https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png',
      url: 'https://github.com/octocat',
    );

    // Build our DetailPage widget with the test data
    await tester.pumpWidget(MaterialApp(home: DetailPage(repository: testRepository)));

    // Check if the repository name is displayed in the app bar
    expect(find.text('Test Repository'), findsOneWidget);

    // Check if repository information is displayed on the page
    expect(find.text('Language: Dart'), findsOneWidget);
    expect(find.text('Stars: 100'), findsOneWidget);
    expect(find.text('Watchers: 50'), findsOneWidget);
    expect(find.text('Forks: 30'), findsOneWidget);
    expect(find.text('Issues: 5'), findsOneWidget);

    // Check if the "もっと詳しく" button is displayed
    expect(find.text('もっと詳しく'), findsOneWidget);

    // Tap the "もっと詳しく" button
    await tester.tap(find.text('もっと詳しく'));
    await tester.pumpAndSettle(); // Wait for the navigation transition to complete

    // After tapping the button, the URL should be opened in the browser
    // You can add more assertions here if needed to check browser behavior
  });
}
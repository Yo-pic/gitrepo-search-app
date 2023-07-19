import 'package:flutter/material.dart';
import 'package:flutter_app/model/repository_model.dart';
import 'package:flutter_app/provider/repository_listitem_provider.dart';
import 'package:flutter_app/screens/detail_page.dart';
import 'package:flutter_app/screens/widgets/search_page/repository_listitem.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('RepositoryListItem should navigate to DetailPage on tap', (WidgetTester tester) async {
    // Create a test repository model
    RepositoryModel testRepository = RepositoryModel(
      name: 'Test Repository',
      ownerIconUrl: 'https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png',
      language: 'Dart',
      stars: 100,
      watchers: 50,
      forks: 3,
      issues: 5,
      url: 'https://github.com/octocat',
    );

    // Create a mock Provider for RepositoryListItemProvider
    Provider.debugCheckInvalidValueType = null; // Suppress debug warning
    final listItemProvider = RepositoryListItemProvider();

    // Build the RepositoryListItem widget with mock Provider
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: listItemProvider,
          child: RepositoryListItem(repositoryModel: testRepository),
        ),
      ),
    );

    // Ensure that the RepositoryListItem widget is displayed correctly
    expect(find.text(testRepository.name), findsOneWidget);
    expect(find.text('Language: ${testRepository.watchers}'), findsOneWidget);
    expect(find.text('Stars: ${testRepository.stars.toString()}'), findsOneWidget);

    // Tap on the RepositoryListItem widget
    await tester.tap(find.byType(RepositoryListItem));
    await tester.pumpAndSettle();

    // Verify that DetailPage is navigated to
    expect(find.byType(DetailPage), findsOneWidget);
  });
}

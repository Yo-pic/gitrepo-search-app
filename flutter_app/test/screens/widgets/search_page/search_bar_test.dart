import 'package:flutter/material.dart';
import 'package:flutter_app/provider/repository_search_provider.dart';
import 'package:flutter_app/screens/widgets/search_page/search_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SearchBar should perform keyword search correctly', (WidgetTester tester) async {
    // Create a test RepositorySearchProvider
    RepositorySearchProvider testSearchProvider = RepositorySearchProvider();

    // Build the SearchBar widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchBar(searchProvider: testSearchProvider),
        ),
      ),
    );

    // Get the TextField
    final textFieldFinder = find.byType(TextField);

    // Enter a keyword
    await tester.enterText(textFieldFinder, 'flutter');

    // Press Enter to perform the keyword search
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

  });
}

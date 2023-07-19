import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/provider/repository_listitem_provider.dart';

void main() {
  group('RepositoryListItemProvider Tests', () {
    test('Initial pressingStatus should be false', () {
      final provider = RepositoryListItemProvider();
      expect(provider.pressingStatus, false);
    });

    test('pressingListItem should set pressingStatus to true', () {
      final provider = RepositoryListItemProvider();
      provider.pressingListItem();
      expect(provider.pressingStatus, true);
    });

    test('notPressingListItem should set pressingStatus to false', () {
      final provider = RepositoryListItemProvider();
      provider.notPressingListItem();
      expect(provider.pressingStatus, false);
    });
  });
}

import 'package:flutter_app/model/repository_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RepositoryModel', () {
    test('Constructor creates an instance with the correct values', () {
      final repository = RepositoryModel(
        name: 'Sample Repo',
        ownerIconUrl: 'https://example.com/avatar.png',
        language: 'Dart',
        stars: 10,
        watchers: 5,
        forks: 3,
        issues: 2,
      );

      expect(repository.name, 'Sample Repo');
      expect(repository.ownerIconUrl, 'https://example.com/avatar.png');
      expect(repository.language, 'Dart');
      expect(repository.stars, 10);
      expect(repository.watchers, 5);
      expect(repository.forks, 3);
      expect(repository.issues, 2);
    });
  });
}
class RepositoryModel {
  final String name;
  final String ownerIconUrl;
  final String language;
  final int stars;
  final int watchers;
  final int forks;
  final int issues;

  RepositoryModel({
    required this.name,
    required this.ownerIconUrl,
    required this.language,
    required this.stars,
    required this.watchers,
    required this.forks,
    required this.issues,
  });
}
import 'package:flutter/material.dart';
import 'package:flutter_app/model/repository_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RepositorySearchProvider with ChangeNotifier {
  // 検索欄のキーワードを取得するためのコントローラー
  TextEditingController _searchController = TextEditingController();
  // apiによる検索結果を保持しておくリスト
  List<RepositoryModel> _searchResults = [];

  TextEditingController get searchController => _searchController;
  List<RepositoryModel> get searchResults => _searchResults;

  // GitHub apiを用いてレポジトリをキーワード検索する
  // keyword: 検索欄に入力したキーワード
  Future<void> searchRepositories(String keyword) async {
    final url = Uri.https('api.github.com', '/search/repositories', {'q': keyword});
    final response = await http.get(url);
    List<RepositoryModel> results = [];

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      results = _parseRepositories(data);
    }

    _searchResults = results;
    notifyListeners();
  }

  // apiによって返された結果をParseする。
  // data: apiに返されたデータの本文
  List<RepositoryModel> _parseRepositories(dynamic data) {
    List<RepositoryModel> results = [];

    if (data != null && data['items'] != null) {
      for (var item in data['items']) {
        RepositoryModel repository = RepositoryModel(
          name: item['name'] ?? '',
          ownerIconUrl: item['owner']['avatar_url'] ?? '',
          language: item['language'] ?? '',
          stars: item['stargazers_count'] ?? 0,
          watchers: item['watchers_count'] ?? 0,
          forks: item['forks_count'] ?? 0,
          issues: item['open_issues_count'] ?? 0,
        );
        results.add(repository);
      }
    }

    return results;
  }
}
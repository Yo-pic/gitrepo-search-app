import 'package:flutter/material.dart';
import 'package:flutter_app/provider/repository_search_provider.dart';
import 'package:flutter_app/screens/widgets/search_page/repository_listitem.dart';

/// レポジトリ検索結果をリスト化する
class RepositoryList extends StatelessWidget {
  final RepositorySearchProvider searchProvider;

  const RepositoryList({required this.searchProvider});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: searchProvider.searchResults.length,
        itemBuilder: (BuildContext context, int index) {

          return RepositoryListItem(repositoryModel: searchProvider.searchResults[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
      ),
    );
  }
}

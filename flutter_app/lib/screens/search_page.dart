import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/provider/repository_search_provider.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Repository Search'),
      ),
      body: Consumer<RepositorySearchProvider>(
        builder: (context, searchProvider, _) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchProvider.searchController,
                  decoration: InputDecoration(
                    labelText: 'Keyword',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  searchProvider.searchRepositories(searchProvider.searchController.text);
                },
                child: Text('Search'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchProvider.searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(searchProvider.searchResults[index].name),
                      onTap: () {
                       // ここに詳細ページへの遷移を記載する。
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
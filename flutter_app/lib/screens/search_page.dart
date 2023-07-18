import 'package:flutter/material.dart';
import 'package:flutter_app/model/repository_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/provider/repository_search_provider.dart';

class SearchPage extends StatelessWidget {
  Widget searchBar(RepositorySearchProvider searchProvider) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.25),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Icon(
              Icons.search,
              color: Colors.black.withOpacity(0.32),
            ),
          ),
          Expanded(
            child: TextField(
              //controller: searchProvider.searchController,
              onSubmitted: (keyword) => searchProvider.searchRepositories(keyword),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Keyword',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.32),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget repositoryListItem({required RepositoryModel repositoryModel}) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 360,
          height: 96,
          child: Row(
            // 垂直方向左寄り
            mainAxisAlignment: MainAxisAlignment.start,
            // 水平方向左寄り
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(repositoryModel.ownerIconUrl),
                  ),
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 48,
                      child: Text(
                        repositoryModel.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _repositoryListItemInfo(
                            icon: Icons.star_rounded,
                            infoValue: repositoryModel.stars.toString()),
                        const SizedBox(width: 16),
                        _repositoryListItemInfo(
                            icon: Icons.visibility_rounded,
                            infoValue: repositoryModel.watchers.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // リストタイル下部
  Widget _repositoryListItemInfo(
      {required IconData icon, required String infoValue}) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black26,
        ),
        const SizedBox(width: 4),
        Text(
          infoValue,
          style: const TextStyle(
            color: Colors.black26,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffebf9ff),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'GitHub Repository Search',
          style: TextStyle(
            color: Colors.black.withOpacity(0.85),
          ),
        ),
        backgroundColor: const Color(0xffebf9ff),
      ),
      body: Consumer<RepositorySearchProvider>(
        builder: (context, searchProvider, _) {
          return Column(
            children: [
              searchBar(searchProvider),

              /*
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchProvider.searchController,
                  decoration: const InputDecoration(
                    labelText: 'Keyword',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  searchProvider
                      .searchRepositories(searchProvider.searchController.text);
                },
                child: const Text('Search'),
              ),

               */

              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: searchProvider.searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return repositoryListItem(
                        repositoryModel: searchProvider.searchResults[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 8,
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

import 'package:flutter/material.dart';
import 'package:flutter_app/model/repository_model.dart';
import 'package:flutter_app/provider/repository_search_provider.dart';

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
          return repositoryListItem(searchProvider.searchResults[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
      ),
    );
  }

  Widget repositoryListItem(RepositoryModel repositoryModel) {
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
              _ownerImage(repositoryModel),
              const SizedBox(width: 16),
              _repositoryListItemContent(repositoryModel),
            ],
          ),
        ),
      ),
    );
  }

// OwnerIcon窓のwidget
  Widget _ownerImage(RepositoryModel repositoryModel) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(repositoryModel.ownerIconUrl),
        ),
        border: Border.all(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

// ListItemのcontent部分
  Widget _repositoryListItemContent(RepositoryModel repositoryModel) {
    return Expanded(
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
          _repositoryListItemInfo(repositoryModel)
        ],
      ),
    );
  }

// リストItem下部
  Widget _repositoryListItemInfo(RepositoryModel repositoryModel) {
    return Row(
      children: [
        _repositoryListItemInfoItem(
            icon: Icons.star_rounded,
            infoValue: repositoryModel.stars.toString()),
        const SizedBox(width: 16),
        _repositoryListItemInfoItem(
            icon: Icons.visibility_rounded,
            infoValue: repositoryModel.watchers.toString()),
      ],
    );
  }

// リストタイル下部Item
  Widget _repositoryListItemInfoItem(
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
}

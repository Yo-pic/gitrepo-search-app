import 'package:flutter/material.dart';
import 'package:flutter_app/model/repository_model.dart';

class DetailPage extends StatelessWidget {
  final RepositoryModel repository;

  DetailPage({required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repository Detail'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Repository Name: ${repository.name}'),
                Image.network(repository.ownerIconUrl),
                Text('Language: ${repository.language}'),
                Text('Stars: ${repository.stars.toString()}'),
                Text('Watchers: ${repository.watchers.toString()}'),
                Text('Forks: ${repository.forks.toString()}'),
                Text('Issues: ${repository.issues.toString()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
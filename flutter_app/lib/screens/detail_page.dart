import 'package:flutter/material.dart';
import 'package:flutter_app/model/repository_model.dart';
import 'package:flutter_app/screens/widgets/custom_appbar.dart';

class DetailPage extends StatelessWidget {
  final RepositoryModel repository;
  double? _deviceWidth, _deviceHeight;

  DetailPage({required this.repository});

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: repository.name),
      backgroundColor: const Color(0xffebf9ff),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: _deviceHeight! * 0.3,
                    width: _deviceWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(repository.ownerIconUrl)
                      )
                    ),
                ),

                Text('Language: ${repository.language}'),
                Text('Stars: ${repository.stars.toString()}'),
                Text('Watchers: ${repository.watchers.toString()}'),
                Text('Forks: ${repository.forks.toString()}'),
                Text('Issues: ${repository.issues.toString()}'),
                Text('width: ${_deviceWidth.toString()}'),
                Text('height: ${_deviceHeight.toString()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
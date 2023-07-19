import 'package:flutter/material.dart';
import 'package:flutter_app/model/repository_model.dart';
import 'package:flutter_app/screens/widgets/custom_appbar.dart';
import 'package:url_launcher/link.dart';

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
            child: _buildDetailPageWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailPageWidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ownerImageWidget(),
              SizedBox(height: 20),
              _introduceInfo(text: 'Language: ${repository.language}'),
              _introduceInfo(text: 'Stars: ${repository.stars.toString()}'),
              _introduceInfo(
                  text: 'Watchers: ${repository.watchers.toString()}'),
              _introduceInfo(text: 'Forks: ${repository.forks.toString()}'),
              _introduceInfo(text: 'Issues: ${repository.issues.toString()}'),
              _urlButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _ownerImageWidget() {
    return Container(
      height: _deviceHeight! * 0.3,
      width: _deviceWidth,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(repository.ownerIconUrl))),
    );
  }

  /// レポジトリ情報用カスタムテキストwidget
  Widget _introduceInfo({required String text}) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.black12,
        width: 4,
      ))),
      child: Text(text,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  /// httpリンクをボタンに変えるwidget
  Widget _urlButton() {
    return Link(
      // 開きたいWebページのURLを指定
      uri: Uri.parse(repository.url),
      // ブラウザの新しいタブで指定したURLのWebページを開く
      target: LinkTarget.blank,
      builder: (BuildContext ctx, FollowLink? openLink) {
        return TextButton(
          onPressed: openLink,
          child: const Text(
            'もっと詳しく',
            style: TextStyle(fontSize: 20),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        );
      },
    );
  }
}

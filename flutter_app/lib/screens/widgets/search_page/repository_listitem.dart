import 'package:flutter/material.dart';
import 'package:flutter_app/model/repository_model.dart';
import 'package:flutter_app/screens/detail_page.dart';
import 'package:flutter_app/provider/repository_listitem_provider.dart';
import 'package:provider/provider.dart';


/// レポジトリリストの子要素を作成する
class RepositoryListItem extends StatelessWidget{
  final RepositoryModel repositoryModel;
  double? _deviceWidth, _deviceHeight;

  RepositoryListItem({required this.repositoryModel});

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<RepositoryListItemProvider>(
      create: (_) => RepositoryListItemProvider(),
      child: Consumer<RepositoryListItemProvider>(
        builder: (context, listItemProvider, _) {
          return _buildListItem(listItemProvider, context);
        },
      ),
    );
  }

  Widget _buildListItem(RepositoryListItemProvider listItemProvider, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        listItemProvider.pressingListItem();
      },
      onTapUp: (_) {
        listItemProvider.notPressingListItem();
      },
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => DetailPage(repository: repositoryModel),),);
      },
      onTapCancel: () {
        listItemProvider.notPressingListItem();
      },
      child: AnimatedOpacity(
        // フェードインアウト時の色味設定
        opacity: listItemProvider.pressingStatus ? 0.4 : 1.0,
        // フェード時間
        duration: Duration(milliseconds: 10),
        child: _buildRepositoryItem(),
      ),
    );
  }



  /// RepositoryItemWidgetを作成する。
  Widget _buildRepositoryItem(){
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          // 360くらい
          width: _deviceWidth! * 0.92,
          // 96くらい
          height: _deviceHeight! * 0.13,
          child: Row(
            // 垂直方向左寄り
            mainAxisAlignment: MainAxisAlignment.start,
            // 水平方向左寄り
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ownerImage(repositoryModel),
              const SizedBox(width: 16),
              _repositoryItemContent(repositoryModel),
            ],
          ),
        ),
      ),
    );
  }

  /// OwnerIcon窓のwidget
  Widget _ownerImage(RepositoryModel repositoryModel) {
    // length: Icon窓の一辺の長さ
    // repositoryModel: 検索結果
    return Container(
      // 48くらい
      height: _deviceWidth! * 0.12,
      width: _deviceWidth! * 0.12,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(repositoryModel.ownerIconUrl),
        ),
        border: Border.all(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  /// RepositoryItem子要素のcontent部分
  Widget _repositoryItemContent(RepositoryModel repositoryModel) {
    // repositoryModel: 検索結果
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            // 48くらい
            height: _deviceWidth! * 0.12,
            child: Text(
              repositoryModel.name,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 8),
          _repositoryItemInfo(repositoryModel)
        ],
      ),
    );
  }

  /// RepositoryItem子要素の下部情報
  Widget _repositoryItemInfo(RepositoryModel repositoryModel) {
    // repositoryModel: 検索結果
    return Row(
      children: [
        _repositoryItemInfoItem(
            icon: Icons.star_rounded,
            infoValue: repositoryModel.stars.toString()),
        const SizedBox(width: 16),
        _repositoryItemInfoItem(
            icon: Icons.visibility_rounded,
            infoValue: repositoryModel.watchers.toString()),
      ],
    );
  }

  /// 下部情報の子要素
  Widget _repositoryItemInfoItem({
    // 使用するアイコンデータ
    required IconData icon,
    // 使用したい検索結果情報
    required String infoValue
  }){
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
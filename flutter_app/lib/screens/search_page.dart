import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/provider/repository_search_provider.dart';
import 'package:flutter_app/screens/widgets/custom_appbar.dart';
import 'package:flutter_app/screens/widgets/search_page/repository_list.dart';
import 'package:flutter_app/screens/widgets/search_page/search_bar.dart';

/// レポジトリ検索用ページ
/// 検索結果をlist形式で表示する
class SearchPage extends StatelessWidget {

  /// 検索件数が0の時出力されるwidget
  Widget notFoundRepositoryReport(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Container(
          alignment: Alignment.center,
          child: const Text(
            'Repositories are not found for the keywords.',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /// 検索結果総数によって出力するwidgetを変える。
  ///
  /// * もし[searchResultSum]が0の時、SearchPageにエラー文widgetを出力する。
  /// * もし[searchResultSum]が1以上の時、レポジトリリストwidgetを出力する。
  Widget branchScreenOutput({
    // 検索結果総数
    required int searchResultSum,
    // レポジトリ検索用プロバイダー
    required RepositorySearchProvider searchProvider,
  }){
    if(searchResultSum == 0 && searchProvider.isSearched){
      return notFoundRepositoryReport();
    }
    else{
      return RepositoryList(searchProvider: searchProvider);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffebf9ff),
      appBar: CustomAppBar(title: 'GitHub Repository Search'),
      body: Consumer<RepositorySearchProvider>(
        builder: (context, searchProvider, _) {
          return Column(
            children: [
              SearchBar(searchProvider: searchProvider),
              //searchBar(searchProvider),
              branchScreenOutput(
                  searchResultSum: searchProvider.searchResults.length,
                  searchProvider: searchProvider
              )
            ],
          );
        },
      ),
    );
  }
}

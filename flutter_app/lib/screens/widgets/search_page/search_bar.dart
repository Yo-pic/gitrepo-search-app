import 'package:flutter/material.dart';
import 'package:flutter_app/provider/repository_search_provider.dart';

class SearchBar extends StatelessWidget{
  final RepositorySearchProvider searchProvider;

  const SearchBar({required this.searchProvider});

  @override
  Widget build(BuildContext context) {
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

         // テキストフィールド
         // returnを押すとキーワード検索を開始する。
         Expanded(
           child: TextField(
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
}
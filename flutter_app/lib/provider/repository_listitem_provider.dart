import 'package:flutter/material.dart';

/// RepositoryListItem用プロバイダー
/// リストアイテムをtapしたかどうか検出する
///  * tapしていたら[_pressingStatus]をtrueに変更する
///  * tapするのをやめる、し終える、中断したら[_pressingStatus]をfalseに変更する
class RepositoryListItemProvider with ChangeNotifier{
  bool _pressingStatus = false;
  bool get pressingStatus => _pressingStatus;

  void pressingListItem(){
    _pressingStatus = true;
    notifyListeners();
  }

  void notPressingListItem(){
    _pressingStatus = false;
    notifyListeners();
  }
}
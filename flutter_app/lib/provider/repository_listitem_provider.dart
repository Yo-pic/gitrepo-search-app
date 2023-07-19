import 'package:flutter/material.dart';

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
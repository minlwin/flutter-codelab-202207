import 'package:flutter/material.dart';

class PageState with ChangeNotifier {
  String title = "Japanese Words";
  bool showSideBar = true;

  setTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  setShowSideBar(bool state) {
    showSideBar = state;
    notifyListeners();
  }
}

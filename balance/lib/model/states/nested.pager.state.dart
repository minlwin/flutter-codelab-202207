import 'package:flutter/material.dart';

class NestedPagerState with ChangeNotifier {
  int _page = 0;

  final List<String> pages;
  int get totalPage => pages.length;

  NestedPagerState(this.pages);

  int get page => _page;
  bool get hasPrevious => _page > 0;
  bool get hasNext => _page < totalPage;

  String get pageTitle => pages[page];

  set page(int page) {
    _page = page;
    notifyListeners();
  }

  next() {
    _page++;
    notifyListeners();
  }

  previous() {
    _page--;
    notifyListeners();
  }

  void clear() {
    _page = 0;
    notifyListeners();
  }
}

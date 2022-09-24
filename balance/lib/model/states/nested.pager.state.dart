import 'package:balance/ui/widget/error.widget.dart';
import 'package:flutter/material.dart';

class NestedPagerState with ChangeNotifier {
  String _current = "";
  final Map<String, Widget> pages;

  NestedPagerState._(this.pages);

  factory NestedPagerState.create({
    required Map<String, Widget> pages,
    required String current,
  }) {
    final pager = NestedPagerState._(pages);
    pager._current = current;
    return pager;
  }

  String get title => _current;

  change(String page) {
    _current = page;
    notifyListeners();
  }

  Widget get currentPage =>
      pages[_current] ??
      const AppError(
        message: "There is no page.",
      );
}

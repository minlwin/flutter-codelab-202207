import 'package:balance/ui/widget/error.widget.dart';
import 'package:flutter/material.dart';

typedef NestedPageBuilder = Widget Function();

class NestedPagerState with ChangeNotifier {
  String _current = "";
  final Map<String, NestedPageBuilder> pages;

  NestedPagerState._(this.pages);

  factory NestedPagerState.create({
    required Map<String, NestedPageBuilder> pages,
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
      pages[_current]?.call() ??
      const AppError(
        message: "There is no page.",
      );
}

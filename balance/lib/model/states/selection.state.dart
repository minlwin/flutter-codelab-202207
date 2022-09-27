import 'package:flutter/material.dart';

class SelectionState with ChangeNotifier {
  int _index = 0;

  int get selected => _index;

  select(int index) {
    _index = index;
    notifyListeners();
  }
}

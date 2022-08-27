import 'package:flutter/material.dart';

class CounterState extends ChangeNotifier {
  int count = 0;

  countUp() {
    count++;
    notifyListeners();
  }

  countDown() {
    count--;
    notifyListeners();
  }

  reset() {
    count = 0;
    notifyListeners();
  }
}

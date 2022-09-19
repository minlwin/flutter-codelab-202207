import 'package:flutter/material.dart';

class ColorPickerState with ChangeNotifier {
  Color _color = Colors.red;

  Color get color => _color;

  set color(Color color) {
    _color = color;
    notifyListeners();
  }
}

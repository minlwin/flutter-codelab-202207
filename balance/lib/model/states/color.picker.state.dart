import 'package:flutter/material.dart';

class ColorPickerState with ChangeNotifier {
  Color _color = Colors.red;

  Color get color => _color;

  ColorPickerState._();

  factory ColorPickerState.generate(Color? color) {
    final state = ColorPickerState._();
    state._color = color ?? Colors.red;
    return state;
  }

  set color(Color color) {
    _color = color;
    notifyListeners();
  }
}

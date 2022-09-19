import 'package:flutter/material.dart';

class SwitchFormState with ChangeNotifier {
  bool _state = true;

  bool get state => _state;

  final String onLabel;
  final String offLabel;

  SwitchFormState({required this.onLabel, required this.offLabel});

  set state(bool state) {
    _state = state;
    notifyListeners();
  }

  String get label => state ? onLabel : offLabel;
}

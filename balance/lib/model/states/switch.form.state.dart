import 'package:flutter/material.dart';

class SwitchFormState with ChangeNotifier {
  bool _state = true;

  bool get state => _state;

  final String onLabel;
  final String offLabel;

  factory SwitchFormState.generate(bool? state, String on, String off) {
    final switchFormState = SwitchFormState(offLabel: off, onLabel: on);
    switchFormState._state = state ?? true;
    return switchFormState;
  }

  SwitchFormState({required this.onLabel, required this.offLabel});

  set state(bool state) {
    _state = state;
    notifyListeners();
  }

  String get label => state ? onLabel : offLabel;
}

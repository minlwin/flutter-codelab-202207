import 'package:flutter/material.dart';

class BalanceDetailsState with ChangeNotifier {
  final int _id;

  BalanceDetailsState(this._id);

  int get id => _id;

  reload() {
    notifyListeners();
  }
}

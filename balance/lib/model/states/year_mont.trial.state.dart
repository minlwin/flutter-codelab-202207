import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YearMonthTrial with ChangeNotifier {
  final monthFormat = DateFormat("MMMM yyyy");

  int _year = DateTime.now().year;
  int _month = DateTime.now().month;

  int get year => _year;
  int get month => _month;

  String get title => monthFormat.format(DateTime(year, month, 1));

  next() {
    final date = DateTime(year, month + 1, 1);
    _month = date.month;
    _year = date.year;
    notifyListeners();
  }

  previous() {
    final date = DateTime(year, month - 1, 1);
    _month = date.month;
    _year = date.year;
    notifyListeners();
  }
}

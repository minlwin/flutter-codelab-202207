import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YearMonthState with ChangeNotifier {
  final monthFormat = DateFormat("MMMM yyyy");

  int _year = DateTime.now().year;
  int _month = DateTime.now().month;
  bool credit;

  YearMonthState(this.credit);

  int get year => _year;
  int get month => _month;

  set year(int year) {
    _year = year;
    notifyListeners();
  }

  set month(int month) {
    _month = month;
    notifyListeners();
  }

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

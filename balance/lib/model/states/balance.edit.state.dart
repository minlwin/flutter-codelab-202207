import 'package:balance/model/dto/category.dto.dart';
import 'package:balance/model/dto/details.dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceEditState with ChangeNotifier {
  final bool credit;
  Category? _category;
  List<Details> detailsList = List.empty(growable: true);

  BalanceEditState(this.credit);

  set category(Category? category) {
    _category = category;
    notifyListeners();
  }

  Category? get category => _category;
  String get total => NumberFormat("#,##0").format(_total);
  int get _total => detailsList.isEmpty
      ? 0
      : detailsList.map((e) => e.amount).reduce((a, b) => a + b);

  addDetails(Details details) {
    detailsList.add(details);
    notifyListeners();
  }
}

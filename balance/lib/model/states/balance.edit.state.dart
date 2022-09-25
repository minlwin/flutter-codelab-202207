import 'package:balance/model/dto/balance.details.dto.dart';
import 'package:balance/model/dto/balance.dto.dart';
import 'package:balance/model/dto/category.dto.dart';
import 'package:balance/model/dto/details.dto.dart';
import 'package:flutter/material.dart';

class BalanceEditState with ChangeNotifier {
  BalanceWidthDetails? dto;

  BalanceEditState._();

  factory BalanceEditState.forAddNew(bool credit) {
    final state = BalanceEditState._();
    state.dto = BalanceWidthDetails(
        balance: Balance(
          category: Category(credit: credit),
        ),
        details: List.empty(growable: true));
    return state;
  }

  factory BalanceEditState.forEdit(BalanceWidthDetails dto) {
    final state = BalanceEditState._();
    state.dto = dto;
    return state;
  }

  Balance get balance => dto!.balance;
  List<Details> get detailsList => dto!.details;

  bool get credit => dto?.balance.category?.credit ?? true;

  Category? get category => dto?.balance.category;
  set category(Category? category) {
    dto!.balance.category = category;
    notifyListeners();
  }

  int get total => detailsList.isEmpty
      ? 0
      : detailsList.map((e) => e.amount).reduce((a, b) => a + b);

  DateTime get createAt => dto?.balance.createAt ?? DateTime.now();
  String get remark => dto?.balance.remark ?? "";

  set createAt(DateTime dateTime) {
    dto?.balance.createAt = dateTime;
  }

  set remark(String remark) {
    dto?.balance.remark = remark;
  }

  addDetails(Details details) {
    detailsList.add(details);
    notifyListeners();
  }
}

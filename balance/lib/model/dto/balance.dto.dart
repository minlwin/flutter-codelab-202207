import 'package:balance/model/dto/category.dto.dart';
import 'package:flutter/material.dart';

class Balance {
  int id;
  DateTime? createAt;
  Category? category;
  String remark;
  int total;

  Balance({
    this.id = 0,
    this.createAt,
    this.category,
    this.remark = "",
    this.total = 0,
  });

  factory Balance.from(Map<String, dynamic> map) => Balance(
      id: map['balance_id'],
      createAt: map['create_at'] != null ? DateTime(map['create_at']) : null,
      remark: map['remark'],
      total: map['total'] ?? 0,
      category: Category(
        id: map['category_id'],
        name: map['category_name'],
        color: Color(map['color']),
        credit: map['credit'] == 1,
      ));

  Map<String, dynamic> toMap() => {
        "category_id": category!.id,
        "remark": remark,
        "create_at": createAt?.millisecondsSinceEpoch,
      };

  static List<Balance> list(List<Map<String, dynamic>> result) =>
      List.from(result.map((e) => Balance.from(e)));
}

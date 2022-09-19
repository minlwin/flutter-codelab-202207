import 'package:flutter/material.dart';

class Category {
  int id;
  String name;
  Color? color;
  bool credit;

  get title => name.substring(0, 2).toUpperCase();

  Category({
    this.id = 0,
    this.name = "",
    this.color,
    this.credit = true,
  });

  Map<String, dynamic> toMap() => {
        "name": name,
        "color": color?.value ?? 0,
        "credit": credit ? 1 : 0,
      };

  factory Category.from(Map<String, dynamic> map) => Category(
        id: map['id'],
        name: map['name'],
        color: Color(map['color']),
        credit: map['credit'] == 1,
      );

  static List<Category> list(List<Map<String, dynamic>> result) =>
      List.from(result.map((e) => Category.from(e)));
}

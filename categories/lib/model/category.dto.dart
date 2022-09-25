import 'package:categories/utils/date.utitls.dart';
import 'package:flutter/material.dart';

class Category {
  int id;
  String name;
  Color color;
  DateTime? createAt;

  String get title => name.substring(0, 2).toUpperCase();

  Category({
    this.id = 0,
    required this.name,
    required this.color,
    this.createAt,
  });

  factory Category.from(Map<String, dynamic> map) => Category(
        id: map['id'],
        name: map['name'],
        color: Color(map['color']),
        createAt: DateTimeUtils.fromInt(map['create_at']),
      );

  Map<String, dynamic> params() => {
        "name": name,
        "color": color.value,
        "create_at": DateTimeUtils.toInt(createAt)
      };

  static List<Category> list(List<Map<String, dynamic>> maps) {
    return List.from(maps.map((e) => Category.from(e)));
  }
}

import 'package:balance/model/dto/category.dto.dart';
import 'package:flutter/material.dart';

class CategoryEditState {
  Color? color;
  bool credit = true;

  Category getCategory({int id = 0, required String name}) {
    return Category(id: id, name: name, color: color, credit: credit);
  }
}

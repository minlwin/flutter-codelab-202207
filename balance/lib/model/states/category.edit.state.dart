import 'package:balance/model/dto/category.dto.dart';
import 'package:flutter/material.dart';

class CategoryEditState {
  Color? color;
  bool credit = true;

  CategoryEditState._();

  factory CategoryEditState.create(Category? dto) {
    final state = CategoryEditState._();
    if (dto != null) {
      state.color = dto.color;
      state.credit = dto.credit;
    }
    return state;
  }

  Category getCategory({int id = 0, required String name}) {
    return Category(id: id, name: name, color: color, credit: credit);
  }
}

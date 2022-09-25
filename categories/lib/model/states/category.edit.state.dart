import 'package:categories/model/category.dao.dart';
import 'package:categories/model/category.dto.dart';
import 'package:flutter/material.dart';

class CategoryEditState with ChangeNotifier {
  final Category _state = Category(name: "", color: Colors.red);

  CategoryEditState._();

  factory CategoryEditState.from({Category? dto}) {
    final state = CategoryEditState._();
    if (dto != null) {
      state._state.id = dto.id;
      state._state.name = dto.name;
      state._state.color = dto.color;
      state._state.createAt = dto.createAt;
    }
    return state;
  }

  setName(String name) {
    _state.name = name;
    notifyListeners();
  }

  setColor(Color color) {
    _state.color = color;
    notifyListeners();
  }

  setCreation(DateTime date) {
    _state.createAt = date;
    notifyListeners();
  }

  save() async {
    CategoryDao().save(_state);
  }
}

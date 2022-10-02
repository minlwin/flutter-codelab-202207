import 'package:categories/model/category.dao.dart';
import 'package:categories/model/category.dto.dart';
import 'package:flutter/material.dart';

class CategoryEditState {
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

  get name => _state.name;
  get color => _state.color;
  get creation => _state.createAt;

  setColor(Color color) {
    _state.color = color;
  }

  setCreation(DateTime date) {
    _state.createAt = date;
  }

  save(String name) async {
    _state.name = name;
    await CategoryDao().save(_state);
  }
}

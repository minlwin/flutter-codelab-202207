import 'package:balance/model/db/balance.db.dart';
import 'package:balance/model/dto/category.dto.dart';
import 'package:flutter/material.dart';

class CategoryModel with ChangeNotifier {
  Future save(Category dto) async {
    final db = await BalanceDb.instance.database;
    if (dto.id == 0) {
      await db.insert("category", dto.toMap());
    } else {
      await db.update("category", dto.toMap(),
          where: "id = ?", whereArgs: [dto.id]);
    }
    notifyListeners();
  }

  Future<List<Category>> getAll() async {
    final db = await BalanceDb.instance.database;
    final result = await db.query("category");
    return Category.list(result);
  }
}

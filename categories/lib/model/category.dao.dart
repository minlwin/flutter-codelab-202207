import 'package:categories/model/category.db.dart';
import 'package:categories/model/category.dto.dart';

class CategoryDao {
  save(Category dto) async {
    final db = await CategoryDb.instance.getDatabase();
    if (dto.id == 0) {
      db.insert("category", dto.params());
    } else {
      db.update("category", dto.params(), where: "id = ?", whereArgs: [dto.id]);
    }
  }

  Future<List<Category>> getAll() async {
    final db = await CategoryDb.instance.getDatabase();
    final result = await db.query("category");
    return Category.list(result);
  }
}

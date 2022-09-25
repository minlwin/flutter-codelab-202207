import 'package:sqflite/sqflite.dart';

class CategoryDb {
  Future<Database> getDatabase() async {
    return _database ??= await _open();
  }

  CategoryDb._();

  static CategoryDb instance = CategoryDb._();

  Database? _database;

  Future<Database> _open() async {
    return await openDatabase(
      "${getDatabasesPath()}/com.jdc.category.db",
      version: 1,
      onCreate: (db, version) {
        db.execute("""
        create table category (
          id integer primary key AUTOINCREMENT,
          name varchar(20) not null,
          color integer,
          create_at integer
        )
        """);
      },
    );
  }
}

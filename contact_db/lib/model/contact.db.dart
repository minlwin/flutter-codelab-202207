import 'package:sqflite/sqflite.dart';

class ContactDb {
  final dbName = "com.jdc.contact.db";
  final version = 1;

  Database? _database;

  ContactDb._();

  static ContactDb instance = ContactDb._();

  Future<Database> get database async {
    return _database ??= await _init();
  }

  Future<Database> _init() async {
    return await openDatabase(
      "${await getDatabasesPath()}/$dbName",
      version: version,
      onCreate: (db, version) {
        db.execute(ddl);
      },
    );
  }
}

const ddl = '''
            create table contact (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name varchar(20) not null,
              phone varchar(15) not null,
              email varchar(40) not null
            );
            ''';

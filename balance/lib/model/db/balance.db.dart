import 'package:sqflite/sqflite.dart';

const categoryTable = """
  create table category (
    id integer PRIMARY KEY AUTOINCREMENT,
    name varchar(20) not null,
    color integer,
    text_color integer,
    credit integer default 1
  )""";

const balanceTable = """
  create table balance(
    id integer PRIMARY KEY AUTOINCREMENT,
    category_id integer,
    create_at integer,
    remark text,
    foreign key (category_id) references category(id)
  )""";

const detailsTable = """
  create table details (
    id integer PRIMARY KEY AUTOINCREMENT,
    balance_id integer,
    item varchar(40),
    amount integer,
    foreign key (balance_id) references balance(id)
  )""";

class BalanceDb {
  final dbPath = "com.jdc.balance.db";
  final version = 1;

  BalanceDb._();
  static BalanceDb instance = BalanceDb._();

  Database? _database;

  Future<Database> get database async => _database ??= await _open();

  Future<Database> _open() async {
    return await openDatabase(
      "${getDatabasesPath()}/$dbPath",
      version: version,
      onCreate: (db, version) {
        db.execute(categoryTable);
        db.execute(balanceTable);
        db.execute(detailsTable);
      },
    );
  }
}

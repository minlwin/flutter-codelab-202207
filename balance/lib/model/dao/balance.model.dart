import 'package:balance/model/db/balance.db.dart';
import 'package:balance/model/dto/balance.details.dto.dart';
import 'package:balance/model/dto/balance.dto.dart';
import 'package:balance/model/dto/details.dto.dart';

class BalanceModel {
  final table = "balance";
  BalanceModel._();

  static BalanceModel instance = BalanceModel._();

  final tableJoin =
      "balance b join details d on b.id = d.balance_id join category c on b.category_id = c.id";
  final columns = [
    "b.id balance_id",
    "b.create_at",
    "b.remark",
    "b.category_id",
    "c.name category_name",
    "c.color",
    "c.credit",
    "sum(d.amount) total"
  ];
  final groupBy =
      "b.id, b.create_at, b.remark, b.category_id, c.name, c.color, c.credit";

  Future<int> save(Balance balance, List<Details> detailsList) async {
    final db = await BalanceDb.instance.database;

    await db.transaction((txn) async {
      if (balance.id == 0) {
        balance.id = await txn.insert(table, balance.toMap());
        for (final item in detailsList) {
          item.balance = balance;
          balance.total += item.amount;
          await txn.insert("details", item.toMap());
        }
      } else {
        await txn.update(table, balance.toMap(),
            where: "id = ?", whereArgs: [balance.id]);
        for (final item in detailsList) {
          item.balance = balance;
          balance.total += item.amount;
          if (item.id == 0) {
            await txn.insert("details", item.toMap());
          } else {
            await txn.update("details", item.toMap(),
                where: "id = ?", whereArgs: [item.id]);
          }
        }
      }
    });
    return balance.id;
  }

  Future<List<Balance>> getBalance(bool credit, int year, int month) async {
    final db = await BalanceDb.instance.database;
    final result = await db.query(
      tableJoin,
      columns: columns,
      groupBy: groupBy,
      where: "c.credit = ? and b.create_at >= ? and b.create_at < ?",
      whereArgs: [
        credit ? 1 : 0,
        DateTime(year, month, 1).millisecondsSinceEpoch,
        DateTime(year, month + 1, 1).millisecondsSinceEpoch
      ],
      orderBy: "b.create_at",
    );
    return Balance.list(result);
  }

  Future<List<Balance>> getTrialBalance(int year, int month) async {
    final db = await BalanceDb.instance.database;
    final result = await db.query(
      tableJoin,
      columns: columns,
      groupBy: groupBy,
      where: "b.create_at >= ? and b.create_at < ?",
      whereArgs: [
        DateTime(year, month, 1).millisecondsSinceEpoch,
        DateTime(year, month + 1, 1).millisecondsSinceEpoch
      ],
      orderBy: "b.create_at",
    );
    return Balance.list(result);
  }

  Future<BalanceWidthDetails?> findById(int id) async {
    final db = await BalanceDb.instance.database;
    final result = await db.query(
      tableJoin,
      columns: columns,
      groupBy: groupBy,
      where: "b.id = ?",
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      final balance = Balance.from(result[0]);

      final detailsForBalance = await db.query(
        "details",
        columns: ["id", "item", "amount"],
        where: "balance_id = ?",
        whereArgs: [id],
      );

      return BalanceWidthDetails(
          balance: balance, details: Details.list(detailsForBalance));
    }

    return null;
  }
}

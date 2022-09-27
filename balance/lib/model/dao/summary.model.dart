import 'package:balance/model/db/balance.db.dart';
import 'package:balance/model/dto/summary.chart.data.dart';

class SummaryModel {
  SummaryModel._();
  static SummaryModel model = SummaryModel._();
  Future<List<SummaryChartData>> getSummaryByType(int year, int month) async {
    final db = await BalanceDb.instance.database;
    final rs = await db.query(
        "balance b join details d on b.id = d.balance_id join category c on b.category_id = c.id",
        columns: ["c.credit", "sum(d.amount) `value`"],
        groupBy: "c.credit",
        where: "b.create_at >= ? and b.create_at < ?",
        whereArgs: [
          DateTime(year, month, 1).millisecondsSinceEpoch,
          DateTime(year, month + 1, 1).millisecondsSinceEpoch
        ]);
    return SummaryChartData.list(rs);
  }

  Future<List<CategorySummary>> getSummaryByCategory(
      int year, int month, bool credit) async {
    final db = await BalanceDb.instance.database;
    final rs = await db.query(
      "balance b join details d on b.id = d.balance_id join category c on b.category_id = c.id",
      columns: [
        "c.id",
        "c.name",
        "c.credit",
        "c.color",
        "sum(d.amount) `total`",
      ],
      groupBy: "c.id, c.name, c.credit, c.color",
      where: "c.credit = ? and b.create_at >= ? and b.create_at < ?",
      whereArgs: [
        credit ? 1 : 0,
        DateTime(year, month, 1).millisecondsSinceEpoch,
        DateTime(year, month + 1, 1).millisecondsSinceEpoch
      ],
      orderBy: "sum(d.amount) desc",
    );
    return CategorySummary.list(rs);
  }
}

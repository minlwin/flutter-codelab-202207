import 'package:balance/model/dto/category.dto.dart';

class SummaryChartData {
  final String name;
  final int value;

  SummaryChartData(this.name, this.value);

  String get title => "$name\n$value";

  factory SummaryChartData.from(Map<String, dynamic> map) => SummaryChartData(
        map['credit'] == 1 ? 'Credit' : 'Debit',
        map['value'],
      );

  static List<SummaryChartData> list(List<Map<String, dynamic>> result) =>
      List.from(result.map((e) => SummaryChartData.from(e)));
}

class CategorySummary {
  final Category category;
  final int total;

  CategorySummary({required this.category, required this.total});

  factory CategorySummary.from(Map<String, dynamic> map) => CategorySummary(
        category: Category.from(map),
        total: map['total'],
      );

  static List<CategorySummary> list(List<Map<String, dynamic>> result) =>
      List.from(result.map((e) => CategorySummary.from(e)));
}

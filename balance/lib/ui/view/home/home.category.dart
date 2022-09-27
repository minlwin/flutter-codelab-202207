import 'package:balance/model/dao/summary.model.dart';
import 'package:balance/model/dto/summary.chart.data.dart';
import 'package:balance/model/states/year_mont.trial.state.dart';
import 'package:balance/ui/widget/error.widget.dart';
import 'package:balance/ui/widget/loading.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../extensions.dart';

class HomeCategory extends StatelessWidget {
  static const creditTitle = "Credit";
  static const debitTitle = "Debit";

  final bool credit;
  const HomeCategory(this.credit, {super.key});

  @override
  Widget build(BuildContext context) {
    final yearMonth = context.watch<YearMonthTrial>();
    return FutureBuilder(
      future: SummaryModel.model
          .getSummaryByCategory(yearMonth.year, yearMonth.month, credit),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const AppError();
        }

        if (snapshot.hasData) {
          return HomeCategoryChild(
              credit, snapshot.data as List<CategorySummary>);
        }

        return const Loading();
      },
    );
  }
}

class HomeCategoryChild extends StatelessWidget {
  final List<CategorySummary> list;
  const HomeCategoryChild(this.credit, this.list, {super.key});

  final bool credit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            credit ? 'CREDIT' : 'DEBIT',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            list.map((e) => e.total).reduce((a, b) => a + b).mmk,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final item = list[index];
                return ListTile(
                  tileColor: item.category.color,
                  title: Text(
                    item.category.name ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    item.total.mmk,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemCount: list.length,
            ),
          ),
        ],
      ),
    );
  }
}

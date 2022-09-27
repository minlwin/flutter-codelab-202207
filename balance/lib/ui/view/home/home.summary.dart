import 'package:balance/model/dao/summary.model.dart';
import 'package:balance/model/dto/summary.chart.data.dart';
import 'package:balance/model/states/selection.state.dart';
import 'package:balance/model/states/year_mont.trial.state.dart';
import 'package:balance/ui/widget/error.widget.dart';
import 'package:balance/ui/widget/loading.widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../extensions.dart';

class HomeSummary extends StatelessWidget {
  static const String title = "Home";
  const HomeSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<YearMonthTrial>();
    return FutureBuilder(
      future: SummaryModel.model.getSummaryByType(state.year, state.month),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const AppError();
        }

        if (snapshot.hasData) {
          return ChangeNotifierProvider(
            create: (context) => SelectionState(),
            child: HomeSummaryChild(snapshot.data!),
          );
        }

        return const Loading();
      },
    );
  }
}

class HomeSummaryChild extends StatelessWidget {
  final List<SummaryChartData> data;
  const HomeSummaryChild(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final selection = context.read<SelectionState>();
    final selected = context.watch<SelectionState>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "MONEY is",
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          "Not only for save & use",
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          "Manage it!",
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: MediaQuery.of(context).size.width / 10 * 7,
          child: PieChart(
            PieChartData(
              startDegreeOffset: 270,
              pieTouchData: PieTouchData(
                enabled: true,
                touchCallback: (event, response) {
                  if (!event.isInterestedForInteractions &&
                      null != response &&
                      null != response.touchedSection &&
                      response.touchedSection!.touchedSectionIndex >= 0) {
                    selection
                        .select(response.touchedSection!.touchedSectionIndex);
                  }
                },
              ),
              sections: List.from(data.map((e) => PieChartSectionData(
                    value: e.value.toDouble(),
                    title: e.title,
                    color: e.name == "Credit" ? Colors.blue : Colors.red,
                    titleStyle: const TextStyle(color: Colors.white),
                    radius: data.length < 2
                        ? 100
                        : data[selected.selected].name == e.name
                            ? 110
                            : 100,
                  ))),
              centerSpaceRadius: 30,
              sectionsSpace: 4,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          data.isEmpty
              ? "No Data"
              : data
                  .map((e) => e.name == "Credit" ? e.value : 0 - e.value)
                  .reduce((value, element) => value + element)
                  .mmk,
          style: Theme.of(context).textTheme.headline5,
        )
      ],
    );
  }
}

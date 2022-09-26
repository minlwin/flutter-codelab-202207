import 'package:balance/model/dao/balance.model.dart';
import 'package:balance/model/dto/balance.dto.dart';
import 'package:balance/model/states/year_mont.trial.state.dart';
import 'package:balance/ui/widget/bottom.nav.bar.dart';
import 'package:balance/ui/widget/error.widget.dart';
import 'package:balance/ui/widget/loading.widget.dart';
import 'package:balance/ui/widget/sidebar.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../extensions.dart';

class TrialBalanceView extends StatelessWidget {
  const TrialBalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => YearMonthTrial(),
      child: const TrialBalanceChild(),
    );
  }
}

class TrialBalanceChild extends StatelessWidget {
  const TrialBalanceChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Trial Balance"),
            Text(
              context.watch<YearMonthTrial>().title,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
      drawer: const Sidebar(),
      body: const TrialBalanceFuture(),
    );
  }
}

class TrialBalanceFuture extends StatelessWidget {
  const TrialBalanceFuture({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<YearMonthTrial>();
    return FutureBuilder(
      future: BalanceModel.instance.getTrialBalance(state.year, state.month),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const AppError();
        }

        if (snapshot.hasData) {
          final list = snapshot.data as List<Balance>;
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        TrialBalanceItem(list[index]),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: list.length),
              ),
              BottomNavBar(controls: [
                IconButton(
                  onPressed: () {
                    state.previous();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  _value(list).mmk,
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  onPressed: () {
                    state.next();
                  },
                  icon: const Icon(Icons.arrow_forward),
                )
              ]),
            ],
          );
        }

        return const Loading();
      },
    );
  }

  int _value(List<Balance> list) {
    return list.isEmpty
        ? 0
        : list
            .map((e) => e.category!.credit ? e.total : 0 - e.total)
            .reduce((value, element) => value + element);
  }
}

class TrialBalanceItem extends StatelessWidget {
  final Balance item;
  const TrialBalanceItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: item.category!.color,
        child: Text(item.category!.title),
      ),
      title: Text(item.remark),
      subtitle: Text(item.createAt!.label),
      trailing: Text(
        "${item.total.mmk} ${item.category!.credit ? '+' : '-'}",
        style: TextStyle(
            color: item.category!.credit ? Colors.black : Colors.grey),
      ),
    );
  }
}

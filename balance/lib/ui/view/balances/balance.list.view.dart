import 'package:balance/app/routes.dart';
import 'package:balance/model/dto/balance.dto.dart';
import 'package:balance/model/states/balance.list.state.dart';
import 'package:balance/model/states/balance.model.dart';
import 'package:balance/model/states/year_month.state.dart';
import 'package:balance/ui/widget/error.widget.dart';
import 'package:balance/ui/widget/loading.widget.dart';
import 'package:balance/ui/widget/sidebar.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../extensions.dart';

class BalanceList extends StatelessWidget {
  final bool credit;
  const BalanceList({super.key, required this.credit});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => YearMonthState(credit)),
        Provider(create: (context) => BalanceListState())
      ],
      child: BalanceListChild(credit),
    );
  }
}

class BalanceListChild extends StatelessWidget {
  final bool credit;
  const BalanceListChild(this.credit, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(credit ? "Credits" : "Debits"),
            Text(
              context.watch<YearMonthState>().title,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(credit ? routeCreditsEdit : routeDebitsEdit);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const Sidebar(),
      body: const BalanceListBody(),
    );
  }
}

class BalanceListBody extends StatelessWidget {
  const BalanceListBody({super.key});

  @override
  Widget build(BuildContext context) {
    final yearMonthState = context.watch<YearMonthState>();
    final balanceModel = context.watch<BalanceModel>();
    return FutureBuilder(
      future: balanceModel.getBalance(
        yearMonthState.credit,
        yearMonthState.year,
        yearMonthState.month,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const AppError();
        }

        if (snapshot.hasData) {
          final list = snapshot.data as List<Balance>;
          context.read<BalanceListState>().result = list;
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        BalanceListItem(list[index]),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: list.length),
              ),
              const BalanceSummaryControl()
            ],
          );
        }

        return const Loading();
      },
    );
  }
}

class BalanceSummaryControl extends StatelessWidget {
  const BalanceSummaryControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.read<YearMonthState>().previous();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Text(
              context.watch<BalanceListState>().total,
              style: Theme.of(context).textTheme.headline5,
            ),
            IconButton(
              onPressed: () {
                context.read<YearMonthState>().next();
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

class BalanceListItem extends StatelessWidget {
  final Balance dto;
  const BalanceListItem(this.dto, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: dto.category!.color,
        child: Text(
          dto.category!.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(dto.remark),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(dto.createAt!.label),
          Text(dto.total.mmk),
        ],
      ),
    );
  }
}

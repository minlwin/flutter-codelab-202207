import 'package:balance/app/routes.dart';
import 'package:balance/model/dao/balance.model.dart';
import 'package:balance/model/dto/balance.dto.dart';
import 'package:balance/model/states/year_month.state.dart';
import 'package:balance/ui/view/balances/balance.details.view.dart';
import 'package:balance/ui/widget/bottom.nav.bar.dart';
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
    return ChangeNotifierProvider(
      create: (context) => YearMonthState(credit),
      child: BalanceListChild(credit),
    );
  }
}

class BalanceListChild extends StatelessWidget {
  final bool credit;
  const BalanceListChild(this.credit, {super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<YearMonthState>();
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
            onPressed: () async {
              await Navigator.of(context)
                  .pushNamed(credit ? routeCreditsEdit : routeDebitsEdit);
              notifier.reload();
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
    return FutureBuilder(
      future: BalanceModel.instance.getBalance(
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
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        BalanceListItem(list[index]),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: list.length),
              ),
              BottomNavBar(
                controls: [
                  IconButton(
                    onPressed: () {
                      context.read<YearMonthState>().previous();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    _getTotal(list).mmk,
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<YearMonthState>().next();
                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              )
            ],
          );
        }

        return const Loading();
      },
    );
  }

  int _getTotal(List<Balance> list) {
    return list.isEmpty
        ? 0
        : list.map((e) => e.total).reduce((value, element) => value + element);
  }
}

class BalanceListItem extends StatelessWidget {
  final Balance dto;
  const BalanceListItem(this.dto, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BalanceDetails(id: dto.id),
        ));
      },
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

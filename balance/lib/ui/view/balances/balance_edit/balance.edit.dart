import 'package:balance/model/dto/balance.details.dto.dart';
import 'package:balance/model/states/balance.edit.state.dart';
import 'package:balance/model/states/nested.pager.state.dart';
import 'package:balance/ui/view/balances/balance_edit/balance.confirm.dart';
import 'package:balance/ui/view/balances/balance_edit/category.select.dart';
import 'package:balance/ui/view/balances/balance_edit/details.edit.dart';
import 'package:balance/ui/view/balances/balance_edit/details.list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BalanceEditView extends StatelessWidget {
  final bool credit;

  const BalanceEditView({super.key, required this.credit});

  @override
  Widget build(BuildContext context) {
    final dto =
        ModalRoute.of(context)?.settings.arguments as BalanceWidthDetails?;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => NestedPagerState([
                    "Select Category",
                    "Balance Items",
                    "Add Item",
                    "Confirm",
                  ])),
          ChangeNotifierProvider(
              create: (context) => dto == null
                  ? BalanceEditState.forAddNew(credit)
                  : BalanceEditState.forEdit(dto)),
        ],
        child: const BalanceEditBody(),
      ),
    );
  }
}

class BalanceEditBody extends StatelessWidget {
  const BalanceEditBody({super.key});

  @override
  Widget build(BuildContext context) {
    final pager = context.watch<NestedPagerState>();
    final state = context.watch<BalanceEditState>();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${state.credit ? 'Credit' : 'Debit'} - ${pager.pageTitle}"),
            const BalanceSummary(),
          ],
        ),
      ),
      body: _getPage(pager.page),
    );
  }

  Widget _getPage(int page) {
    if (page == 0) {
      return const CategorySelect();
    }

    if (page == 1) {
      return const DetailsList();
    }

    if (page == 2) {
      return DetailsEdit();
    }

    return BalanceConfirm();
  }
}

class BalanceSummary extends StatelessWidget {
  const BalanceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BalanceEditState>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          state.category?.name ?? "Undefine Category",
          style: const TextStyle(fontSize: 14),
        ),
        Text(
          "${state.total} MMK",
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

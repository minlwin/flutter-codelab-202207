import 'package:balance/model/states/balance.edit.state.dart';
import 'package:balance/model/states/nested.pager.state.dart';
import 'package:balance/ui/view/balances/balance_edit/sub/balance.confirm.dart';
import 'package:balance/ui/view/balances/balance_edit/sub/category.select.dart';
import 'package:balance/ui/view/balances/balance_edit/sub/details.edit.dart';
import 'package:balance/ui/widget/bottom.nav.bar.dart';
import 'package:balance/ui/widget/controls.button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailsList extends StatelessWidget {
  static const String title = "Details List";

  const DetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BalanceEditState>();
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text(state.detailsList[index].item),
                    subtitle: Text(
                        "${NumberFormat("#,##0").format(state.detailsList[index].amount)} MMK"),
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.detailsList.length),
        ),
        BottomNavBar(controls: [
          ControlsButton(
            icon: Icons.discount_outlined,
            label: "Categories",
            action: () {
              context.read<NestedPagerState>().change(CategorySelect.title);
            },
          ),
          ControlsButton(
            icon: Icons.add,
            label: "Add Item",
            action: () {
              context.read<NestedPagerState>().change(DetailsEdit.title);
            },
          ),
          ControlsButton(
            icon: Icons.check,
            label: "Confirm",
            action: () {
              context.read<NestedPagerState>().change(BalanceConfirm.title);
            },
          )
        ]),
      ],
    );
  }
}

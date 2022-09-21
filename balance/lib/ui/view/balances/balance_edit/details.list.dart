import 'package:balance/model/states/balance.edit.state.dart';
import 'package:balance/model/states/nested.pager.state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailsList extends StatelessWidget {
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
        const DetailsListControls(),
      ],
    );
  }
}

class DetailsListControls extends StatelessWidget {
  const DetailsListControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  context.read<NestedPagerState>().page = 0;
                },
                child: const Text("Categories"),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: const Text("Save"),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  context.read<NestedPagerState>().page = 2;
                },
                child: const Text("Add Item"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

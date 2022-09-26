import 'dart:developer';

import 'package:balance/model/dao/category.model.dart';
import 'package:balance/model/dto/category.dto.dart';
import 'package:balance/model/states/balance.edit.state.dart';
import 'package:balance/model/states/nested.pager.state.dart';
import 'package:balance/ui/view/balances/balance_edit/sub/details.edit.dart';
import 'package:balance/ui/view/balances/balance_edit/sub/details.list.dart';
import 'package:balance/ui/widget/bottom.nav.bar.dart';
import 'package:balance/ui/widget/controls.button.dart';
import 'package:balance/ui/widget/error.widget.dart';
import 'package:balance/ui/widget/loading.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorySelect extends StatelessWidget {
  static const String title = "Select Category";

  const CategorySelect({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BalanceEditState>();
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: CategoryModel.instance.findByType(state.credit),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                log(snapshot.error.toString());
                return const AppError();
              }

              if (snapshot.hasData) {
                final list = snapshot.data as List<Category>;
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index) =>
                      CategorySelectItem(list[index]),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: list.length,
                );
              }

              return const Loading();
            },
          ),
        ),
        BottomNavBar(controls: [
          ControlsButton(
            icon: Icons.list,
            label: "Item List",
            action: () {
              context.read<NestedPagerState>().change(DetailsList.title);
            },
          ),
          ControlsButton(
            icon: Icons.add,
            label: "Item List",
            action: () {
              context.read<NestedPagerState>().change(DetailsEdit.title);
            },
          ),
        ])
      ],
    );
  }
}

class CategorySelectItem extends StatelessWidget {
  final Category dto;
  const CategorySelectItem(this.dto, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: dto.color,
        child: Text(dto.title),
      ),
      title: Text(dto.name ?? "Category"),
      onTap: () {
        final state = context.read<BalanceEditState>();
        state.category = dto;

        context.read<NestedPagerState>().change(
            state.detailsList.isEmpty ? DetailsEdit.title : DetailsList.title);
      },
    );
  }
}

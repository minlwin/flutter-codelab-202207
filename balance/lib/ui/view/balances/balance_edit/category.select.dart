import 'dart:developer';

import 'package:balance/model/dto/category.dto.dart';
import 'package:balance/model/states/balance.edit.state.dart';
import 'package:balance/model/states/category.model.dart';
import 'package:balance/model/states/nested.pager.state.dart';
import 'package:balance/ui/widget/error.widget.dart';
import 'package:balance/ui/widget/loading.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorySelect extends StatelessWidget {
  const CategorySelect({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BalanceEditState>();
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: context.watch<CategoryModel>().findByType(state.credit),
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
        const CategorySelectControl()
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
      title: Text(dto.name),
      onTap: () {
        final state = context.read<BalanceEditState>();
        state.category = dto;

        context.read<NestedPagerState>().page =
            state.detailsList.isEmpty ? 2 : 1;
      },
    );
  }
}

class CategorySelectControl extends StatelessWidget {
  const CategorySelectControl({super.key});

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
                  context.read<NestedPagerState>().page = 1;
                },
                child: const Text("Details Items"),
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

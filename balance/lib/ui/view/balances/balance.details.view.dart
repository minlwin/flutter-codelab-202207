import 'package:balance/model/dao/balance.model.dart';
import 'package:balance/model/dto/balance.dto.dart';
import 'package:balance/model/dto/details.dto.dart';
import 'package:balance/ui/widget/error.widget.dart';
import 'package:balance/ui/widget/loading.widget.dart';
import 'package:flutter/material.dart';

import '../../extensions.dart';

class BalanceDetails extends StatelessWidget {
  final int id;
  const BalanceDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BalanceModel.instance.findById(id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const AppError();
        }

        if (snapshot.hasData) {
          if (null == snapshot.data) {
            return const AppError(
              message: "There is no data.",
            );
          }
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                BalanceDetailsAppBar(snapshot.data!.balance),
                BalanceDetailsBody(snapshot.data!.details),
              ],
            ),
          );
        }
        return const Loading();
      },
    );
  }
}

class BalanceDetailsAppBar extends StatelessWidget {
  final Balance dto;
  const BalanceDetailsAppBar(this.dto, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 4,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: BalanceSummary(dto),
        title: Text(dto.remark),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
      ],
    );
  }
}

class BalanceSummary extends StatelessWidget {
  final Balance balance;
  const BalanceSummary(this.balance, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.shopping_cart,
                size: MediaQuery.of(context).size.width / 4,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    balance.total.mmk,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                ),
                Text(
                  balance.category!.name,
                  style: TextStyle(color: Colors.grey.shade100),
                ),
                Text(
                  balance.category!.credit ? 'Credit' : 'Debit',
                  style: TextStyle(color: Colors.grey.shade100),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BalanceDetailsBody extends StatelessWidget {
  final List<Details> detailsList;
  const BalanceDetailsBody(this.detailsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final dto = detailsList[index];
        return ListTile(
          leading: CircleAvatar(child: Text("${index + 1}")),
          title: Text(dto.item),
          subtitle: Text(dto.amount.mmk),
        );
      }, childCount: detailsList.length),
    );
  }
}

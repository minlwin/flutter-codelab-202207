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
      expandedHeight: MediaQuery.of(context).size.width / 2,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(dto.remark),
        collapseMode: CollapseMode.parallax,
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

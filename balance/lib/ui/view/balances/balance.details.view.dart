import 'package:balance/model/states/balance.model.dart';
import 'package:balance/ui/widget/error.widget.dart';
import 'package:balance/ui/widget/loading.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BalanceDetails extends StatelessWidget {
  final int id;
  const BalanceDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<BalanceModel>();
    return FutureBuilder(
      future: model.findById(id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const AppError();
        }

        if (snapshot.hasData) {}
        return const Loading();
      },
    );
  }
}

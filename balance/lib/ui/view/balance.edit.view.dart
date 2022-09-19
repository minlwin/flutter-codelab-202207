import 'package:balance/ui/widget/sub.view.dart';
import 'package:flutter/material.dart';

class BalanceEditView extends StatelessWidget {
  final bool credit;

  const BalanceEditView({super.key, required this.credit});

  @override
  Widget build(BuildContext context) {
    return SubView(
      title: "Edit ${credit ? 'Credit' : 'Debit'}",
      child: const BalanceEditBody(),
    );
  }
}

class BalanceEditBody extends StatelessWidget {
  const BalanceEditBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

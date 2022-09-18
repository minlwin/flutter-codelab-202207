import 'package:balance/ui/widget/sidebar.widget.dart';
import 'package:flutter/material.dart';

class BalanceList extends StatelessWidget {
  final bool credit;
  const BalanceList({super.key, required this.credit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(credit ? "Credits" : "Debits")),
      drawer: const Sidebar(),
      body: const BalanceListBody(),
    );
  }
}

class BalanceListBody extends StatelessWidget {
  const BalanceListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

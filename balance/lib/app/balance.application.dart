import 'package:balance/app/routes.dart';
import 'package:balance/ui/view/balance.list.view.dart';
import 'package:balance/ui/view/home.view.dart';
import 'package:flutter/material.dart';

class BalanceApp extends StatelessWidget {
  const BalanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        routeHome: (context) => const HomeView(),
        routeCredits: (context) => const BalanceList(credit: true),
        routeDebits: (context) => const BalanceList(credit: false),
      },
      initialRoute: routeHome,
    );
  }
}

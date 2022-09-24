import 'package:balance/app/routes.dart';
import 'package:balance/ui/view/balances/balance.list.view.dart';
import 'package:balance/ui/view/balances/balance_edit/balance.edit.dart';
import 'package:balance/ui/view/categories/category.edit.view.dart';
import 'package:balance/ui/view/categories/category.view.dart';
import 'package:balance/ui/view/home.view.dart';
import 'package:balance/ui/view/settings.view.dart';
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
        routeCreditsEdit: (context) => const BalanceEditView(credit: true),
        routeDebits: (context) => const BalanceList(credit: false),
        routeDebitsEdit: (context) => const BalanceEditView(credit: false),
        routeCategories: (context) => const CagtegoryView(),
        routeCategoriesEdit: (context) => const CategoryEditView(),
        routeSettings: (context) => const SettingsView(),
      },
      initialRoute: routeHome,
    );
  }
}

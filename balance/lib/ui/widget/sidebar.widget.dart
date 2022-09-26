import 'package:balance/app/routes.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            child: Icon(
              Icons.bar_chart,
              color: Colors.white,
              size: 42,
            ),
          ),
          accountName: Text("My Balance"),
          accountEmail: Text("Java Developer Class"),
        ),
        Column(
          children: [
            _menuItem(context, "Home", routeHome, Icons.home_outlined),
            _menuItem(context, "Categories", routeCategories,
                Icons.discount_outlined),
            _menuItem(context, "Credits", routeCredits, Icons.arrow_upward),
            _menuItem(context, "Debits", routeDebits, Icons.arrow_downward),
            _menuItem(context, "Trail Balance", routeTrial, Icons.bar_chart),
          ],
        )
      ]),
    );
  }

  Widget _menuItem(
          BuildContext context, String name, String route, IconData icons) =>
      ListTile(
        leading: Icon(icons),
        title: Text(name),
        onTap: () => Navigator.of(context).pushReplacementNamed(route),
      );
}

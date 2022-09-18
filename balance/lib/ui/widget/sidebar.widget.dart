import 'package:balance/app/routes.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        const UserAccountsDrawerHeader(
          currentAccountPicture: Icon(
            Icons.wallet,
            color: Colors.white,
            size: 64,
          ),
          accountName: Text("My Balance"),
          accountEmail: Text("Java Developer Class"),
        ),
        Expanded(
          child: ListView(
            children: [
              _menuItem(context, "Home", routeHome),
              _menuItem(context, "Credits", routeCredits),
              _menuItem(context, "Debits", routeDebits),
            ],
          ),
        )
      ]),
    );
  }

  Widget _menuItem(BuildContext context, String name, String route) => ListTile(
        title: Text(name),
        onTap: () => Navigator.of(context).pushReplacementNamed(route),
      );
}

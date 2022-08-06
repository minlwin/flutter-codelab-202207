import 'package:flutter/material.dart';
import 'package:navdemo/pages/grid_demo.dart';
import 'package:navdemo/pages/image_demo.dart';
import 'package:navdemo/pages/list_demo.dart';

void main(List<String> args) {
  runApp(const NavApplication());
}

class NavApplication extends StatelessWidget {
  const NavApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/list": (context) => const ListDemo(),
        "/grid": (context) => const GridDemo(),
        "/image": (context) => const ImageDemo(),
      },
      initialRoute: "/list",
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navdemo/navigation/sidebar.dart';

class GridDemo extends StatelessWidget {
  const GridDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View"),
      ),
      drawer: const Drawer(child: SideBar()),
      body: Container(),
    );
  }
}

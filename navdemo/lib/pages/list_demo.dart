import 'package:flutter/material.dart';
import 'package:navdemo/navigation/sidebar.dart';

class ListDemo extends StatelessWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View"),
      ),
      drawer: const Drawer(child: SideBar()),
      body: Container(),
    );
  }
}

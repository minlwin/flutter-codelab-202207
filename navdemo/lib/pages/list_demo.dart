import 'package:flutter/material.dart';
import 'package:navdemo/navigation/sidebar.dart';
import 'package:navdemo/states/divisions.dart';

class ListDemo extends StatelessWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View"),
        actions: [
          IconButton(
            onPressed: () async {
              _loadInputDialog(context);
            },
            icon: const Icon(Icons.add),
            padding: const EdgeInsets.only(right: 8),
          ),
        ],
      ),
      drawer: const Drawer(child: SideBar()),
      body: Container(),
    );
  }

  _loadInputDialog(BuildContext context) async {
    final controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text("Create Devision"),
        titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        contentPadding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Divisions",
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(
            onPressed: () {
              Divisions.of().add(controller.text);
              Navigator.of(context).pop();
            },
            child: const Text("Save"),
          )
        ],
      ),
    );
  }
}

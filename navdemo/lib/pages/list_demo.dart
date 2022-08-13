import 'package:flutter/material.dart';
import 'package:navdemo/navigation/sidebar.dart';
import 'package:navdemo/states/divisions.dart';

class ListDemo extends StatefulWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  State<ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View"),
        actions: [
          IconButton(
            onPressed: () async {
              await _loadInputDialog(context);
              setState(() {});
            },
            icon: const Icon(Icons.add),
            padding: const EdgeInsets.only(right: 8),
          ),
        ],
      ),
      drawer: const Drawer(child: SideBar()),
      body: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.topCenter,
        child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              child: Text(Divisions.instance.list[index].id.toString()),
            ),
            title: Text(Divisions.instance.list[index].name),
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: Divisions.instance.list.length,
        ),
      ),
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
              Divisions.instance.add(controller.text);
              Navigator.of(context).pop();
            },
            child: const Text("Save"),
          )
        ],
      ),
    );
  }
}

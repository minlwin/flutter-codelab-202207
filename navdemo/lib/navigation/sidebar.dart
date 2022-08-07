import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text("Navigation Demo"),
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: const Text("List Demo"),
          onTap: () {
            Navigator.of(context).pushReplacementNamed("/list");
          },
        ),
        ListTile(
          leading: const Icon(Icons.grid_3x3),
          title: const Text("Grid Demo"),
          onTap: () {
            Navigator.of(context).pushReplacementNamed("/grid");
          },
        ),
        ListTile(
          leading: const Icon(Icons.image),
          title: const Text("Image Demo"),
          onTap: () {
            Navigator.of(context).pushReplacementNamed("/image");
          },
        ),
      ],
    );
  }
}

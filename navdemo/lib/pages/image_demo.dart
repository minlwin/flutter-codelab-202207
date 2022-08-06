import 'package:flutter/material.dart';
import 'package:navdemo/navigation/sidebar.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Demo"),
      ),
      drawer: const Drawer(child: SideBar()),
      body: Container(),
    );
  }
}

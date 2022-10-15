import 'package:flutter/material.dart';
import 'package:locations/views/states.view.dart';

void main(List<String> args) {
  runApp(const LocationApp());
}

class LocationApp extends StatelessWidget {
  const LocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StateListView(),
    );
  }
}

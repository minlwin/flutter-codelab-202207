import 'package:flutter/material.dart';
import 'package:stateful/counter.dart';

void main(List<String> args) {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.add),
          title: const Text("Counter"),
          backgroundColor: Colors.deepOrange.shade600,
        ),
        body: const Counter(),
      ),
    );
  }
}

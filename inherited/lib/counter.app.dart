import 'package:flutter/material.dart';
import 'package:inherited/counter.state.dart';
import 'package:inherited/counter.view.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Inherited Counter"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterSate(
              count,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: CounterView(),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              width: 300,
              height: 60,
              child: OutlinedButton(
                onPressed: countUp,
                child: const Text("Count Up"),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              width: 300,
              height: 60,
              child: OutlinedButton(
                onPressed: reset,
                child: const Text("Reset"),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              width: 300,
              height: 60,
              child: OutlinedButton(
                onPressed: countDown,
                child: const Text("Count Down"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  countUp() {
    setState(() {
      count++;
    });
  }

  countDown() {
    setState(() {
      count--;
    });
  }

  reset() {
    setState(() {
      count = 0;
    });
  }
}

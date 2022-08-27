import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ctr/counter.state.dart';
import 'package:provider_ctr/counter.view.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterState(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CounterView(),
        ),
      ),
    );
  }
}

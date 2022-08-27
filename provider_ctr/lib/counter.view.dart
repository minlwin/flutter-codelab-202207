import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ctr/counter.state.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Provider Counter",
            style: Theme.of(context).textTheme.headline5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              context.watch<CounterState>().count.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 12),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                context.read<CounterState>().countUp();
              },
              child: const Text("Count Up"),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 12),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                context.read<CounterState>().reset();
              },
              child: const Text("Reset"),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 12),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            child: OutlinedButton(
              onPressed: () {
                context.read<CounterState>().countDown();
              },
              child: const Text("Count Down"),
            ),
          ),
        ],
      ),
    );
  }
}

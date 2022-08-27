import 'package:flutter/material.dart';
import 'package:inherited/counter.state.dart';

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
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              "Inheriated Counter",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Text(
            CounterSate.of(context).count.toString(),
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Text(
              count.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _getButton(context, "Count Up", () {
                setState(() {
                  count++;
                });
              }),
              const SizedBox(height: 8),
              _getButton(context, "Reset", () {
                setState(() {
                  count = 0;
                });
              }),
              const SizedBox(height: 8),
              _getButton(context, "Count Down", () {
                setState(() {
                  count--;
                });
              }),
            ],
          )
        ],
      ),
    );
  }

  Widget _getButton(BuildContext context, String name, VoidCallback action) {
    return InkWell(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red.shade400,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        alignment: Alignment.center,
        width: double.infinity,
        height: 60,
        child: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CounterSate extends InheritedWidget {
  final int count;

  const CounterSate(this.count, {super.key, required super.child});

  @override
  bool updateShouldNotify(covariant CounterSate oldWidget) {
    return count != oldWidget.count;
  }

  static CounterSate of(BuildContext context) {
    CounterSate? state =
        context.dependOnInheritedWidgetOfExactType<CounterSate>();
    assert(state != null,
        'You must use counter state under inheritied widget tree.');
    return state!;
  }
}

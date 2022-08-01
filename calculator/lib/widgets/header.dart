import 'package:flutter/material.dart';

class CalculatorHeader extends StatelessWidget {
  const CalculatorHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: const Text(
        "Simple Calculator",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

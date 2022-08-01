import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  final String value;
  const CalculatorDisplay({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      color: Colors.black87,
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 36,
          color: Colors.white,
        ),
      ),
    );
  }
}

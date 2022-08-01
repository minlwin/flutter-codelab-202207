import 'package:calculator/widgets/actions.dart';
import 'package:calculator/widgets/display.dart';
import 'package:calculator/widgets/header.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String value = "0";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 24,
        bottom: 8,
      ),
      child: Column(
        children: [
          const CalculatorHeader(),
          CalculatorDisplay(value: value),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: CalculatorActions(action: pressButton),
            ),
          ),
        ],
      ),
    );
  }

  void pressButton(String label) {
    switch (label) {
      case "C":
        clear();
        break;
      case "+/-":
        reverse();
        break;
      case "%":
        doPersent();
        break;
      case ".":
        doDecimal();
        break;
      case "=":
        calculate();
        break;
      case "+":
      case "-":
      case "*":
      case "/":
        pressOperator(label);
        break;
      default:
        pressNumber(label);
        break;
    }
  }

  void clear() {
    setState(() {
      value = "0";
    });
  }

  void reverse() {
    if (value != "0") {
      setState(() {
        if (value.startsWith("-")) {
          value = value.substring(1);
        } else {
          value = "-$value";
        }
      });
    }
  }

  void doPersent() {}

  void doDecimal() {}

  void calculate() {}

  void pressOperator(String ope) {}

  void pressNumber(String num) {
    setState(() {
      if ("0" == value) {
        value = num;
      } else {
        value = value + num;
      }
    });
  }
}

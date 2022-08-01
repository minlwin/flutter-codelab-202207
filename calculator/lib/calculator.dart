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
  double current = 0;
  String operator = "";
  bool done = false;

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
      current = 0;
      operator = "";
      done = false;
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

  void doPersent() {
    setState(() {
      _evaluate();
      current = current / 100;
      _showResult();
    });
  }

  void doDecimal() {
    if (!value.contains(".")) {
      setState(() {
        value = "$value.";
      });
    }
  }

  void calculate() {
    setState(() {
      _evaluate();
      _showResult();
    });
  }

  void pressOperator(String ope) {
    setState(() {
      _evaluate();
      operator = ope;
      value = "0";
    });
  }

  void pressNumber(String num) {
    setState(() {
      if ("0" == value || done) {
        value = num;
      } else {
        value = value + num;
      }
      done = false;
    });
  }

  void _evaluate() {
    var input = double.parse(value);
    switch (operator) {
      case "+":
        current += input;
        break;
      case "-":
        current -= input;
        break;
      case "*":
        current *= input;
        break;
      case "/":
        current /= input;
        break;
      default:
        current = input;
        break;
    }
  }

  void _showResult() {
    if (current.toInt().toDouble() == current) {
      value = current.toInt().toString();
    } else {
      value = current.toString();
    }
    current = 0;
    operator = "";
    done = true;
  }
}

import 'package:flutter/material.dart';

const spacer = 8.0;

typedef CalculatorAction = void Function(String);

class CalculatorActions extends StatelessWidget {
  final CalculatorAction action;

  const CalculatorActions({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(children: [
            Expanded(
                child: ActionButton(
              label: "C",
              action: action,
              color: Colors.deepOrange,
            )),
            const SizedBox(width: spacer),
            Expanded(
                child: ActionButton(
              label: "+/-",
              action: action,
              color: Colors.deepOrange,
            )),
            const SizedBox(width: spacer),
            Expanded(
                child: ActionButton(
              label: "%",
              action: action,
              color: Colors.deepOrange,
            )),
            const SizedBox(width: spacer),
            Expanded(
                child: ActionButton(
              label: "/",
              action: action,
              color: Colors.deepOrange,
            )),
          ]),
        ),
        const SizedBox(height: spacer),
        Expanded(
          child: Row(children: [
            Expanded(child: ActionButton(label: "7", action: action)),
            const SizedBox(width: spacer),
            Expanded(child: ActionButton(label: "8", action: action)),
            const SizedBox(width: spacer),
            Expanded(child: ActionButton(label: "9", action: action)),
            const SizedBox(width: spacer),
            Expanded(
                child: ActionButton(
              label: "*",
              action: action,
              color: Colors.deepOrange,
            )),
          ]),
        ),
        const SizedBox(height: spacer),
        Expanded(
          child: Row(children: [
            Expanded(child: ActionButton(label: "4", action: action)),
            const SizedBox(width: spacer),
            Expanded(child: ActionButton(label: "5", action: action)),
            const SizedBox(width: spacer),
            Expanded(child: ActionButton(label: "6", action: action)),
            const SizedBox(width: spacer),
            Expanded(
                child: ActionButton(
              label: "-",
              action: action,
              color: Colors.deepOrange,
            )),
          ]),
        ),
        const SizedBox(height: spacer),
        Expanded(
          child: Row(children: [
            Expanded(child: ActionButton(label: "1", action: action)),
            const SizedBox(width: spacer),
            Expanded(child: ActionButton(label: "2", action: action)),
            const SizedBox(width: spacer),
            Expanded(child: ActionButton(label: "3", action: action)),
            const SizedBox(width: spacer),
            Expanded(
                child: ActionButton(
              label: "+",
              action: action,
              color: Colors.deepOrange,
            )),
          ]),
        ),
        const SizedBox(height: spacer),
        Expanded(
          child: Row(children: [
            Expanded(child: ActionButton(label: "0", action: action)),
            const SizedBox(width: spacer),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: ActionButton(label: ".", action: action)),
                  const SizedBox(width: spacer),
                  Expanded(
                      child: ActionButton(
                    label: "=",
                    action: action,
                    color: Colors.deepOrange,
                  )),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final CalculatorAction action;
  final Color? color;

  const ActionButton(
      {Key? key, required this.label, required this.action, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: () {
          action(label);
        },
        child: Text(
          label,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ControlsButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback action;
  const ControlsButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              icon,
              size: 18,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

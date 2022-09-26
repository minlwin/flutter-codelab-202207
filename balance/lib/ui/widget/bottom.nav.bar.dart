import 'package:balance/ui/styles.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final List<Widget> controls;
  final MainAxisAlignment? alignment;
  const BottomNavBar({super.key, required this.controls, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: bottomNavStyle(),
      child: Row(
        mainAxisAlignment: alignment ?? MainAxisAlignment.spaceAround,
        children: controls,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String? message;
  const AppError({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Error",
          style: Theme.of(context).textTheme.headline4,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Icon(
            Icons.warning,
            size: 60,
          ),
        ),
        Text(message ?? "Something is going wrong!")
      ],
    );
  }
}

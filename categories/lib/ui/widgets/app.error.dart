import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String? message;
  const AppError({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              message ?? "Application Error",
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class ErrorView extends StatelessWidget {
  final String? message;
  const ErrorView({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning,
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            message ?? "Application Error",
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}

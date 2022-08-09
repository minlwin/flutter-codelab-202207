import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final String hatuon;
  final String katakana;
  final String value;

  const DetailsView({
    Key? key,
    required this.value,
    required this.katakana,
    required this.hatuon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 36,
          left: 8,
          right: 8,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "အိုဘာတဲ့ ",
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    katakana,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    hatuon,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

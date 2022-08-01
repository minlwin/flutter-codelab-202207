import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Counter App",
            style: TextStyle(fontSize: 24),
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.only(top: 16),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.blueGrey,
            child: const Text(
              "0",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Count Up"),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: MaterialButton(
                  color: Colors.blue.shade200,
                  onPressed: () {},
                  child: const Text("Count Down"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

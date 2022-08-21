import 'package:flutter/material.dart';
import 'package:stateless/model.dart';
import 'package:stateless/personal.info.widget.dart';

class UserWidget extends StatelessWidget {
  final Person user;
  const UserWidget(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          PersonalInfo(user),
        ],
      ),
    );
  }
}

class NamedLabel extends StatelessWidget {
  final String title;
  final String value;

  const NamedLabel({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.blue.shade800),
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}

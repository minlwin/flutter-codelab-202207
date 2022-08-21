import 'package:flutter/material.dart';
import 'package:stateless/address.widget.dart';
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
      width: double.infinity,
      child: Column(
        children: [
          PersonalInfo(user),
          const SizedBox(height: 32),
          AddressWidget(user.address),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 108,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.blue.shade800),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.headline5,
              overflow: TextOverflow.visible,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}

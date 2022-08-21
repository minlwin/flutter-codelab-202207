import 'package:flutter/material.dart';
import 'package:stateless/model.dart';
import 'package:stateless/user.widget.dart';

class PersonalInfo extends StatelessWidget {
  final Person person;
  const PersonalInfo(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Personal Info",
            style: Theme.of(context).textTheme.headline4,
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 16),
            itemCount: person.personalInfo.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => NamedLabel(
              title: person.personalInfoList[index].key,
              value: person.personalInfoList[index].value,
            ),
          ),
        ],
      ),
    );
  }
}

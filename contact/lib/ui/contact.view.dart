import 'package:contact/model/contact.model.dart';
import 'package:contact/ui/contact.input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ContactInput(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<ContactModel>().list.length,
              itemBuilder: getListItem,
            ),
          )
        ],
      ),
    );
  }

  Widget getListItem(BuildContext context, int index) {
    final dto = context.watch<ContactModel>().list[index];
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(dto.name),
        subtitle: Text(dto.phone),
      ),
    );
  }
}

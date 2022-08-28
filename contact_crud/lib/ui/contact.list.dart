import 'package:contact_crud/model/contact.modal.dart';
import 'package:contact_crud/ui/contact.edit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) => ContactEditView(),
              ));
            },
            icon: const Icon(Icons.person_add),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: context.watch<ContactModel>().list.length,
        itemBuilder: (context, index) {
          var dto = context.watch<ContactModel>().list[index];
          return Dismissible(
            key: Key(dto.id.toString()),
            direction: DismissDirection.horizontal,
            background: _background(Icons.delete, "Delete Contact", Colors.red),
            secondaryBackground: _background(
                Icons.edit, "Edit Contact", Colors.green,
                left: false),
            onDismissed: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                context.read<ContactModel>().remove(dto);
              }

              if (direction == DismissDirection.endToStart) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => ContactEditView(dto: dto)));
              }
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(dto.name),
                  subtitle: Text(dto.phone),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _background(IconData icon, String text, Color color,
          {bool left = true}) =>
      Container(
        color: color,
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment:
              left ? MainAxisAlignment.start : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: left
              ? [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ]
              : [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                ],
        ),
      );
}

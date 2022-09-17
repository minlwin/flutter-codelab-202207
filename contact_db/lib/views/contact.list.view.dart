import 'package:contact_db/views/contact.edit.view.dart';
import 'package:flutter/material.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.people),
        title: const Text("Contact List"),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ContactEditView(),
              ));
            },
            icon: const Icon(Icons.person_add),
          )
        ],
      ),
      body: const ContactListBody(),
    );
  }
}

class ContactListBody extends StatelessWidget {
  const ContactListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

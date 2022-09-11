import 'dart:developer';

import 'package:contact_local/state/contact.dto.dart';
import 'package:contact_local/state/contact.model.dart';
import 'package:contact_local/ui/contact.edit.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ContactModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        actions: [
          IconButton(
            onPressed: () async {
              var result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ContactEditView()));

              if (null != result && result is Contact) {
                model.addContact(result);
              }
            },
            icon: const Icon(Icons.person_add),
          )
        ],
      ),
      body: FutureBuilder(
        future: context.watch<ContactModel>().items,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            log(snapshot.error.toString());
            return const Center(
              child: Text("Something is going wrong."),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) =>
                  _listItem(snapshot.data![index], context),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _listItem(Contact contact, BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(contact.name),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  padding: EdgeInsets.zero,
                  onSelected: (value) {
                    if (value == 1) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactEditView(
                          contact: contact,
                        ),
                      ));
                    } else {}
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text("Edit"),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text("Delete"),
                    ),
                  ],
                )
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(contact.phone), Text(contact.email)],
            ),
          ),
        ),
      );
}

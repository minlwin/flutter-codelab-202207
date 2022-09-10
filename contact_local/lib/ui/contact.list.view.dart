import 'dart:convert';
import 'dart:developer';

import 'package:contact_local/state/contact.dto.dart';
import 'package:contact_local/ui/contact.edit.view.dart';
import 'package:flutter/material.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        actions: [
          IconButton(
            onPressed: () async {
              var result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ContactEditView()));

              if (null != result && result is Contact) {
                log(jsonEncode(result.toMap()));
              }
            },
            icon: const Icon(Icons.person_add),
          )
        ],
      ),
    );
  }
}

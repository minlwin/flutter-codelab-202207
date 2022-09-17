import 'package:contact_db/model/contact.model.dart';
import 'package:contact_db/views/contact.list.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ContactListView(),
      ),
    );
  }
}

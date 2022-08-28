import 'package:contact_crud/model/contact.modal.dart';
import 'package:contact_crud/ui/contact.list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({Key? key}) : super(key: key);

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

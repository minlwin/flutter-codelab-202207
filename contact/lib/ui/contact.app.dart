import 'package:contact/model/contact.model.dart';
import 'package:contact/ui/contact.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => ContactModel(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Contact Demo"),
          ),
          body: const ContactView(),
        ),
      ),
    );
  }
}

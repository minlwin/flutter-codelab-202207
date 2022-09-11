import 'package:contact_local/state/contact.model.dart';
import 'package:contact_local/ui/contact.app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    create: (context) => ContactModel(),
    child: const ContactApp(),
  ));
}

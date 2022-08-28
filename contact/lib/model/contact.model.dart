import 'package:contact/model/contact.dart';
import 'package:flutter/material.dart';

class ContactModel extends ChangeNotifier {
  final List<Contact> _list = List.empty(growable: true);

  List<Contact> get list {
    return List.of(_list);
  }

  void add(String name, String phone) {
    _list.add(Contact(name: name, phone: phone));
    notifyListeners();
  }
}

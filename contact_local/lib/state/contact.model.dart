import 'package:contact_local/state/contact.dto.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

const data = "data";

class ContactModel with ChangeNotifier {
  final _storage = LocalStorage("com.jdc.contact.local");

  Future<void> addContact(Contact contact) async {
    var list = await items;
    list.add(contact);

    // Save To Local Storage
    await _storage.setItem(data, list.map((e) => e.toMap()).toList());

    notifyListeners();
  }

  Future<List<Contact>> get items async {
    if (await _storage.ready) {
      return Contact.read(_storage.getItem(data));
    }

    return List.empty(growable: true);
  }
}

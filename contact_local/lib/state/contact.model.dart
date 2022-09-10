import 'dart:convert';

import 'package:contact_local/state/contact.dto.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

const data = "data";

class ContactModel with ChangeNotifier {
  final _storage = LocalStorage("com.jdc.contact.local");

  get ready => _storage.ready;

  Future<void> addContact(Contact contact) async {
    var list = await items;
    list.add(contact);

    // Convert to JSON String
    var jsonString = jsonEncode(list.map((e) => e.toMap()));

    // Save To Local Storage
    await _storage.setItem(data, jsonString);

    notifyListeners();
  }

  Future<List<Contact>> get items async {
    if (await _storage.ready) {
      var storageData = _storage.getItem(data);
      return List.from(storageData);
    }

    return List.empty(growable: true);
  }
}

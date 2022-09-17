import 'package:contact_db/model/contact.dto.dart';
import 'package:flutter/material.dart';

class ContactModel with ChangeNotifier {
  Future<void> save(ContactDto dto) async {}

  Future<ContactDto?> findById(int id) async {
    return null;
  }

  Future<List<ContactDto>> getAll() async {
    return List.empty();
  }
}

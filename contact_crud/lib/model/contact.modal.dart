import 'package:contact_crud/model/contact.dto.dart';
import 'package:flutter/material.dart';

class ContactModel extends ChangeNotifier {
  final List<Contact> _list = List.empty(growable: true);

  List<Contact> get list => List.of(_list);

  Contact findById(int id) {
    return _list.where((element) => element.id == id).first;
  }

  void save({
    int? id,
    String? name,
    String? phone,
    String? email,
  }) {
    if (id != null) {
      var dto = findById(id);
      _list[_list.indexOf(dto)] =
          dto.withName(name).withEmail(email).withPhone(phone);
    } else {
      int generatedId = _list.isEmpty ? 1 : _list[_list.length - 1].id + 1;
      _list.add(Contact(
        id: generatedId,
        name: name ?? '',
        phone: phone ?? '',
        email: email ?? '',
      ));
    }
    notifyListeners();
  }

  void remove(Contact dto) {
    _list.remove(dto);
    notifyListeners();
  }
}

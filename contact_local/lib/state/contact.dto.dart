import 'dart:convert';

class Contact {
  String name;
  String phone;
  String email;

  Contact({required this.name, required this.phone, required this.email});

  factory Contact.fromMap(Map<String, dynamic> map) => Contact(
        name: map['name'],
        phone: map['phone'],
        email: map['email'],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "phone": phone,
        "email": email,
      };

  static List<Contact> read(String? data) {
    if (data == null) {
      return List.empty(growable: true);
    }

    List<Map<String, dynamic>> list = jsonDecode(data);
    return List.from(list.map((e) => Contact.fromMap(e)));
  }
}

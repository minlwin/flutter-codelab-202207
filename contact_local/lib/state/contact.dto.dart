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

  static List<Contact> read(dynamic data) {
    if (data == null) {
      return List.empty(growable: true);
    }

    return List.from(data.map((e) => Contact.fromMap(e)));
  }
}

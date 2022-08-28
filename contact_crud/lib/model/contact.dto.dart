class Contact {
  final int id;
  final String name;
  final String phone;
  final String email;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  Contact withName(String? name) {
    return name == null
        ? this
        : Contact(id: id, name: name, phone: phone, email: email);
  }

  Contact withPhone(String? phone) {
    return phone == null
        ? this
        : Contact(id: id, name: name, phone: phone, email: email);
  }

  Contact withEmail(String? email) {
    return email == null
        ? this
        : Contact(id: id, name: name, phone: phone, email: email);
  }
}

class DataModel {
  static Person getUser() => Person(
        name: "Min Lwin",
        phone: "09782003098",
        role: "Member",
        address: Address(
          address: "120 / 3F",
          street: "Yadana Myaing Street",
          township: "Kamayut",
        ),
      );
}

class Person {
  final String name;
  final String phone;
  final String role;
  final Address address;

  Person({
    required this.name,
    required this.phone,
    required this.role,
    required this.address,
  });
}

class Address {
  final String address;
  final String street;
  final String township;

  Address({
    required this.address,
    required this.street,
    required this.township,
  });
}

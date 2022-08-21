class DataModel {
  static Person getUser() => Person(
        name: "Min Lwin",
        phone: "09782003098",
        role: "Member",
        address: Address(
          address: "120 / 3F",
          street: "Yadana Myaing New Street",
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

extension PersonalInfoExtension on Person {
  Map<String, String> get personalInfo {
    return {
      "Name": name,
      "Role": role,
      "Phone": phone,
    };
  }

  List<MapEntry<String, String>> get personalInfoList {
    return personalInfo.entries.toList();
  }
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

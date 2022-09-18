class ContactDto {
  int id;
  String name;
  String phone;
  String email;

  ContactDto({
    this.id = 0,
    this.name = "",
    this.phone = "",
    this.email = "",
  });

  factory ContactDto.from(Map<String, dynamic> map) => ContactDto(
        id: map['id'],
        name: map['name'],
        phone: map['phone'],
        email: map['email'],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "phone": phone,
        "email": email,
      };
}

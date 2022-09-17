class ContactDto {
  int id;
  String name;
  String phone;
  String email;

  ContactDto({
    this.id = 0,
    required this.name,
    required this.phone,
    required this.email,
  });
}

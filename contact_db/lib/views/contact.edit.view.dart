import 'package:contact_db/model/contact.dto.dart';
import 'package:contact_db/model/contact.model.dart';
import 'package:contact_db/views/contact.list.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactEditView extends StatelessWidget {
  final ContactDto? dto;
  const ContactEditView({super.key, this.dto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person_add),
        title: Text(_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const ContactListView(),
            )),
          )
        ],
      ),
      body: ContactEditBody(dto: dto ?? ContactDto()),
      resizeToAvoidBottomInset: false,
    );
  }

  String get _title => null == dto ? 'Add New Contact' : 'Edit Contact';
}

class ContactEditBody extends StatelessWidget {
  final ContactDto dto;
  final formKey = GlobalKey<FormState>();
  final nameInput = TextEditingController();
  final phoneInput = TextEditingController();
  final emailInput = TextEditingController();

  ContactEditBody({super.key, required this.dto});

  @override
  Widget build(BuildContext context) {
    nameInput.text = dto.name;
    phoneInput.text = dto.phone;
    emailInput.text = dto.email;
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _input(
              icon: Icons.person,
              name: "Name",
              controller: nameInput,
            ),
            _input(
              icon: Icons.phone,
              name: "Phone",
              controller: phoneInput,
              inputType: TextInputType.phone,
            ),
            _input(
              icon: Icons.email,
              name: "Email",
              controller: emailInput,
              inputType: TextInputType.emailAddress,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36, top: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text("Save"),
                  onPressed: () => _save(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _save(BuildContext context) {
    // Set Dto with Inputs
    dto.name = nameInput.text;
    dto.phone = phoneInput.text;
    dto.email = emailInput.text;

    // Save Dto
    context.read<ContactModel>().save(dto);

    // Navigate to List View
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const ContactListView(),
    ));
  }

  Widget _input({
    required IconData icon,
    required String name,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.name,
  }) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: name,
            icon: Icon(icon),
          ),
          keyboardType: inputType,
          validator: (value) {
            if (null == value || value.isEmpty) {
              return 'Please enter $name.';
            }
            return null;
          },
        ),
      );
}

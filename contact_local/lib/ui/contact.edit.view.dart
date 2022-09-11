import 'package:contact_local/state/contact.dto.dart';
import 'package:flutter/material.dart';

class ContactEditView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final Contact? contact;

  ContactEditView({super.key, this.contact});

  @override
  Widget build(BuildContext context) {
    _nameController.text = contact?.name ?? '';
    _phoneController.text = contact?.phone ?? '';
    _emailController.text = contact?.email ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Contact")),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: Column(
            children: [
              _formItem(
                  "Name", _nameController, Icons.person, TextInputType.name),
              _formItem(
                "Phone",
                _phoneController,
                Icons.phone,
                TextInputType.phone,
              ),
              _formItem(
                "Email",
                _emailController,
                Icons.email,
                TextInputType.emailAddress,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).pop(Contact(
                        name: _nameController.text,
                        phone: _phoneController.text,
                        email: _emailController.text,
                      ));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.save),
                      SizedBox(width: 12),
                      Text("Save"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _formItem(String name, TextEditingController controller, IconData icon,
      TextInputType inputType) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: name,
        ),
        controller: controller,
        keyboardType: inputType,
        validator: (value) {
          if (null == value || value.isEmpty) {
            return "Please enter $name.";
          }
          return null;
        },
      ),
    );
  }
}

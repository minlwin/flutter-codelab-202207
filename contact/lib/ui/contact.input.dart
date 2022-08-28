import 'package:contact/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactInput extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final _nameInput = TextEditingController();
  final _phoneInput = TextEditingController();

  ContactInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameInput,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              label: Text("Name"),
            ),
            validator: (value) => _notEmpty("Name", value),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _phoneInput,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              label: Text("Phone"),
            ),
            validator: (value) => _notEmpty("Phone Number", value),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  context
                      .read<ContactModel>()
                      .add(_nameInput.text, _phoneInput.text);
                  _nameInput.clear();
                  _phoneInput.clear();
                }
              },
              child: const Text("Add Contact"),
            ),
          )
        ],
      ),
    );
  }

  String? _notEmpty(String fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter $fieldName.";
    }
    return null;
  }
}

import 'package:contact_crud/model/contact.dto.dart';
import 'package:contact_crud/model/contact.modal.dart';
import 'package:contact_crud/ui/contact.list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactEditView extends StatelessWidget {
  final Contact? dto;
  ContactEditView({Key? key, this.dto}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameInput = TextEditingController();
  final _phoneInput = TextEditingController();
  final _emailInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameInput.text = dto?.name ?? '';
    _phoneInput.text = dto?.phone ?? '';
    _emailInput.text = dto?.email ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Contact")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _formInput(
                context,
                label: "Name",
                icon: Icons.person,
                controller: _nameInput,
                input: TextInputType.name,
              ),
              _formInput(
                context,
                label: "Phone",
                icon: Icons.phone,
                controller: _phoneInput,
                input: TextInputType.phone,
              ),
              _formInput(
                context,
                label: "Email",
                icon: Icons.email,
                controller: _emailInput,
                input: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final model = context.read<ContactModel>();
                        model.save(
                          id: dto?.id,
                          name: _nameInput.text,
                          phone: _phoneInput.text,
                          email: _emailInput.text,
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (_) => const ContactListView()),
                        );
                      }
                    },
                    child: const Text("Save Contact"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _formInput(
    BuildContext context, {
    required String label,
    required IconData icon,
    required TextEditingController controller,
    required TextInputType input,
  }) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextFormField(
          decoration: InputDecoration(
            icon: Icon(icon),
            label: Text(label),
          ),
          keyboardType: input,
          validator: (value) => _checkNotBlank(name: label, value: value),
          controller: controller,
        ),
      );

  String? _checkNotBlank({required String name, String? value}) {
    if (value == null || value.isEmpty) {
      return "Please enter $name.";
    }

    return null;
  }
}

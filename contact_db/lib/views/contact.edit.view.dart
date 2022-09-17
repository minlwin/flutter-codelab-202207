import 'package:contact_db/model/contact.dto.dart';
import 'package:contact_db/model/contact.model.dart';
import 'package:contact_db/views/contact.list.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactEditView extends StatelessWidget {
  const ContactEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person_add),
        title: const Text("Edit Contact"),
      ),
      body: ContactEditBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class ContactEditBody extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final nameInput = TextEditingController();
  final phoneInput = TextEditingController();
  final emailInput = TextEditingController();

  ContactEditBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              name: "Phone",
              controller: emailInput,
              inputType: TextInputType.emailAddress,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36, top: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var model = context.read<ContactModel>();
                      model.save(_getData());
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ContactListView(),
                      ));
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("Save"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getData() {
    return ContactDto(
      name: nameInput.text,
      phone: phoneInput.text,
      email: emailInput.text,
    );
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

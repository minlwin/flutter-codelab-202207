import 'package:contact_db/model/contact.dto.dart';
import 'package:contact_db/model/contact.model.dart';
import 'package:contact_db/views/contact.edit.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.people),
        title: const Text("Contact List"),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ContactEditView(),
              ));
            },
            icon: const Icon(Icons.person_add),
          )
        ],
      ),
      body: const ContactListBody(),
    );
  }
}

class ContactListBody extends StatelessWidget {
  const ContactListBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ContactModel>();
    return FutureBuilder(
      future: model.getAll(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.warning_amber,
                size: 40,
              ),
              Text("Something is going wrong!"),
            ],
          );
        }

        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) =>
                ContactListItem(snapshot.data![index]),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ContactListItem extends StatelessWidget {
  final ContactDto dto;
  const ContactListItem(this.dto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(dto.name),
          subtitle: Text("${dto.phone}\n${dto.email}"),
          isThreeLine: true,
        ),
      ),
    );
  }
}

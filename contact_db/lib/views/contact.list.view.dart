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
        padding: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(dto.name),
              _getActions(context),
            ],
          ),
          subtitle: Text("${dto.phone}\n${dto.email}"),
          isThreeLine: true,
        ),
      ),
    );
  }

  Widget _getActions(BuildContext context) => PopupMenuButton(
        padding: const EdgeInsets.all(0),
        icon: const Icon(Icons.more_vert),
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 1,
            child: Text("Edit"),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text("Delete"),
          )
        ],
        onSelected: (value) => _handle(value, context),
      );

  _handle(int value, BuildContext context) {
    switch (value) {
      case 1:
        _edit(context);
        break;
      case 2:
        _delete(context);
        break;
      default:
        break;
    }
  }

  _edit(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => ContactEditView(
        dto: dto,
      ),
    ));
  }

  _delete(BuildContext context) async {
    final model = context.read<ContactModel>();
    var result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Confirmation"),
        content: Text("Do you want to delete ${dto.name}."),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancel")),
          TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("Delete")),
        ],
      ),
    );

    if (result) {
      model.delete(dto.id);
    }
  }
}

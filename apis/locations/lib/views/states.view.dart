import 'package:flutter/material.dart';
import 'package:locations/model/api/state.api.dart';
import 'package:locations/model/dto/state.dto.dart';
import 'package:locations/views/commons.dart';
import 'package:locations/views/townships.view.dart';

class StateListView extends StatelessWidget {
  const StateListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.map),
        title: const Text("Locations"),
      ),
      body: FutureBuilder(
        future: StateApi().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorView();
          }

          if (snapshot.hasData) {
            final list = snapshot.data as List<StateDto>;
            return ListView.separated(
              itemBuilder: (context, index) => StateItem(dto: list[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: list.length,
            );
          }

          return const LoadingView();
        },
      ),
    );
  }
}

class StateItem extends StatelessWidget {
  final StateDto dto;
  const StateItem({super.key, required this.dto});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text("${dto.id}")),
      title: Text(dto.name),
      subtitle: Text(dto.capital),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TownshipListView(dto: dto)));
      },
    );
  }
}

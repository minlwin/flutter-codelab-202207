import 'package:flutter/material.dart';
import 'package:locations/model/api/township.api.dart';
import 'package:locations/model/dto/state.dto.dart';
import 'package:locations/model/dto/township.dto.dart';
import 'package:locations/views/commons.dart';

class TownshipListView extends StatelessWidget {
  final StateDto dto;
  const TownshipListView({super.key, required this.dto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dto.name)),
      body: FutureBuilder(
        future: TownshipApi().findByStateId(dto.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorView();
          }

          if (snapshot.hasData) {
            final list = snapshot.data as List<Township>;

            return ListView.separated(
              itemBuilder: (context, index) =>
                  TownshipItem(seq: index + 1, dto: list[index]),
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

class TownshipItem extends StatelessWidget {
  final Township dto;
  final int seq;
  const TownshipItem({super.key, required this.seq, required this.dto});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text("$seq")),
      title: Text(dto.name),
      subtitle: Text(dto.stateName),
    );
  }
}

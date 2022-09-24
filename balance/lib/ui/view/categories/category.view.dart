import 'package:balance/app/routes.dart';
import 'package:balance/model/dao/category.model.dart';
import 'package:balance/model/dto/category.dto.dart';
import 'package:balance/ui/widget/error.widget.dart';
import 'package:balance/ui/widget/loading.widget.dart';
import 'package:balance/ui/widget/sidebar.widget.dart';
import 'package:flutter/material.dart';

class CagtegoryView extends StatelessWidget {
  const CagtegoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Categories"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(routeCategoriesEdit);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: CategoryModel.instance.getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const AppError();
          }

          if (snapshot.hasData) {
            final list = snapshot.data as List<Category>;
            return ListView.separated(
                itemBuilder: (context, index) =>
                    CategoryListItem(dto: list[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: list.length);
          }

          return const Loading();
        },
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final Category dto;
  const CategoryListItem({super.key, required this.dto});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: dto.color,
        child: Text(
          dto.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(dto.name),
      subtitle: Text(dto.credit ? "Credit" : "Debit"),
      trailing: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(routeCategoriesEdit, arguments: dto);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}

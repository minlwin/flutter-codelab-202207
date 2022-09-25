import 'package:categories/model/category.dao.dart';
import 'package:categories/model/category.dto.dart';
import 'package:categories/ui/views/category.edit.dart';
import 'package:categories/ui/widgets/app.error.dart';
import 'package:categories/ui/widgets/app.loading.dart';
import 'package:categories/utils/date.utitls.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category List"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CategoryEditView(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: CategoryDao().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const AppError();
          }

          if (snapshot.hasData) {
            final list = snapshot.data as List<Category>;
            return ListView.separated(
              itemBuilder: (context, index) => CategoryItem(list[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: list.length,
            );
          }

          return const AppLoading();
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category dto;
  const CategoryItem(this.dto, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: dto.color,
        child: Text(dto.title),
      ),
      title: Text(dto.name),
      subtitle: Text(DateTimeUtils.format(dto.createAt)),
    );
  }
}

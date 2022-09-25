import 'package:categories/model/states/category.edit.state.dart';
import 'package:categories/utils/date.utitls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryEditView extends StatelessWidget {
  const CategoryEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Category"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CategoryEditState.from(),
        child: CategoryEditBody(),
      ),
    );
  }
}

class CategoryEditBody extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dateController = TextEditingController();

  CategoryEditBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Category Name",
                icon: Icon(Icons.label_outline),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: "Create At",
                icon: Icon(Icons.event),
              ),
              keyboardType: TextInputType.none,
              onTap: () async {
                final state = context.read<CategoryEditState>();
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate:
                      DateTime(DateTime.now().year, DateTime.now().month - 1),
                  lastDate:
                      DateTime(DateTime.now().year, DateTime.now().month + 1),
                );

                if (null != date) {
                  state.setCreation(date);
                  dateController.text = DateTimeUtils.format(date);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

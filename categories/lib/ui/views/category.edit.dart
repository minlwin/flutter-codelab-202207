import 'package:categories/model/category.dto.dart';
import 'package:categories/model/states/category.edit.state.dart';
import 'package:categories/ui/views/category.list.dart';
import 'package:categories/ui/widgets/color.picker.dart';
import 'package:categories/utils/date.utitls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryEditView extends StatelessWidget {
  final Category? dto;
  const CategoryEditView({super.key, this.dto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Category"),
      ),
      body: Provider(
        create: (context) => CategoryEditState.from(dto: dto),
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
    final editState = context.read<CategoryEditState>();
    nameController.text = editState.name;
    dateController.text = DateTimeUtils.format(editState.creation);
    return Container(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Category Name",
                icon: Icon(Icons.label_outline),
              ),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (null == value || value.isEmpty) {
                  return "Enter Category Name.";
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: "Create At",
                icon: Icon(Icons.event),
              ),
              keyboardType: TextInputType.none,
              validator: (value) {
                if (null == value || value.isEmpty) {
                  return "Select Create Date.";
                }
                return null;
              },
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate:
                      DateTime(DateTime.now().year, DateTime.now().month - 1),
                  lastDate:
                      DateTime(DateTime.now().year, DateTime.now().month + 1),
                );

                if (null != date) {
                  editState.setCreation(date);
                  dateController.text = DateTimeUtils.format(date);
                }
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 38),
                child: ColorPicker(
                  defaultColor: editState.color,
                  onColorSelect: (color) {
                    editState.setColor(color);
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 38),
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    editState.save(nameController.text);
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const CategoryListView(),
                      ),
                      (route) => false,
                    );
                  }
                },
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

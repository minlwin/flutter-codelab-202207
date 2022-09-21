import 'package:balance/model/dto/category.dto.dart';
import 'package:balance/model/states/category.edit.state.dart';
import 'package:balance/model/states/category.model.dart';
import 'package:balance/ui/widget/color.picker.widget.dart';
import 'package:balance/ui/widget/sub.view.dart';
import 'package:balance/ui/widget/switch.form.field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryEditView extends StatelessWidget {
  const CategoryEditView({super.key});

  @override
  Widget build(BuildContext context) {
    final dto = ModalRoute.of(context)?.settings.arguments as Category?;

    return Provider(
      create: (context) => CategoryEditState(),
      child: SubView(
        title: "${dto != null ? 'Edit' : 'Add New'} Category",
        child: CategoryEditBody(
          dto: dto,
        ),
      ),
    );
  }
}

class CategoryEditBody extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final Category? dto;
  CategoryEditBody({super.key, this.dto});

  @override
  Widget build(BuildContext context) {
    if (null != dto) {
      nameController.text = dto!.name;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 4, top: 4),
              child: Text(
                "Name",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
              child: TextFormField(
                controller: nameController,
                decoration:
                    const InputDecoration(hintText: "Enter Category Name"),
                validator: (value) {
                  if (null == value || value.isEmpty) {
                    return "Please Enter Category Name";
                  }
                  return null;
                },
              ),
            ),
            SwitchFormField(
              state: dto?.credit,
              onLabel: "Credit",
              offLabel: "Debit",
              onValueChange: (value) {
                context.read<CategoryEditState>().credit = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 4),
              child: Text(
                "Select Color",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Expanded(
              child: ColorPicker(
                color: dto?.color,
                onValueChange: (color) {
                  context.read<CategoryEditState>().color = color;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final target =
                          context.read<CategoryEditState>().getCategory(
                                name: nameController.text,
                                id: dto?.id ?? 0,
                              );
                      context.read<CategoryModel>().save(target);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Save Category"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

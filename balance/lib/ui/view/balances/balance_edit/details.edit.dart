import 'package:balance/model/dto/details.dto.dart';
import 'package:balance/model/states/balance.edit.state.dart';
import 'package:balance/model/states/nested.pager.state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsEdit extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final itemControl = TextEditingController();
  final amountControl = TextEditingController();
  DetailsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Item",
                      icon: Icon(Icons.label_outline),
                    ),
                    controller: itemControl,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (null == value || value.isEmpty) {
                        return "Enter Item name.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Amount",
                      icon: Icon(Icons.shopping_cart_outlined),
                    ),
                    controller: amountControl,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (null == value || value.isEmpty) {
                        return "Enter Amount value.";
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        DetailsEditControls(
          onSave: () {
            if (formKey.currentState?.validate() ?? false) {
              final dto = Details(
                  item: itemControl.text,
                  amount: int.parse(amountControl.text));
              context.read<BalanceEditState>().addDetails(dto);
              context.read<NestedPagerState>().page = 1;
            }
          },
        )
      ],
    );
  }
}

class DetailsEditControls extends StatelessWidget {
  final VoidCallback onSave;
  const DetailsEditControls({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  context.read<NestedPagerState>().page = 0;
                },
                child: const Text("Categories"),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onSave,
                child: const Text("Save"),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  context.read<NestedPagerState>().page = 1;
                },
                child: const Text("Details Items"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

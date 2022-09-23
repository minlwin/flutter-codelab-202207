import 'package:balance/model/states/balance.edit.state.dart';
import 'package:balance/model/states/balance.model.dart';
import 'package:balance/model/states/nested.pager.state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../extensions.dart';

class BalanceConfirm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final remarkController = TextEditingController();

  BalanceConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BalanceEditState>();
    final model = context.read<BalanceModel>();
    dateController.text = state.createAt.label;
    remarkController.text = state.remark;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.event),
                      labelText: "Issue Date",
                    ),
                    validator: (value) {
                      if (null == value || value.isEmpty) {
                        return "Please select Issue Date";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.none,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: state.createAt,
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime.now(),
                      );

                      if (null != date) {
                        dateController.text = date.label;
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: remarkController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.message_outlined),
                      labelText: "Remark",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Remark.";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        BalanceConfirmControl(
          onFormSubmit: () {
            if (formKey.currentState?.validate() ?? false) {
              state.createAt = dateController.text.dateTime;
              state.remark = remarkController.text;
              model.save(state.balance, state.detailsList);
              Navigator.of(context).pop();
            }
          },
          onBackPress: () {
            state.createAt = dateController.text.dateTime;
            state.remark = remarkController.text;
          },
        )
      ],
    );
  }
}

class BalanceConfirmControl extends StatelessWidget {
  final VoidCallback onFormSubmit;
  final VoidCallback onBackPress;
  const BalanceConfirmControl(
      {super.key, required this.onFormSubmit, required this.onBackPress});

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
                  onBackPress();
                  context.read<NestedPagerState>().page = 2;
                },
                child: const Text("Back"),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onFormSubmit,
                child: const Text("Save"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

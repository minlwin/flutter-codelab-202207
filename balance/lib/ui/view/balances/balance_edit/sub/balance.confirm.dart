import 'package:balance/model/dao/balance.model.dart';
import 'package:balance/model/states/balance.edit.state.dart';
import 'package:balance/model/states/nested.pager.state.dart';
import 'package:balance/ui/view/balances/balance_edit/sub/details.list.dart';
import 'package:balance/ui/widget/bottom.nav.bar.dart';
import 'package:balance/ui/widget/controls.button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../extensions.dart';

class BalanceConfirm extends StatelessWidget {
  static const String title = "Confirm";

  final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final remarkController = TextEditingController();

  BalanceConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BalanceEditState>();
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
        BottomNavBar(controls: [
          ControlsButton(
            icon: Icons.back_hand_outlined,
            label: "Back",
            action: () {
              state.createAt = dateController.text.dateTime;
              state.remark = remarkController.text;
              context.read<NestedPagerState>().change(DetailsList.title);
            },
          ),
          ControlsButton(
            icon: Icons.save_alt,
            label: "Save",
            action: () {
              if (formKey.currentState?.validate() ?? false) {
                state.createAt = dateController.text.dateTime;
                state.remark = remarkController.text;
                BalanceModel.instance.save(state.balance, state.detailsList);
                Navigator.of(context).pop();
              }
            },
          )
        ])
      ],
    );
  }
}

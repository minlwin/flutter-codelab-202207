import 'package:balance/model/states/switch.form.state.dart';
import 'package:balance/ui/widget/types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchFormField extends StatelessWidget {
  final bool? state;
  final OnValueChange<bool> onValueChange;
  final String onLabel;
  final String offLabel;
  const SwitchFormField(
      {super.key,
      required this.onLabel,
      required this.offLabel,
      required this.onValueChange,
      this.state});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SwitchFormState.generate(state, onLabel, offLabel),
      child: SwitchFormFieldBody(
        onValueChange: onValueChange,
      ),
    );
  }
}

class SwitchFormFieldBody extends StatelessWidget {
  final OnValueChange<bool> onValueChange;
  const SwitchFormFieldBody({super.key, required this.onValueChange});

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: context.watch<SwitchFormState>().state,
      builder: (field) => SwitchListTile(
        contentPadding: const EdgeInsets.only(left: 4),
        value: field.value!,
        onChanged: (value) {
          field.didChange(value);
          onValueChange(value);
          context.read<SwitchFormState>().state = value;
        },
        title: Text(context.watch<SwitchFormState>().label),
      ),
    );
  }
}

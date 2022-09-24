import 'package:balance/model/states/color.picker.state.dart';
import 'package:balance/ui/widget/types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorPicker extends StatelessWidget {
  final Color? color;
  final OnValueChange<Color> onValueChange;
  const ColorPicker({super.key, required this.onValueChange, this.color});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorPickerState.generate(color),
      child: ColorPickerBody(onValueChange),
    );
  }
}

class ColorPickerBody extends StatelessWidget {
  final OnValueChange<Color> onValueChange;
  const ColorPickerBody(this.onValueChange, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      children: List.from(
        colors.map(
          (e) => GestureDetector(
            onTap: () {
              onValueChange(e);
              context.read<ColorPickerState>().color = e;
            },
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: e,
              ),
              child: context.watch<ColorPickerState>().color.value == e.value
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}

const List<Color> colors = [
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey
];

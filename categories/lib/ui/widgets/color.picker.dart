import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef OnColorSelect = void Function(Color);

class ColorPickerState with ChangeNotifier {
  Color _color;
  OnColorSelect? onColorSelect;
  ColorPickerState(this._color, {this.onColorSelect});

  Color get selected => _color;

  set selected(Color color) {
    _color = color;
    onColorSelect?.call(color);
    notifyListeners();
  }
}

class ColorPicker extends StatelessWidget {
  final OnColorSelect? onColorSelect;
  final Color? defaultColor;
  const ColorPicker({super.key, this.onColorSelect, this.defaultColor});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorPickerState(defaultColor ?? Colors.red,
          onColorSelect: onColorSelect),
      child: const ColorPickerView(),
    );
  }
}

class ColorPickerView extends StatelessWidget {
  const ColorPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Color",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: GridView.count(
            crossAxisCount: 5,
            children: List.from(colors.map((e) => Padding(
                  padding: const EdgeInsets.only(right: 4, bottom: 4),
                  child: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: e,
                      child: e.value ==
                              context.watch<ColorPickerState>().selected.value
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    onTap: () {
                      context.read<ColorPickerState>().selected = e;
                    },
                  ),
                ))),
          ),
        )
      ],
    );
  }
}

const colors = [
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
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.grey,
  Colors.blueGrey
];

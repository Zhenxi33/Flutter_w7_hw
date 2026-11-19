// EX 1 – The selectable button (handout page: EX 1). Start code from the handout.

import 'package:flutter/material.dart';

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  String get textLabel => isSelected ? "Selected" : "Not selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor =>
      isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: toggleSelection,
        child: Center(
          child: Text(
            textLabel,
            style: TextStyle(color: textColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Custom buttons"),
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectableButton(),
                SelectableButton(),
                SelectableButton(),
                SelectableButton(),
              ],
            ),
          ),
        ),
      ),
    );

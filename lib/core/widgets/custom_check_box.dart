import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.activeColor,
    required this.onChanged,
    this.isChecked = false,
  });

  final Color activeColor;
  // final void Function()? onChanged;
  final void Function(bool?) onChanged;
  final bool isChecked;

  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            activeColor: activeColor,
            value: isChecked,
            onChanged: onChanged,
          ),
          const Text(
            'Remember me?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

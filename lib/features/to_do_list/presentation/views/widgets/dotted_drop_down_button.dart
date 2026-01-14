import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class DottedDropdownButton extends StatelessWidget {
  const DottedDropdownButton({super.key, this.onChanged});
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: const Icon(
        Icons.more_horiz,
        color: toDoListColor,
      ),
      underline: const SizedBox(),
      style: const TextStyle(color: toDoListColor),
      onChanged: onChanged,
      items: ['Done', 'Delete'].map<DropdownMenuItem<String>>((String value) {
        Color textColor;
        if (value == 'Done') {
          textColor = Colors.green;
        } else if (value == 'Delete') {
          textColor = Colors.red;
        } else {
          textColor = Colors.black;
        }
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: textColor)),
        );
      }).toList(),
    );
  }
}

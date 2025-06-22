import 'package:flutter/material.dart';

class CustomDataCellCheckbox extends StatefulWidget {
  const CustomDataCellCheckbox({
    super.key,
    required this.orderId,
    required this.onChanged,
  });

  final String orderId;
  final Function(String?) onChanged;
  @override
  State<CustomDataCellCheckbox> createState() => _CustomDataCellCheckboxState();
}

class _CustomDataCellCheckboxState extends State<CustomDataCellCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Checkbox(
        checkColor: Colors.blue,
        activeColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        side: const BorderSide(color: Colors.grey, width: 2),
        value: isChecked,
        onChanged: (value) {
          isChecked = value!;
          widget.onChanged(value ? widget.orderId : null);
          // Save orderId if checked
          setState(() {});
        },
      ),
    );
  }
}

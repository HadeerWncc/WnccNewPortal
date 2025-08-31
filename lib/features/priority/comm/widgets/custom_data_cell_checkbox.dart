import 'package:flutter/material.dart';

class CustomDataCellCheckbox extends StatefulWidget {
  const CustomDataCellCheckbox({
    super.key,
    required this.orderId,
    required this.onChanged,
    // this.agent,
  });

  final String orderId;
  // final String? agent;
  final Function(bool isChecked) onChanged;

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
          widget.onChanged(value);
          // widget.onChanged(
          //   value == false
          //       ? null
          //       : DispatchDeliveryEntity(
          //           id: widget.orderId,
          //           agentName:  "",
          //         ),
          // );
          // Save orderId if checked
          setState(() {});
        },
      ),
    );
  }
}

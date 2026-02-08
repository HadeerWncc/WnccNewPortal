import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({super.key, this.onToggle});
  final Function(bool)? onToggle;
  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: isActive,
            activeColor: kBtnColor,
            onChanged: (value) {
              setState(() {
                isActive = value;
              });
              widget.onToggle?.call(value);
            },
          ),
          const SizedBox(width: 8),
          Text(
            isActive ? "Show Charts" : "Hide Charts",
            style: TextStyle(
              color: isActive ? kBtnColor : Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

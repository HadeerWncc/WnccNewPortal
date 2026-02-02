import 'dart:async';
import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatefulWidget {
  const CustomButtonWithIcon({
    super.key,
    required this.child,
    required this.textColor,
    required this.bgColor,
    this.icon,
    required this.onHoverColor,
    this.onTap,
  });

  final String child;
  final Color textColor;
  final Color bgColor;
  final IconData? icon;
  final Color onHoverColor;
  final void Function()? onTap;
  @override
  State<CustomButtonWithIcon> createState() => _CustomButtonWithIconState();
}

class _CustomButtonWithIconState extends State<CustomButtonWithIcon> {
  bool isPressed = false;
  void handleTap() async {
    setState(() => isPressed = true);

    await Future.delayed(const Duration(milliseconds: 300));

    setState(() => isPressed = false);

    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: isPressed ? widget.onHoverColor : widget.bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (widget.icon != null)
              Icon(
                widget.icon,
                color: isPressed ? Colors.white : widget.textColor,
                weight: 700,
                size: 20,
              ),
            if (widget.icon != null) const SizedBox(width: 10),
            Text(
              widget.child,
              style: TextStyle(
                color: isPressed ? Colors.white : widget.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

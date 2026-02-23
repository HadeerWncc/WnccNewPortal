import 'package:flutter/material.dart';

class MarkedText extends StatelessWidget {
  const MarkedText({
    super.key,
    required this.child,
    required this.color,
    this.textColor = Colors.black,
    this.padding,
    this.fontSize,
  });
  final String child;
  final Color color;
  final Color textColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 7,
          ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        child,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}

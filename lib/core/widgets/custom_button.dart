import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.contant,
    required this.color,
    this.textColor = Colors.white,
    this.fontSize = 16, this.width,
  });
  final void Function()? onTap;
  final String contant;
  final Color color;
  final Color textColor;
  final double fontSize;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          minimumSize: const WidgetStatePropertyAll(Size.fromHeight(50)),
          shape: WidgetStatePropertyAll(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        child: Text(
          contant,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

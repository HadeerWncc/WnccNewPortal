import 'package:flutter/material.dart';

class CustomCircelLetterContainer extends StatelessWidget {
  const CustomCircelLetterContainer({
    super.key,
    required this.letter, required this.bgColor,
  });
  final String letter;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: bgColor,
        // borderRadius: BorderRadius.circular(50),
        shape: BoxShape.circle,
      ),
      child: Text(
        letter,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
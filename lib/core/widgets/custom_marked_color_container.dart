import 'package:flutter/material.dart';

class CustomMarkedColorContainer extends StatelessWidget {
  const CustomMarkedColorContainer(
      {super.key,
      required this.title,
      required this.color,
      required this.bgColor});
  final String title;
  final Color color;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

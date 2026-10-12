import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class CustomToDoListDate extends StatelessWidget {
  const CustomToDoListDate({super.key, required this.pageHeader});
  final String pageHeader;
  @override
  Widget build(BuildContext context) {
    return Text(
      pageHeader,
      style: const TextStyle(
        decoration: TextDecoration.underline,
        decorationThickness: 2,
        decorationColor: toDoListHeaderColor,
        fontSize: 20,
        color: toDoListHeaderColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

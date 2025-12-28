import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class CustomToDoListDate extends StatelessWidget {
  const CustomToDoListDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
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
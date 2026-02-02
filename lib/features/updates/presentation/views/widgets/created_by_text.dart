import 'package:flutter/material.dart';

class CreatedByText extends StatelessWidget {
  const CreatedByText({
    super.key,
    required this.createdBy,
  });
  final String createdBy;
  @override
  Widget build(BuildContext context) {
    return Text(
      createdBy,
      style: const TextStyle(
          color: Color.fromARGB(255, 98, 210, 101),
          fontWeight: FontWeight.bold,
          fontSize: 16),
    );
  }
}

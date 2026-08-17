import 'package:flutter/material.dart';

class CustomBoxItem extends StatelessWidget {
  const CustomBoxItem({
    super.key,
    required this.value,
    required this.title,
  });
  final String value;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Opacity(
          opacity: .5,
          child: Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

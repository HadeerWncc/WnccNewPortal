import 'package:flutter/material.dart';

class LoadingSelectedList extends StatelessWidget {
  const LoadingSelectedList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Bags Quota (0)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 136, 135, 135),
          ),
        ),
        SizedBox(width: 10),
        Text(
          'Bulk Quota (0)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 136, 135, 135),
          ),
        )
      ],
    );
  }
}

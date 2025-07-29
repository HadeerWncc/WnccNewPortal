import 'package:flutter/material.dart';

class LoadingTitle extends StatelessWidget {
  const LoadingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Bags',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Text(
          ' Quota Distribution.',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

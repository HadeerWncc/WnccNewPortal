import 'package:flutter/material.dart';

class ForwardedSectionHeader extends StatelessWidget {
  const ForwardedSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Forwared Users',
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}
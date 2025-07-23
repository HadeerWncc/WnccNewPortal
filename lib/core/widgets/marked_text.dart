import 'package:flutter/material.dart';

class MarkedText extends StatelessWidget {
  const MarkedText({
    super.key, required this.child,
  });
  final String child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 250, 250),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        child,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
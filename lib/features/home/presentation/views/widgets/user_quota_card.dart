import 'package:flutter/material.dart';

class HomeUserCard extends StatelessWidget {
  const HomeUserCard({
    super.key,
    required this.child,
    this.width,
  });

  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 246, 246, 246),
              Color.fromARGB(255, 220, 220, 220),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 130, 130, 130),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: child);
  }
}

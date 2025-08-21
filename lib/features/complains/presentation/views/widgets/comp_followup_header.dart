import 'package:flutter/material.dart';

class CompSectionHeader extends StatelessWidget {
  const CompSectionHeader({super.key, required this.title, this.onPressed, required this.icon});
  final String title;
  final Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
        ),
      ],
    );
  }
}

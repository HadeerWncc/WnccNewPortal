import 'package:flutter/material.dart';

class CustomInfoItem extends StatelessWidget {
  const CustomInfoItem({
    super.key, required this.icon, required this.title,
  });
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Opacity(
          opacity: .5,
          child: Row(
            children: [
              Icon(
                icon,
                weight: 900,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
            ],
          ),
        );
    
  }
}
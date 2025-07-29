import 'package:flutter/material.dart';

class RequestTypeActionItem extends StatelessWidget {
  const RequestTypeActionItem({
    super.key,
    required this.icon,
    this.onTap,
  });
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      padding: const EdgeInsets.all(0),
      icon: Icon(
        icon,
        size: 20,
        weight: 900,
      ),
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(
          Color.fromARGB(255, 241, 241, 241),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
      ),
    );
  }
}

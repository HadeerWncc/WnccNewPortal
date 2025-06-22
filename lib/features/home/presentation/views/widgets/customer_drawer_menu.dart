import 'package:flutter/material.dart';

class CustomDrawerMenu extends StatelessWidget {
  const CustomDrawerMenu({
    super.key,
    required this.children,
    required this.title,
    required this.icon,
    this.iconColor,
    this.expanded = false,
  });
  final List<Widget> children;
  final String title;
  final IconData icon;
  final Color? iconColor;
  final bool expanded;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: expanded,
      shape: const Border(),
      collapsedIconColor: iconColor ?? Colors.white,
      collapsedTextColor: Colors.white,
      iconColor: iconColor ?? Colors.white,
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: children,
    );
  }
}

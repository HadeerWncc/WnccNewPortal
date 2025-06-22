import 'package:flutter/material.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    super.key,
    required this.title,
    this.onTap,
    this.active = false,
  });
  final String title;
  final void Function()? onTap;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Ink(
      color:
          active ? const Color.fromARGB(255, 54, 54, 55) : Colors.transparent,
      child: ListTile(
        // iconColor: kmutedColors,
        // textColor: kmutedColors,
        selected: active,
        selectedColor: Colors.white,
        // style: ListTileStyle(),
        title: Row(
          children: [
            const SizedBox(width: 20),
            const Icon(
              Icons.circle_sharp,
              size: 5,
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        onTap: onTap,
      ),
    );
  }
}

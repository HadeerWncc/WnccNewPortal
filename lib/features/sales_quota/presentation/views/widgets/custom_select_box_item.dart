import 'package:flutter/material.dart';

class CustomSelectBoxItem extends StatelessWidget {
  const CustomSelectBoxItem({
    super.key,
    required this.selected,
    this.onTap,
    required this.title,
  });
  final bool selected;
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: selected
                ? const BorderSide(
                    color: Colors.blue,
                    width: 2.5,
                  )
                : const BorderSide(color: Colors.white),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected
                ? Colors.black
                : const Color.fromARGB(255, 136, 135, 135),
          ),
        ),
      ),
    );
  }
}

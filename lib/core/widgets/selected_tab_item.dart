import 'package:flutter/material.dart';

class SelectedTabItem extends StatelessWidget {
  const SelectedTabItem({
    super.key,
    required this.title,
    this.active = false,
    this.onTap,
  });
  final String title;
  final bool active;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 40,
        decoration: BoxDecoration(
          color: active ? const Color(0xff008855) : const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: active
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(255, 90, 90, 91),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DottedBorder(
        color: const Color.fromARGB(255, 106, 103, 103),
        borderPadding: EdgeInsets.zero,
        radius: const Radius.circular(8),
        borderType: BorderType.RRect,
        strokeWidth: 2,
        dashPattern: const [5, 2], // lift is dash length, right is space length

        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 10),
          // width: MediaQuery.of(context).size.width * .4,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffE9F3FF),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  icon,
                  color: const Color.fromARGB(255, 76, 148, 235),
                  weight: 700,
                  size: 24,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

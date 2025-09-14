import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CustomDailyQuotaItem extends StatelessWidget {
  const CustomDailyQuotaItem({
    super.key,
    required this.landingtitle,
    required this.icon,
    required this.child,
    required this.widthRatio,
  });
  final String landingtitle;
  final IconData icon;
  final Widget child;
  final double widthRatio;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 2,
      dashPattern: const [2, 1],
      color: const Color.fromARGB(255, 192, 192, 192),
      radius: const Radius.circular(5),
      borderType: BorderType.RRect,
      child: Container(
        width: MediaQuery.of(context).size.width * widthRatio,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xff1C84FD),
                  weight: 900,
                ),
                const SizedBox(width: 5),
                child,
              ],
            ),
            Opacity(
              opacity: .5,
              child: Text(
                landingtitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

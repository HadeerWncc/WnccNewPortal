
import 'package:flutter/material.dart';

class HomeChartItem extends StatelessWidget {
  const HomeChartItem({
    super.key,
    required this.bgColor,
    required this.leftBorderColor,
    required this.title,
    required this.value,
  });
  final Color bgColor;
  final Color leftBorderColor;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 3,
      ),
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: leftBorderColor, width: 2)),
          color: bgColor,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(width: 20),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

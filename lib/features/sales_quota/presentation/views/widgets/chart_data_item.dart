import 'package:flutter/material.dart';

class ChartDataItem extends StatelessWidget {
  const ChartDataItem({
    super.key,
    required this.title,
    required this.dataColor,
  });
  final String title;
  final Color dataColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 20,
          decoration: BoxDecoration(
            color: dataColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(width: 5),
        Text(title),
      ],
    );
  }
}

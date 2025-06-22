import 'package:flutter/material.dart';

class CustomDetailsText extends StatelessWidget {
  const CustomDetailsText({
    super.key,
    required this.title,
    required this.subTitle,
    required this.fontSize,
  });
  final String title;
  final String subTitle;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Opacity(
          opacity: .4,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: fontSize,
            ),
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
    this.height,
    this.margin,
  });
  final double? height;
  final double? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.5,
      height: height ?? 25,
      margin: EdgeInsets.only(left: margin ?? 20),
      color: const Color.fromARGB(255, 207, 207, 207),
    );
  }
}

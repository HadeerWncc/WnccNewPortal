import 'package:flutter/material.dart';

class HeadDrawerInfoText extends StatelessWidget {
  const HeadDrawerInfoText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}

import 'package:flutter/material.dart';

Widget cell(String text, {bool header = false}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: header ? Colors.grey.shade200 : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: header ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ),
  );
}

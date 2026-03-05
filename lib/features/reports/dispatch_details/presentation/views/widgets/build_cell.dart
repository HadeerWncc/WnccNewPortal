  import 'package:flutter/material.dart';

Widget buildCell(String text,
      {double width = 100,
      bool isHeader = false,
      Color? color,
      BoxBorder? border}) {
    return Container(
      width: width,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        border: border ?? Border.all(color: Colors.grey.shade300, width: 0.5),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
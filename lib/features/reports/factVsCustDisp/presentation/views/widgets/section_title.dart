import 'package:flutter/material.dart';

Widget sectionTitle(String title) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xff2b6617),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      title,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

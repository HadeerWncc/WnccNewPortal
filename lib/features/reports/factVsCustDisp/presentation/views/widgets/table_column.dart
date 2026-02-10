import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';

Widget totalColumn(
    {required List<String> values,
    required String lableName,
    double? cellWidth = 90}) {
  return Column(
    children: [
      // Header
      Container(
        width: cellWidth ?? 90,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: tableHeaderColor,
          border: Border.symmetric(
            horizontal: BorderSide(color: Colors.grey.shade300, width: 1),
            vertical: const BorderSide(
                color: Color.fromARGB(255, 77, 160, 83), width: 1.5),
          ),
        ),
        child: Center(
          child: Text(
            lableName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),

      // Rows
      ...values.map(
        (v) => Container(
          width: cellWidth ?? 90,
          height: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: tableHeaderColor,
            border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.shade300, width: 1),
              vertical: const BorderSide(
                  color: Color.fromARGB(255, 77, 160, 83), width: 1.5),
            ),
          ),
          child: Center(
            child: Text(
              v,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ],
  );
}

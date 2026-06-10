import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/get_months_of_year.dart';

Widget buildHeaderPerSalesRow() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
    decoration: const BoxDecoration(
        color: kBtnColor,
        border: Border(
            top: BorderSide(
                color: Color.fromARGB(255, 163, 160, 160), width: 1))),
    child: Row(
      children: [
        const Expanded(
          flex: 1,
          child: Center(
            child: Text(
              '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        const Expanded(
            flex: 4,
            child: Text(
              'Name',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            )),
        const Expanded(
            flex: 2,
            child: Center(
                child: Text(
              'Date',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ))),
        for (var month in getMonths(DateTime.now().year))
          Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                month,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ))),
        const Expanded(
            flex: 3,
            child: Center(
                child: Text(
              'Total',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ))),
        const Expanded(
            flex: 3,
            child: Center(
                child: Text(
              'Today',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ))),
        const Expanded(
            flex: 3,
            child: Center(
                child: Text(
              'Checked in',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ))),
        const Expanded(
            flex: 3,
            child: Center(
                child: Text(
              'Loading',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ))),
      ],
    ),
  );
}

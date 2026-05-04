import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';

Widget loadingDataCell(double width) {
  return buildCell(
    NumberFormat.decimalPatternDigits(decimalDigits: 0).format(0),
    color: const Color(0xffe9e9e7),
    width: width,
    border: const Border.symmetric(
        horizontal: BorderSide(
      color: Color.fromARGB(255, 45, 83, 33),
      width: .5,
    )),
    isHeader: true,
  );
}

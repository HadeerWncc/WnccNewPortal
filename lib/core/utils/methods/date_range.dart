import 'package:flutter/material.dart';

Future<DateTimeRange?> pickDateRange({required BuildContext context}) async {
  final DateTimeRange? range = await showDateRangePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    initialDateRange: DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now(),
    ),
  );
  return range;
}

import 'package:intl/intl.dart';

List<Map<int, String>> getMonthsUntil(int endIndex) {
  return List.generate(
    endIndex,
    (i) => {
      i + 1: DateFormat.MMMM().format(DateTime(2025, i + 1)),
    },
  );
}

int getIndexOfMonth(String month, List<String> monthsName) {
  return monthsName.indexOf(month) + 1;
}

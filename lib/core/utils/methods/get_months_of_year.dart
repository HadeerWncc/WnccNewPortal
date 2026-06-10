import 'package:intl/intl.dart';

List<String> getMonths(int year) {
    final now = DateTime.now();

    final monthCount = year == now.year ? now.month : 12;

    return List.generate(
      monthCount,
      (index) => DateFormat.MMM().format(
        DateTime(year, index + 1),
      ),
    );
  }
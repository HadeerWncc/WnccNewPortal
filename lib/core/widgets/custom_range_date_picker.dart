import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomRangeDatePicker extends StatefulWidget {
  const CustomRangeDatePicker({super.key, required this.title, this.onChange});
 final String title;
  final void Function(DateTimeRange rangeDate)? onChange;
  @override
  State<CustomRangeDatePicker> createState() => _CustomRangeDatePickerState();
}

class _CustomRangeDatePickerState extends State<CustomRangeDatePicker> {
  String fomFormattedDate = DateFormat('d-M-y').format(DateTime.now());
  String toformattedDate = DateFormat('d-M-y').format(DateTime.now());
  // DateTime currentDate = DateTime.now();

  Future<void> _selectmonthYearPicker() async {
    final selected = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now(),
      ),
      // builder: (context, child) {
      //   return Theme(
      //     data: Theme.of(context).copyWith(
      //       colorScheme: const ColorScheme.light(
      //         primary: Color.fromARGB(255, 24, 111, 38),
      //         onPrimary: Colors.white,
      //         secondary: Color.fromARGB(255, 24, 111, 38),
      //         onSecondary: Colors.white,
      //       ),
      //       textTheme: const TextTheme(
      //         labelLarge: TextStyle(fontSize: 15),
      //       ),
      //     ),
      //     child: MediaQuery(
      //       data: MediaQuery.of(context)
      //           .copyWith(textScaler: const TextScaler.linear(0.95)),
      //       child: child!,
      //     ),
      //   );
      // },
    );

    if (selected != null && selected != DateTimeRange(start: DateTime.now(), end: DateTime.now())) {
      setState(() {
        fomFormattedDate = DateFormat('d-M-y').format(selected.start);
        toformattedDate = DateFormat('d-M-y').format(selected.end);
        if (widget.onChange != null) {
          widget.onChange!(selected);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectmonthYearPicker,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * .43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 211, 211, 211)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: .7,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Text(
              '$fomFormattedDate : $toformattedDate',
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

}
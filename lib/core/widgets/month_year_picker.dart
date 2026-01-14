import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class CustomMonthYearPicker extends StatefulWidget {
  const CustomMonthYearPicker({
    super.key,
    required this.title,
    this.onChange,
  });
  final String title;
  final void Function(DateTime currentDate)? onChange;
  @override
  State<CustomMonthYearPicker> createState() => _CustomMonthYearPicker();
}

class _CustomMonthYearPicker extends State<CustomMonthYearPicker> {
  String formattedDate = DateFormat('MMMM y').format(DateTime.now());
  DateTime currentDate = DateTime.now();

  Future<void> _selectmonthYearPicker() async {
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 24, 111, 38),
              onPrimary: Colors.white,
              secondary: Color.fromARGB(255, 24, 111, 38),
              onSecondary: Colors.white,
            ),
            textTheme: const TextTheme(
              labelLarge: TextStyle(fontSize: 15),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(0.95)),
            child: child!,
          ),
        );
      },
    );

    if (selected != null && selected != DateTime.now()) {
      setState(() {
        formattedDate = DateFormat('MMMM y').format(selected);
        currentDate = selected;
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
              formattedDate,
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

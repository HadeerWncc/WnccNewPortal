import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFilter extends StatefulWidget {
  const DateFilter({super.key});

  @override
  State<DateFilter> createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
  String formattedDate = DateFormat('MMMM d, y').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: _pickDate,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * .43,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: const Color.fromARGB(255, 211, 211, 211))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: .7,
              child: Text(
                'Date',
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

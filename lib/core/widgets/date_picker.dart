import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.title,
    this.onChange,
  });
  final String title;
  final void Function(DateTime currentDate)? onChange;
  // final DateTime date;
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String formattedDate = DateFormat('MMMM d, y').format(DateTime.now());
  DateTime currentDate = DateTime.now();
  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        formattedDate = DateFormat('MMMM d, y').format(picked);
        currentDate = picked;
        if (widget.onChange != null) {
          widget.onChange!(picked);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickDate,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * .43,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border:
                Border.all(color: const Color.fromARGB(255, 211, 211, 211))),
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

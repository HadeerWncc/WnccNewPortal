import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomYearPicker extends StatefulWidget {
  const CustomYearPicker({
    super.key,
    required this.title,
    this.onChange,
  });
  final String title;
  final void Function(DateTime currentDate)? onChange;
  @override
  State<CustomYearPicker> createState() => _CustomYearPicker();
}

class _CustomYearPicker extends State<CustomYearPicker> {
  String formattedDate = DateFormat('y').format(DateTime.now());
  DateTime currentDate = DateTime.now();

  Future<void> _selectYearPicker() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Year"),
          content: SizedBox(
            // تحديد حجم النافذة
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(2019),
              lastDate: DateTime(2030),
              selectedDate: currentDate,
              onChanged: (DateTime dateTime) {
                setState(() {
                  formattedDate = DateFormat('y').format(dateTime);
                  currentDate = dateTime;
                  if (widget.onChange != null) {
                    widget.onChange!(dateTime);
                  }
                });

                Navigator.pop(context); // إغلاق النافذة بعد الاختيار
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectYearPicker,
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

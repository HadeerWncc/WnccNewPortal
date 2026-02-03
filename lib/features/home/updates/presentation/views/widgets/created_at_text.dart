import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatedAtText extends StatelessWidget {
  const CreatedAtText({
    super.key,
    required this.createdAt,
  });
  final DateTime createdAt;
  @override
  Widget build(BuildContext context) {
    return Text(
      '${DateFormat('M/d/yy, h:mm a').format(createdAt)}  by ',
      style: const TextStyle(
        color: Color(0xff8089a2),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}

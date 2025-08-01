import 'package:flutter/material.dart';

class RequestTypeStatusWidget extends StatelessWidget {
  const RequestTypeStatusWidget({
    super.key,
    required this.requestTypeStatus,
  });
  final String requestTypeStatus;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 7),
        Text(
          requestTypeStatus,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

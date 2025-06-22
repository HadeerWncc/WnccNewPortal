import 'package:flutter/material.dart';

class CustomSalesQuotaTitle extends StatelessWidget {
  const CustomSalesQuotaTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const Text(
          ' Quota Distribution.',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

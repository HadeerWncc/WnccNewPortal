import 'package:flutter/material.dart';

class CustomDataCellWidget extends StatelessWidget {
  const CustomDataCellWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            textAlign: TextAlign.center,
            subTitle,
            style: const TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 104, 104, 104),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

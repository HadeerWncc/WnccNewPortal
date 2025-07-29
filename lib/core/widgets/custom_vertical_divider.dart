import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: 25,
      margin: const EdgeInsets.only(left: 20),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Color.fromARGB(255, 207, 207, 207),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

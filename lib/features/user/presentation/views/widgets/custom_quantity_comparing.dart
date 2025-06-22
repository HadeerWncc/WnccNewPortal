import 'package:flutter/material.dart';

class CustomQuantityComparing extends StatelessWidget {
  const CustomQuantityComparing({
    super.key,
    required this.quantity,
    // required this.remaining,
  });
  final String quantity;
  // final String remaining;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          quantity,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 17,
          ),
        ),
        // const SizedBox(width: 5),
        // Container(
        //   width: 2,
        //   height: 12,
        //   color: Colors.black,
        // ),
        // const SizedBox(width: 5),
        // Text(
        //   remaining,
        //   style: const TextStyle(
        //     color: Colors.red,
        //     fontSize: 14,
        //   ),
        // )
      ],
    );
  }
}

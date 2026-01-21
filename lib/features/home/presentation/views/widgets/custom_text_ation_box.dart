import 'package:flutter/material.dart';

class CustomTextActionBox extends StatelessWidget {
  const CustomTextActionBox({
    super.key,
    required this.name,
    required this.position,
  });
  final String name;
  final String position;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff99a1b7),
          ),
        ),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 0.4,
        //   child: Text(
        //     textAlign: TextAlign.end,
        //     position,
        //     overflow: TextOverflow.ellipsis,
        //     style: const TextStyle(
        //       fontSize: 12,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

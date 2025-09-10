import 'package:flutter/material.dart';

class CustomUserNameWidget extends StatelessWidget {
  const CustomUserNameWidget({
    super.key,
    required this.child,
  });
  final String child;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          child,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 5),
        const Icon(
          Icons.verified_sharp,
          color: Colors.blue,
          size: 18,
        ),
        // const SizedBox(width: 7),
        // const CustomMarkedColorContainer(
        //   title: "Available",
        //   color: Colors.green,
        //   bgColor: Color(0xffD9FDE3),
        // ),
      ],
    );
  }
}

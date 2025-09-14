import 'package:flutter/material.dart';

class CustomQuantityComparing extends StatelessWidget {
  const CustomQuantityComparing({
    super.key,
    required this.mainTitle,
    this.subTitle,
  });
  final String mainTitle;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          mainTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 17,
          ),
        ),
        const SizedBox(width: 5),
        subTitle != null
            ? Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    height: 12,
                    width: 2,
                    color: Colors.black,
                  ),
                  Text(
                    subTitle!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            : const SizedBox()

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

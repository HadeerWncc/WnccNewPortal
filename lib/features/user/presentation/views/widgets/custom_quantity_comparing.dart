import 'package:flutter/material.dart';

class CustomQuantityComparing extends StatelessWidget {
  const CustomQuantityComparing({
    super.key,
    required this.mainTitle,
    this.subTitle,
    this.mainDataFontSize,
  });
  final String mainTitle;
  final String? subTitle;
  final double? mainDataFontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          mainTitle,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: mainDataFontSize ?? 17,
            color: const Color(0xff2b6617),
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

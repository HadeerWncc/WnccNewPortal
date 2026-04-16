import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_vertical_divider.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_quantity_comparing.dart';

class CustomSummary extends StatelessWidget {
  const CustomSummary({
    super.key,
    required this.landingtitle,
    required this.icon,
    required this.widthRatio,
    required this.child,
    // required this.data,
  });
  final String landingtitle;
  final IconData icon;
  // final Map<String, int> data;
  final Widget child;
  final double widthRatio;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 2,
      dashPattern: const [2, 1],
      color: const Color.fromARGB(255, 192, 192, 192),
      radius: const Radius.circular(5),
      borderType: BorderType.RRect,
      child: Container(
        width: MediaQuery.of(context).size.width * widthRatio,
        padding: const EdgeInsets.all(10),
        color: const Color(0xfff0f7ec),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Opacity(
                  opacity: .5,
                  child: Text(
                    landingtitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                // const Text(
                //   "Bags ",
                //   style: TextStyle(),
                // ),
                child,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

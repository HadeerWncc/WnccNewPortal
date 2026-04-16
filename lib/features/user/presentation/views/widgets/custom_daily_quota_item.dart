import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/widgets/custom_vertical_divider.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_quantity_comparing.dart';

class CustomDailyQuotaItem extends StatelessWidget {
  const CustomDailyQuotaItem({
    super.key,
    required this.landingtitle,
    required this.icon,
    required this.widthRatio,
    required this.data,
  });
  final String landingtitle;
  final IconData icon;
  final Map<String, int> data;
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
                const SizedBox(width: 5),
                Text(
                  NumberFormat.decimalPattern().format(data["Total"]),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2b6617),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text(
                  "Bags ",
                  style: TextStyle(),
                ),
                CustomQuantityComparing(
                  mainTitle: NumberFormat.decimalPattern().format(data["Bags"]),
                  mainDataFontSize: 13,
                ),
                const Opacity(
                    opacity: .5,
                    child: CustomVerticalDivider(
                      color: Color.fromARGB(255, 100, 100, 100),
                      margin: 0,
                    )),
                const SizedBox(width: 5),
                const Text(
                  "Bulk ",
                  style: TextStyle(),
                ),
                CustomQuantityComparing(
                  mainTitle: NumberFormat.decimalPattern().format(data["Bulk"]),
                  mainDataFontSize: 13,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

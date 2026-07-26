import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_vertical_divider.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_box_item.dart';

class BoxSummarySection extends StatelessWidget {
  const BoxSummarySection({
    super.key, required this.title, required this.subTitle, required this.value1, required this.title1, required this.value2, required this.title2, required this.value3, required this.title3,
  });
  final String title;
  final String subTitle;
  final String value1;
  final String title1;
   final String value2;
  final String title2;
   final String value3;
  final String title3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 5),
         Opacity(
          opacity: .5,
          child: Text(
            subTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBoxItem(
              value: value1,
              title: title1,
            ),
            const CustomVerticalDivider(
              color: Colors.grey,
              height: 50,
              margin: 5,
            ),
            CustomBoxItem(
              title: title2,
              value: value2,
            ),
            const CustomVerticalDivider(
              color: Colors.grey,
              height: 50,
              margin: 5,
            ),
            CustomBoxItem(
              title: title3,
              value: value3,
            ),
          ],
        )
      ],
    );
  }
}

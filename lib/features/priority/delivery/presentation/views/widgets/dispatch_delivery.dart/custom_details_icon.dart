import 'package:flutter/material.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/custom_details_text.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/process_state.dart';

class CustomDetailsItem extends StatelessWidget {
  const CustomDetailsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.processColor,
  });
  final Icon icon;
  final String title;
  final String subTitle;
  final Color processColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: const Color.fromARGB(255, 207, 207, 207),
                    width: 1.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: icon,
              ),
            ),
            const SizedBox(width: 12),
            CustomDetailsText(
              title: title,
              subTitle: subTitle,
              fontSize: 16,
            ),
          ],
        ),
        ProcessStatus(color: processColor),
      ],
    );
  }
}

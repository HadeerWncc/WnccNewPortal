import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/custom_details_heading_icon.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/custom_details_text.dart';

class CustomDetailsHeading extends StatelessWidget {
  const CustomDetailsHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomDetailsHeadingIcon(),
            SizedBox(width: 12),
            CustomDetailsText(
              title: 'Shipment Delivery',
              subTitle: '#1234567890',
              fontSize: 16,
            ),
          ],
        ),
        CustomMarkedColorContainer(
          title: 'Delivered',
          color: Colors.green,
          bgColor: Color(0xffD9FDE3),
        ),
      ],
    );
  }
}

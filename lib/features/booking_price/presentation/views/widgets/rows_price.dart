import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class RowsPrice extends StatelessWidget {
  const RowsPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width * .418;
    return Row(
      children: [
        CustomPlaceholderInput(
          width: itemWidth,
          controller: TextEditingController(),
          labelText: 'Delivery Price',
        ),
        const SizedBox(width: 7),
        CustomPlaceholderInput(
          width: itemWidth,
          controller: TextEditingController(),
          labelText: 'Pickup Price',
        ),
        const SizedBox(width: 7),
        CustomPlaceholderInput(
          width: itemWidth,
          controller: TextEditingController(),
          labelText: 'Delivery Target Price',
        ),
        const SizedBox(width: 7),
        CustomPlaceholderInput(
          width: itemWidth,
          controller: TextEditingController(),
          labelText: 'Pickup Target Price',
        ),
      ],
    );
  }
}
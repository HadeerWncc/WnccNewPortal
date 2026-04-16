import 'package:flutter/material.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickupility_product.dart';

class CustomPickupDataCellCheckbox extends StatefulWidget {
  const CustomPickupDataCellCheckbox({
    super.key,
    required this.onChanged,
    required this.pickupOrderId,
    // this.agent,
  });

  final PickupilityProduct pickupOrderId;
  // final String? agent;
  final Function(bool isChecked) onChanged;

  @override
  State<CustomPickupDataCellCheckbox> createState() =>
      _CustomPickupDataCellCheckboxState();
}

class _CustomPickupDataCellCheckboxState
    extends State<CustomPickupDataCellCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Checkbox(
        checkColor: Colors.blue,
        activeColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        side: const BorderSide(color: Colors.grey, width: 2),
        value: isChecked,
        onChanged: (value) {
          isChecked = value!;
          widget.onChanged(value);
          // widget.onChanged(
          //   value == false
          //       ? null
          //       : DispatchDeliveryEntity(
          //           id: widget.orderId,
          //           agentName:  "",
          //         ),
          // );
          // Save orderId if checked
          setState(() {});
        },
      ),
    );
  }
}

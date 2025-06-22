import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_radio_button.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/select_routing_item_icon.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/select_routing_item_title.dart';

class SelectRoutingItem extends StatelessWidget {
  const SelectRoutingItem({
    super.key,
    required this.pageName,
    required this.active,
  });
  final String pageName;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SelectRoutingItemIcon(),
              const SizedBox(width: 15),
              SelectRoutingItemTitle(
                title: pageName,
              )
            ],
          ),
          CustomRadioButton(active: active),
        ],
      ),
    );
  }
}

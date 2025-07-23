import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_info_item.dart';

class ContactPersonInfoSection extends StatelessWidget {
  const ContactPersonInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInfoItem(
            icon: Symbols.account_circle,
            title: 'Ahmed Ali',
          ),
          SizedBox(width: 10),
          CustomInfoItem(
            icon: Symbols.call,
            title: '01126305467',
          ),
          SizedBox(width: 10),
          CustomInfoItem(
            icon: Symbols.schedule,
            title: '2025-07-20',
          ),
        ],
      ),
    );
  }
}

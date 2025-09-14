import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_info_item.dart';
import 'package:wncc_portal/features/customerService/complains/domain/entities/complain_details_entity.dart';

class ComplainContactPersonInfoSection extends StatelessWidget {
  const ComplainContactPersonInfoSection({super.key, required this.complain});
  final ComplainDetailsEntity complain;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInfoItem(
            icon: Symbols.account_circle,
            title: complain.contactPerson ?? "",
          ),
          const SizedBox(width: 10),
          CustomInfoItem(
            icon: Symbols.call,
            title: complain.contactPhone ?? "",
          ),
          const SizedBox(width: 10),
          CustomInfoItem(
            icon: Symbols.schedule,
            title: complain.createdAt.toString().split(' ')[0],
          ),
        ],
      ),
    );
  }
}

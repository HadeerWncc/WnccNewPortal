import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_info_item.dart';
import 'package:wncc_portal/features/requests/data/models/request_details_model/request_details_model.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_details_entity.dart';

class ContactPersonInfoSection extends StatelessWidget {
  const ContactPersonInfoSection({
    super.key, required this.requestDetailsEntity,
  });
  final RequestDetailsEntity requestDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInfoItem(
            icon: Symbols.account_circle,
            title: requestDetailsEntity.contactPerson??"",
          ),
          const SizedBox(width: 10),
          CustomInfoItem(
            icon: Symbols.call,
            title: requestDetailsEntity.contactPhone??"",
          ),
          const SizedBox(width: 10),
          CustomInfoItem(
            icon: Symbols.schedule,
            title: requestDetailsEntity.createdAt.toString().split(' ')[0],
          ),
        ],
      ),
    );
  }
}

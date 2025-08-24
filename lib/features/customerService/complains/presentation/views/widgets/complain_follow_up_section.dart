import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/comp_followup_header.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/log_entity.dart';
import 'package:wncc_portal/features/customerService/requests/domain/enums/request_status_enum.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/followup_section_body.dart';

class ComplainFollowUpSection extends StatelessWidget {
  const ComplainFollowUpSection({super.key, required this.complainLogs});
  final List<LogEntity> complainLogs;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromARGB(255, 180, 179, 179))),
      child: Column(
        children: [
          CompSectionHeader(
            title: 'Follow_up',
            icon: Symbols.add_circle,
            onPressed: (){},
          ),
          const SizedBox(height: 15),
          FollowUpSectionBody(
            logs: complainLogs,
          )
        ],
      ),
    );
  }
}

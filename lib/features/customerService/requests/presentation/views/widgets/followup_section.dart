import 'package:flutter/material.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/log_entity.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/followup_section_body.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/followup_section_header.dart';

class FollowUpSection extends StatelessWidget {
  const FollowUpSection({
    super.key,
    required this.logs,
    required this.requestName,
  });
  final List<LogEntity> logs;
  final String requestName;
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
          FollowUpSectionHeader(
            requestName: requestName,
          ),
          const SizedBox(height: 15),
          FollowUpSectionBody(
            logs: logs,
          )
        ],
      ),
    );
  }
}

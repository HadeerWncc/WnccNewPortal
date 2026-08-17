import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/pending/presentation/views/widgets/pending_report_buttons_list.dart';
import 'package:wncc_portal/features/reports/pending/presentation/views/widgets/pickup_pending_section.dart';

class PickupPendingBody extends StatelessWidget {
  const PickupPendingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          PendingReportButtonsList(
            activeTab: 1,
          ),
          SizedBox(height: 16),
          Expanded(child: PickupPendingSection()),
        ],
      ),
    );
  }
}

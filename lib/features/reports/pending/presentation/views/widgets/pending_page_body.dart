import 'package:flutter/widgets.dart';
import 'package:wncc_portal/features/reports/pending/presentation/views/widgets/pending_report_buttons_list.dart';
import 'package:wncc_portal/features/reports/pending/presentation/views/widgets/pending_section.dart';

class PendingPageBody extends StatelessWidget {
  const PendingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          PendingReportButtonsList(
            activeTab: 0,
          ),
          SizedBox(height: 16),
          Expanded(child: PendingSection()),
        ],
      ),
    );
  }
}

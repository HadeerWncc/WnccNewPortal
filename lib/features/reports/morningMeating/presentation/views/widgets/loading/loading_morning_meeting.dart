import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/views/widgets/loading/morning_table_loading.dart';

class LoadingMorningMeeting extends StatelessWidget {
  const LoadingMorningMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle('Factory (FLS)'),
          const SizedBox(height: 8),
          const MorningTableLoading(),
          const SizedBox(height: 30),
          sectionTitle('Customer (P&L)'),
          const SizedBox(height: 8),
          const MorningTableLoading(),
        ],
      ),
    );
  }
}

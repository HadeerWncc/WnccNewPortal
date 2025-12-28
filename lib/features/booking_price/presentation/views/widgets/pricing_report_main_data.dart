import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/filter_part_body.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/pricing_report_summary.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/pricing_report_tables.dart';

class PricingReportMainData extends StatelessWidget {
  const PricingReportMainData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        FilterPartBody(),
        SizedBox(height: 20),
        DividerLine(),
        PricingReportSummary(),
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 10),
        PricingReportTables(),
      ],
    );
  }
}

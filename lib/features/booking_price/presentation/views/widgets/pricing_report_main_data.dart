import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/filter_part_body.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/pricing_report_summary.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/pricing_report_tables.dart';

class PricingReportMainData extends StatelessWidget {
  const PricingReportMainData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        FilterPartBody(),
        const SizedBox(height: 20),
        const DividerLine(),
        PricingReportSummary(),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        PricingReportTables(),
      ],
    );
  }
}
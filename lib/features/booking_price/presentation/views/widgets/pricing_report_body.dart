import 'package:flutter/material.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/pricing_report_main_data.dart';

class PricingReportBody extends StatelessWidget {
  const PricingReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
         PricingReportMainData()
      ],
    );
  }
}
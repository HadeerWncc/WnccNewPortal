import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payment_report_buttons_list.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payments_hourly_header.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payments_table.dart';

class HourlyPaymentsBody extends StatelessWidget {
  const HourlyPaymentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          PaymentReportButtonsList(),
          SizedBox(height: 16),

          PaymentsHourlyHeader(),
          SizedBox(height: 16),
          // Expanded(child: PaymentsTable()),
        ],
      ),
    );
  }
}
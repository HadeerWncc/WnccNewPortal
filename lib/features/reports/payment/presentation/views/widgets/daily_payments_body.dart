import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/daily_payment_tables_section.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payment_report_buttons_list.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payments_daily_header.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payments_table.dart';

class DailyPaymentsBody extends StatelessWidget {
  const DailyPaymentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          PaymentReportButtonsList(),
          SizedBox(height: 16),

          PaymentsDailyHeader(),
          SizedBox(height: 16),
          Expanded(child: DailyPaymentTablesSection()),
        ],
      ),
    );
  }
}
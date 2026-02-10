import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/monthly_payment_tables_section.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payment_report_buttons_list.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payments_monthly_header.dart';

class MonthlyPaymentsBody extends StatelessWidget {
  const MonthlyPaymentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          PaymentReportButtonsList(activeTab: 0,),
          SizedBox(height: 16),
          PaymentsMonthlyHeader(),
          SizedBox(height: 16),
          Expanded(child: MonthlyPaymentTablesSection()),
        ],
      ),
    );
  }
}


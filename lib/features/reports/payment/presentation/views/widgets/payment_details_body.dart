import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payment_report_buttons_list.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payments_details_header.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payments_details_section.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          PaymentReportButtonsList(activeTab: 1,),
          SizedBox(height: 16),
          PaymentsDetailsHeader(),
          SizedBox(height: 16),
          Expanded(child: PaymentsDetailsSection()),
        ],
      ),
    );
  }
}
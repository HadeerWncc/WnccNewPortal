import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payment_cubit/payments_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/daily_payment_tables_section.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payment_report_buttons_list.dart';

class DailyPaymentsBody extends StatelessWidget {
  const DailyPaymentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PaymentsCubit>(context)
        .fetchPayments(2, DateTime.now(), "");
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          PaymentReportButtonsList(
            activeTab: 0,
          ),
          SizedBox(height: 16),
          Expanded(child: DailyPaymentTablesSection()),
        ],
      ),
    );
  }
}

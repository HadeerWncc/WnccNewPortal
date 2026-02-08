import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_toggle_button.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/table_column.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment/payment.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/build_table_data.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payment_cubit/payments_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_button_item.dart';
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


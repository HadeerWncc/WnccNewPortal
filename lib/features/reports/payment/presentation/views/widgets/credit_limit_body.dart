import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/credit_limit_cubit/credit_limit_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/credit_limit_section.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payment_report_buttons_list.dart';

class CreditLimitBody extends StatefulWidget {
  const CreditLimitBody({super.key});

  @override
  State<CreditLimitBody> createState() => _CreditLimitBodyState();
}

class _CreditLimitBodyState extends State<CreditLimitBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CreditLimitCubit>(context).getCreditLimit();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          PaymentReportButtonsList(
            activeTab: 2,
          ),
          SizedBox(height: 16),
          Expanded(child: CreditLimitSection()),
        ],
      ),
    );
  }
}

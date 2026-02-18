import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/report_options_list.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/custom_year_picker.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payment_cubit/payments_cubit.dart';

class PaymentsMonthlyHeader extends StatelessWidget {
  const PaymentsMonthlyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(spacing: 8, runSpacing: 8, children: [
        SizedBox(
          width: (MediaQuery.of(context).orientation == Orientation.landscape)
              ? MediaQuery.of(context).size.width * .2
              : MediaQuery.of(context).size.width * .35,
          child: CustomDropDownInput(
            title: 'Select',
            items: reportOptionsList,
            selectedValue: 'Monthly',
            onChanged: (value) {
              // Handle dropdown change
              if (value == 'Daily') {
                GoRouter.of(context).push(AppRouter.paymentsDailyPath);
              }
            },
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).orientation == Orientation.landscape)
              ? MediaQuery.of(context).size.width * .25
              : MediaQuery.of(context).size.width * .5,
          child: CustomYearPicker(
            title: 'Select Year',
            onChange: (value) {
              BlocProvider.of<PaymentsCubit>(context).fetchPayments(1, value);
            },
          ),
        ),
      ]),
    );
  }
}

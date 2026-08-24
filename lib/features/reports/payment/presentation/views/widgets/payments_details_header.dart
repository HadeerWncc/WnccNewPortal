import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/report_options_list.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_range_date_picker.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payments_details_cubit/payments_details_cubit.dart';

class PaymentsDetailsHeader extends StatefulWidget {
  const PaymentsDetailsHeader({super.key});

  @override
  State<PaymentsDetailsHeader> createState() => _PaymentsDetailsHeaderState();
}

class _PaymentsDetailsHeaderState extends State<PaymentsDetailsHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
          width: (MediaQuery.of(context).orientation == Orientation.landscape)
              ? MediaQuery.of(context).size.width * .2
              : MediaQuery.of(context).size.width * .35,
          child: CustomDropDownInput(
            title: 'Select',
            items: [...reportOptionsList, "Per Customer", "Details"],
            selectedValue: 'Details',
            onChanged: (value) {
              // Handle dropdown change
              if (value == 'Monthly') {
                GoRouter.of(context).push(AppRouter.paymentsMonthlyPath);
              } else if (value == "Per Customer") {
                GoRouter.of(context).push(AppRouter.paymentsPerCustomerPath);
              }
              else if (value == "Daily") {
                GoRouter.of(context).push(AppRouter.paymentsDailyPath);
              }
            },
          ),
        ),
          SizedBox(
            width:  MediaQuery.of(context).size.width * .5,
            child: CustomRangeDatePicker(
              title: 'Select Date Range',
              onChange: (value) {
                BlocProvider.of<PaymentsDetailsCubit>(context)
                    .getPaymentDetails(value.start, value.end);
              },
            ),
          ),
        ],
      ),
    );
  }
}

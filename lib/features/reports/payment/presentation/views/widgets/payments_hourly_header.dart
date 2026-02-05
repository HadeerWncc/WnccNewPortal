import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/report_options_list.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/date_picker.dart';

class PaymentsHourlyHeader extends StatelessWidget {
  const PaymentsHourlyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(spacing: 8, runSpacing: 8, children: [
        SizedBox(
          width: 180,
          child: CustomDropDownInput(
            title: 'Select',
            items: reportOptionsList,
            selectedValue: 'Hourly',
            onChanged: (value) {
              // Handle dropdown change
              if (value == 'Monthly') {
                GoRouter.of(context).push(AppRouter.paymentsPath);
              } else if (value == 'Daily') {
                GoRouter.of(context).push(AppRouter.paymentsDailyPath);
              }
            },
          ),
        ),
        DatePicker(
          title: 'Select Date',
          onChange: (value) {
            // BlocProvider.of<FactVsCustCubit>(context)
            //     .getFactVsCustDisp(3, value);
          },
        ),
      ]),
    );
  }
}

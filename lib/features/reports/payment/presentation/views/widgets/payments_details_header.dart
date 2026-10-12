import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/report_options_list.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_range_date_picker.dart';
import 'package:wncc_portal/core/widgets/custom_toggle_button.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payments_details_cubit/payments_details_cubit.dart';

class PaymentsDetailsHeader extends StatefulWidget {
  const PaymentsDetailsHeader(
      {super.key, this.onChangeActiveTap, this.onToggleChange});
  final dynamic Function(int)? onChangeActiveTap;
  final dynamic Function(bool)? onToggleChange;
  @override
  State<PaymentsDetailsHeader> createState() => _PaymentsDetailsHeaderState();
}

class _PaymentsDetailsHeaderState extends State<PaymentsDetailsHeader> {
  int activeTab = 0;
  bool openCharts = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (MediaQuery.of(context).orientation == Orientation.landscape)
                ? MediaQuery.of(context).size.width * .2
                : MediaQuery.of(context).size.width * .4,
            child: CustomDropDownInput(
              title: 'Select',
              items: [...reportOptionsList, "Per Customer", "Details"],
              selectedValue: 'Details',
              fontSize: 12,
              onChanged: (value) {
                // Handle dropdown change
                if (value == 'Monthly') {
                  GoRouter.of(context).push(AppRouter.paymentsMonthlyPath);
                } else if (value == "Per Customer") {
                  GoRouter.of(context).push(AppRouter.paymentsPerCustomerPath);
                } else if (value == "Daily") {
                  GoRouter.of(context).push(AppRouter.paymentsDailyPath);
                }
              },
            ),
          ),
          const SizedBox(width: 5),

          SizedBox(
            width: (MediaQuery.of(context).orientation == Orientation.landscape)
                ? MediaQuery.of(context).size.width * .3
                : MediaQuery.of(context).size.width * .5,
            child: CustomRangeDatePicker(
              title: 'Select Date Range',
              onChange: (value) {
                BlocProvider.of<PaymentsDetailsCubit>(context)
                    .getPaymentDetails(value.start, value.end);
              },
            ),
          ),
          const SizedBox(width: 5),
          CustomChckButtons(
              buttons: const ["EGP", "USD"],
              activeTab: activeTab,
              onTap: (value) {
                if (value == "EGP") {
                  activeTab = 0;
                } else {
                  activeTab = 1;
                }
                setState(() {});
                widget.onChangeActiveTap?.call(activeTab);
              }),
          const SizedBox(width: 7),
          CustomToggleButton(
              onToggle: (value) => setState(() {
                    openCharts = value;
                    setState(() {});
                    widget.onToggleChange?.call(openCharts);
                  })),
        ],
      ),
    );
  }
}

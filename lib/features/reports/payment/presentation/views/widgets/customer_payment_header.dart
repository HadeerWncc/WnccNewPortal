import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/report_options_list.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/fields/loading_input.dart';
import 'package:wncc_portal/features/payer/presentation/manager/cubites/payer_cubit/payer_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payment_per_customer_cubit/payment_per_customer_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payments_details_cubit/payments_details_cubit.dart';

class CustomerPaymentHeader extends StatefulWidget {
  const CustomerPaymentHeader({super.key, this.onChangePayer, this.onChangeActiveTab});
  final Function(String? payer)? onChangePayer;
  final Function(int activeTab)? onChangeActiveTab;
  @override
  State<CustomerPaymentHeader> createState() => _CustomerPaymentHeaderState();
}

class _CustomerPaymentHeaderState extends State<CustomerPaymentHeader> {
  DateTime date = DateTime.now();
  String? payer = "";
  int activeTab = 0;

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
              : MediaQuery.of(context).size.width * .4,
          child: CustomDropDownInput(
            title: 'Select',
            items: [...reportOptionsList, "Per Customer", "Details"],
            fontSize: 12,
            selectedValue: 'Per Customer',
            onChanged: (value) {
              // Handle dropdown change
              if (value == 'Daily') {
                GoRouter.of(context).push(AppRouter.paymentsDailyPath);
              } else if (value == "Monthly") {
                GoRouter.of(context).push(AppRouter.paymentsMonthlyPath);
              } else if (value == "Details") {
                BlocProvider.of<PaymentsDetailsCubit>(context)
                    .getPaymentDetails(DateTime.now(), DateTime.now());
                GoRouter.of(context).push(AppRouter.paymentsDetailsPath);
              }
            },
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        BlocBuilder<PayerCubit, PayerState>(
          builder: (context, state) {
            if (state is PayerSuccess) {
              return CustomDropDownInput(
                items: [
                  "All",
                  ...state.payerModel.map((p) => "${p.fullName}|${p.id}")
                ],
                selectedValue: "All",
                hintText: "Select Customer",
                title: "Select Customer",
                fontSize: 14,
                width: (MediaQuery.of(context).orientation ==
                        Orientation.landscape)
                    ? MediaQuery.of(context).size.width * .3
                    : MediaQuery.of(context).size.width * .45,
                onChanged: (value) {
                  if (value == "All") {
                    payer = "";
                  } else {
                    payer = value?.split("|")[1];
                  }
                  setState(() {});
                  widget.onChangePayer?.call(payer);
                },
              );
            } else {
              return SizedBox(
                width: (MediaQuery.of(context).orientation ==
                        Orientation.landscape)
                    ? MediaQuery.of(context).size.width * .3
                    : MediaQuery.of(context).size.width * .45,
                child: const LoadingInput(),
              );
            }
          },
        ),
        BlocBuilder<PaymentPerCustomerCubit, PaymentPerCustomerState>(
          builder: (context, state) {
            if (state is PaymentPerCustomerSuccess) {
              final cubit = context.read<PaymentPerCustomerCubit>();

              return CustomDropDownInput(
                selectedValue: "All",
                items: ["All", ...state.sales],
                title: "Sales",
                hintText: "Sales",
                fontSize: 14,
                width:(MediaQuery.of(context).orientation ==
                        Orientation.landscape)
                    ? MediaQuery.of(context).size.width * .2: MediaQuery.of(context).size.width * 0.4,
                onChanged: (value) {
                  cubit.changeSales(value!);
                },
              );
            } else {
              return SizedBox(
                width:(MediaQuery.of(context).orientation ==
                        Orientation.landscape)
                    ? MediaQuery.of(context).size.width * .2: MediaQuery.of(context).size.width * 0.4,
                child: const LoadingInput(),
              );
            }
          },
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
              widget.onChangeActiveTab?.call(activeTab);
            }),
      ]),
    );
  }
}

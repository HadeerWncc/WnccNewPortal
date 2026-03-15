import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/report_options_list.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/fields/loading_input.dart';
import 'package:wncc_portal/features/payer/presentation/manager/cubites/payer_cubit/payer_cubit.dart';

class CustomerPaymentHeader extends StatefulWidget {
  const CustomerPaymentHeader({super.key, this.onChangePayer});
  final Function(String? payer)? onChangePayer;
  @override
  State<CustomerPaymentHeader> createState() => _CustomerPaymentHeaderState();
}

class _CustomerPaymentHeaderState extends State<CustomerPaymentHeader> {
  DateTime date = DateTime.now();
  String? payer = "";
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
            items: [...reportOptionsList, "Per Customer"],
            selectedValue: 'Per Customer',
            onChanged: (value) {
              // Handle dropdown change
              if (value == 'Daily') {
                GoRouter.of(context).push(AppRouter.paymentsDailyPath);
              } else if (value == "Monthly") {
                GoRouter.of(context).push(AppRouter.paymentsMonthlyPath);
              }
            },
          ),
        ),
        // SizedBox(
        //   width: (MediaQuery.of(context).orientation == Orientation.landscape)
        //       ? MediaQuery.of(context).size.width * .25
        //       : MediaQuery.of(context).size.width * .5,
        //   child: CustomYearPicker(
        //     title: 'Select Year',
        //     onChange: (value) {
        //       date = value;
        //       setState(() {});
        //     },
        //   ),
        // ),
        const SizedBox(
          width: 10,
        ),
        BlocBuilder<PayerCubit, PayerState>(
          builder: (context, state) {
            if (state is PayerSuccess) {
              return CustomDropDownInput(
                items: [
                  "All",
                  ...state.payerModel.map((p) => p.fullName ?? "")
                ],
                selectedValue: "All",
                hintText: "payer",
                title: "Payer",
                width: MediaQuery.of(context).size.width * .5,
                onChanged: (value) {
                  if (value == "All") {
                    payer = "";
                  } else {
                    payer = state.payerModel
                        .firstWhere((p) => p.fullName == value)
                        .id;
                  }
                  setState(() {});
                  widget.onChangePayer?.call(payer);

                },
              );
            } else {
              return SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: const LoadingInput(),
              );
            }
          },
        ),

        // SizedBox(
        //   width: MediaQuery.of(context).size.width * .3,
        //   child: CustomButtonWithIcon(
        //     child: 'Search',
        //     textColor: Colors.white,
        //     bgColor: kBtnColor,
        //     onHoverColor: const Color.fromARGB(255, 98, 224, 128),
        //     icon: Symbols.document_search,
        //     onTap: () {
        //       BlocProvider.of<PaymentsCubit>(context)
        //           .fetchPayments(1, date, payer);
        //     },
        //   ),
        // )
      ]),
    );
  }
}

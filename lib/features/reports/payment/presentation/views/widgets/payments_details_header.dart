import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      // width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: (MediaQuery.of(context).orientation == Orientation.landscape)
            ? MediaQuery.of(context).size.width * .4
            : MediaQuery.of(context).size.width * .9,
        child: CustomRangeDatePicker(
          title: 'Select Date Range',
          onChange: (value) {
            BlocProvider.of<PaymentsDetailsCubit>(context)
                .getPaymentDetails(value.start, value.end);
          },
        ),
      ),
      // Wrap(spacing: 8, runSpacing: 8, children: [
      //   DatePicker(
      //     title: 'From Date',
      //     onChange: (value) {
      //       BlocProvider.of<PaymentsDetailsCubit>(context)
      //           .getPaymentDetails(value, value);
      //     },
      //   ),
      //   const SizedBox(width: 8),
      //   DatePicker(
      //     title: 'To Date',
      //     onChange: (value) {
      //       BlocProvider.of<PaymentsDetailsCubit>(context)
      //           .getPaymentsDetails(3, value);
      //     },
      //   ),

      // ]),
    );
  }
}

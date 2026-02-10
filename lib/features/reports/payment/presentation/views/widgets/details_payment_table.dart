import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payments_details_cubit/payments_details_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/details_table_with_filter.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/details_loading.dart';

class DetailsPaymentTable extends StatelessWidget {
  const DetailsPaymentTable({super.key, required this.currency});
  final String currency;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentsDetailsCubit, PaymentsDetailsState>(
      builder: (context, state) {
        if (state is PaymentsDetailsSuccess) {
          var tableData = state.paymentDetails
              .where((p) => p.currency == currency)
              .toList();
          if (tableData.isEmpty) {
            return const Center(
              child: Text('No Data Available'),
            );
          }
          return DetailsTableWithFulter(tableData: tableData);
        } else if (state is PaymentsDetailsFailure) {
          return Center(child: Text(state.errorMsg));
        }
        return const DetailsLoading();
      },
    );
  }
}



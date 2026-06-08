import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/cubits/dispatch_details_v2_per_sales_cubit/dispatch_details_v2_per_sales_cubit.dart';

class DispatchDetailsV2PerSalesBody extends StatelessWidget {
  const DispatchDetailsV2PerSalesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DispatchDetailsV2PerSalesCubit,
        DispatchDetailsV2PerSalesState>(
      builder: (context, state) {
        if (state is DispatchDetailsV2PerSalesSuccess) {
          print(state.dispatchDetails);
        } else if (state is DispatchDetailsV2PerSalesFailure) {
          print(state.error);
        }
        return SizedBox();
      },
    );
  }
}

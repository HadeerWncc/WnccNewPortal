import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/dispatch_details_per_sales_cubit/dispatch_details_per_sales_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_details_buttons_list.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_per_sales_table_body.dart';

class DispatchPerSalesBody extends StatelessWidget {
  const DispatchPerSalesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<DispatchDetailsPerSalesCubit,
          DispatchDetailsPerSalesState>(
        builder: (context, state) {
          if (state is DispatchDetailsPerSalesSuccess) {
            return Column(
              children: [
                const DispatchDetailsButtonsList(
                  activeTab: 1,
                ),
                const SizedBox(height: 8),
                DispatchPerSalesTableBody(
                  data: state.dispatchDetails,
                ),
              ],
            );
          } else if (state is DispatchDetailsPerSalesFailure) {
            return Text(state.error);
          } else {
            return Text('..Loading');
          }
        },
      ),
    );
  }
}

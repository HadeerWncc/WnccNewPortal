import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/dispatch_details_per_customer_cubit/dispatch_details_per_customer_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_details_buttons_list.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_per_customer_table_body.dart';

class DispatchPerCustomerBody extends StatelessWidget {
  const DispatchPerCustomerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<DispatchDetailsPerCustomerCubit,
          DispatchDetailsPerCustomerState>(
        builder: (context, state) {
          if (state is DispatchDetailsPerCustomerSuccess) {
            return Column(
              children: [
                const DispatchDetailsButtonsList(
                  activeTab: 1,
                ),
                const SizedBox(height: 8),
                DispatchPerCustomerTableBody(
                  data: state.dispatchDetails,
                ),
              ],
            );
          } else if (state is DispatchDetailsPerCustomerFailure) {
            return Text(state.error);
          } else {
            return Text('..Loading');
          }
        },
      ),
    );
  }
}

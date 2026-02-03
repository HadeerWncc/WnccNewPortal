import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/manager/cubits/fact_vs_cust_cubit/fact_vs_cust_cubit.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/build_customer_table.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/build_factory_table.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/loading/factory_loading.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';

class MonthlyBody extends StatelessWidget {
  const MonthlyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactVsCustCubit, FactVsCubitState>(
      builder: (context, state) {
        if (state is FactVsCustCubitFailure) {
          return const Center(
              child: Text('Failed to load data',
                  style: TextStyle(color: Colors.red)));
        } else if (state is FactVsCustCubitSuccess) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitle('Factory (FLS)'),
                const SizedBox(height: 8),
                buildFactoryTable(
                  factoryDispatchResponse: state.factVsCustList,
                  lableName: 'Month',
                ),
                const SizedBox(height: 30),
                sectionTitle('Customer (P&L)'),
                const SizedBox(height: 8),
                buildCustomerTable(
                  customerDispatchResponse: state.factVsCustList,
                  lableName: 'Month',
                ),
              ],
            ),
          );
        }
        return const FactoryLoading(lableName: 'Month');
      },
    );
  }
}

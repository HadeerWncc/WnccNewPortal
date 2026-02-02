import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/manager/cubits/fact_vs_cust_compare_cubit/fact_vs_cust_compare_cubit.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/compare_table.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/loading/comareing_loading.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/section_title.dart';

class CompareBody extends StatelessWidget {
  const CompareBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocBuilder<FactVsCustCompareCubit, FactVsCustCompareState>(
        builder: (context, state) {
          if (state is FactVsCustCompareSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitle('Compare Year (${state.factVsCustDispCompare.compareYear[0].year})'),
                const SizedBox(height: 8),
                CompareTable(
                    curerentYear: state.factVsCustDispCompare.compareYear),
                const SizedBox(height: 30),
                sectionTitle('Selected Year (${state.factVsCustDispCompare.selectedYear[0].year})'),
                const SizedBox(height: 8),
                CompareTable(
                    curerentYear: state.factVsCustDispCompare.selectedYear),
                const SizedBox(height: 30),
                sectionTitle('Differance'),
                const SizedBox(height: 8),
                CompareTable(
                    curerentYear: state.factVsCustDispCompare.difference),
              ],
            );
          } else if (state is FactVsCustCompareFailure) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          } else {
            return const ComareingLoading();
          }
        },
      ),
    );
  }
}

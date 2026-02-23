import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/cartesion_chart_data.dart';
import 'package:wncc_portal/core/widgets/cartesian_column_chart.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/manager/cubits/fact_vs_cust_compare_cubit/fact_vs_cust_compare_cubit.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/manager/helper/compare_chart_data.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/compare_table.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/loading/comareing_loading.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/monthly_compersion.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';

class CompareBody extends StatelessWidget {
  const CompareBody({super.key, required this.openCharts});
  final bool openCharts;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocBuilder<FactVsCustCompareCubit, FactVsCustCompareState>(
        builder: (context, state) {
          if (state is FactVsCustCompareSuccess) {
            List<CartesionChartData> compareChart =
                buildCompareColumnChartData(state.factVsCustDispCompare);
            return openCharts
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CartesianColumnChart(
                        cartesionChart: compareChart,
                        title:
                            'Annual Comparison ${compareChart[0].title} vs ${compareChart[1].title}',
                      ),
                      const SizedBox(height: 10),
                      MonthlyCompersion(
                        compareingEntity: state.factVsCustDispCompare,
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionTitle(
                          'Compare Year (${state.factVsCustDispCompare.compareYear[0].year})'),
                      const SizedBox(height: 8),
                      CompareTable(
                          curerentYear:
                              state.factVsCustDispCompare.compareYear),
                      const SizedBox(height: 30),
                      sectionTitle(
                          'Selected Year (${state.factVsCustDispCompare.selectedYear[0].year})'),
                      const SizedBox(height: 8),
                      CompareTable(
                          curerentYear:
                              state.factVsCustDispCompare.selectedYear),
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

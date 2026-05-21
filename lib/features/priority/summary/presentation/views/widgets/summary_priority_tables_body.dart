import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/priority/summary/presentation/managers/cubites/summary_priority_cubit/summary_priority_cubit.dart';
import 'package:wncc_portal/features/priority/summary/presentation/views/widgets/summary_priority_table.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/details_loading.dart';

class SummaryPriorityTablesBody extends StatelessWidget {
  const SummaryPriorityTablesBody({
    super.key,
    required this.activeTab,
  });

  final int activeTab;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SummaryPriorityCubit, SummaryPriorityState>(
        builder: (context, state) {
          if (state is SummaryPrioritySuccess) {
            final data = activeTab == 0
                ? state.bagsPrioritySummary
                : state.bulkPrioritySummary;
    
            if (data.isEmpty) {
              return const Center(child: Text("No Data"));
            }
    
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                sectionTitle('Quota'),
                const SizedBox(height: 5),
                SummaryPriorityTable(
                  data: data,
                  mappingType: 'Quota',
                ),
                const SizedBox(height: 20),
                sectionTitle('priority'),
                const SizedBox(height: 5),
                SummaryPriorityTable(
                  data: data,
                  mappingType: 'priority',
                ),
              ],
            );
          } else if (state is SummaryPriorityFailure) {
            return Center(child: Text(state.error));
          }
          return const DetailsLoading();
        },
      ),
    );
  }
}
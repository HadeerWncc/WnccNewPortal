import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/priority/summary/domain/entities/priority_summary_entity.dart';
import 'package:wncc_portal/features/priority/summary/presentation/managers/cubites/cubit/summary_priority_cubit.dart';
import 'package:wncc_portal/features/priority/summary/presentation/views/widgets/priority_summary_header.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/details_loading.dart';

class PrioritySymmaryBody extends StatefulWidget {
  const PrioritySymmaryBody({super.key});

  @override
  State<PrioritySymmaryBody> createState() => _PrioritySymmaryBodyState();
}

class _PrioritySymmaryBodyState extends State<PrioritySymmaryBody> {
  int activeTab = 0;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SummaryPriorityCubit>(context)
        .getPickupSummary(DateTime.now(), DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryPriorityCubit, SummaryPriorityState>(
      builder: (context, state) {
        if (state is SummaryPrioritySuccess) {
          final data = activeTab == 0
              ? state.bagsPrioritySummary
              : state.bulkPrioritySummary;
          if (data.isEmpty) {
            return const Center(child: Text("No Data"));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrioritySummaryHeader(),
              const SizedBox(height: 7),
              CustomChckButtons(
                buttons: const ["Bags", "Bulk"],
                activeTab: activeTab,
                onTap: (value) {
                  if (value == "Bags") {
                    activeTab = 0;
                  } else {
                    activeTab = 1;
                  }
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              sectionTitle('Quota'),
              SummaryPriorityTable(
                data: data,
                mappingType: 'Quota',
              ),
              const SizedBox(height: 20),
              sectionTitle('priority'),
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
    );
  }
}

class SummaryPriorityTable extends StatelessWidget {
  const SummaryPriorityTable({
    super.key,
    required this.data,
    required this.mappingType,
  });
  final List<PrioritySummaryEntity> data;
  final String mappingType;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> dataMapping;
    if (mappingType == 'Quota') {
      dataMapping = data.first.quotaMaping();
    } else {
      dataMapping = data.first.priorityMaping();
    }
    return Expanded(
      child: DataTable2(
        minWidth: dataMapping.length * 150,
        isVerticalScrollBarVisible: false,
        horizontalMargin: 0,
        columnSpacing: 0,
        fixedTopRows: 1,
        fixedLeftColumns: 1,
        // fixedColumnsColor: tableHeaderColor,
        
        headingRowHeight: 45,
        headingRowColor: WidgetStateProperty.all(tableHeaderColor),
        border: TableBorder.all(
          color: Colors.grey.shade300,
        ),
        columns: dataMapping.keys
            .map(
              (e) => DataColumn2(
                // fixedWidth: 120,
                label: Center(
                  child: Text(
                    e,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        rows: data.map(
          (summary) {
            final summaryMap = mappingType == 'Quota'
                ? summary.quotaMaping()
                : summary.priorityMaping();

            return DataRow(
              cells: summaryMap.values.map(
                (value) {
                  return DataCell(
                    Center(
                      child: Text(value.toString()),
                    ),
                  );
                },
              ).toList(),
            );
          },
        ).toList(),
      ),
    );
  }
}

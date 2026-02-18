import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/column_chart.dart';
import 'package:wncc_portal/core/widgets/insight_card.dart';
import 'package:wncc_portal/features/reports/pending/data/models/pending_model/pending_model.dart';
import 'package:wncc_portal/features/reports/pending/presentation/manager/build_pending_chart_data.dart';
import 'package:wncc_portal/features/reports/pending/presentation/views/widgets/pending_table_with_filtter.dart';

class PendingTable extends StatelessWidget {
  const PendingTable(
      {super.key,
      required this.showCharts,
      required this.pendingData,
      required this.searchString});
  final bool showCharts;
  final List<PendingModel> pendingData;
  final String searchString;

  @override
  Widget build(BuildContext context) {
    final regionChart = buildRegionColumnChartData(pendingData);
    final matrialChart = buildMatrialColumnChartData(pendingData);
    final tops = getPendingTop(pendingData);
    var tableData = pendingData.toList();
    if (tableData.isEmpty) {
      return const Center(
        child: Text('No Data Available'),
      );
    }
    return (showCharts)
        ? (tableData.isEmpty)
            ? const Center(
                child: Text('No Data Available'),
              )
            : Column(
                children: [
                  ColumnChart(
                    barChart: regionChart,
                    title: 'Comparison (Regions)',
                  ),
                  const SizedBox(height: 10),
                  ColumnChart(
                    barChart: matrialChart,
                    title: 'Comparison (Materials)',
                  ),
                  const SizedBox(height: 10),
                  InsightCardsSection(
                    topTwo: tops,
                    title1: 'Top Sales',
                    title2: 'Top Customer',
                    subtitle: 'Leading by total quantity',
                    label1: 'Quantity (ton)',
                    label2: 'Orders',
                  ),
                ],
              )
        : PendingTableWithFulter(
            tableData: tableData,
            searchText: searchString,
          );
  }
}

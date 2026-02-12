import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/column_chart.dart';
import 'package:wncc_portal/core/widgets/insight_card.dart';
import 'package:wncc_portal/core/widgets/stacked_line_chart.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment_details_model.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/build_details_chart_date.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/build_table_data.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/currency_dart_chart.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/details_table_with_filter.dart';

class DetailsPaymentTable extends StatelessWidget {
  const DetailsPaymentTable(
      {super.key,
      required this.currency,
      required this.showCharts,
      required this.paymentDetails});
  final String currency;
  final bool showCharts;
  final List<PaymentDetailsModel> paymentDetails;

  @override
  Widget build(BuildContext context) {
    final charts = buildColumnChartData(paymentDetails, currency);
    final stackedData = buildDetailsStackedData(paymentDetails, currency);
    final tops = getDetailsTop(paymentDetails, currency);
    final totals = getDetailsCurrencyTotals(paymentDetails);
    final chartData =
        totals.entries.map((e) => CurrencyChartData(e.key, e.value)).toList();
    var tableData =
        paymentDetails.where((p) => p.currency == currency).toList();
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
                // شلنا الـ SingleChildScrollView من هنا
                children: [
                  ColumnChart(
                    barChart: charts,
                    title: 'Comparison (Banks)',
                  ),
                  const SizedBox(height: 10),
                  StackedLineChart(
                    stackedData: stackedData,
                    title: 'Period Trend (Selected Period)',
                  ),
                  const SizedBox(height: 10),
                  InsightCardsSection(
                    topTwo: tops,
                    title1: 'Top Sales',
                    title2: 'Top Customer',
                  ),
                  const SizedBox(height: 10),
                  CurrencyDonutCard(chartData: chartData)
                ],
              )
        : DetailsTableWithFulter(tableData: tableData);
  }
}

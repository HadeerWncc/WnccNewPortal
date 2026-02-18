import 'package:intl/intl.dart';
import 'package:wncc_portal/core/models/cartesion_chart_data.dart';
import 'package:wncc_portal/core/models/chart_data.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/domain/entities/compareing_entity.dart';

List<CartesionChartData> buildCompareColumnChartData(CompareingEntity compare) {
  // final Map<String, double> regionTotals = {};
  List<CartesionChartData> chartsData = [];
  CartesionChartData selectedData = CartesionChartData(
      title: compare.selectedYear[0].year.toString(),
      data: compare.selectedYear
          .map((c) => CustomChartData(
              DateFormat("MMM").format(DateTime(c.year, c.month)),
              (c.bags + c.bulk).toDouble()))
          .toList());
  chartsData.add(selectedData);
  CartesionChartData compareData = CartesionChartData(
      title: compare.compareYear[0].year.toString(),
      data: compare.compareYear
          .map((c) => CustomChartData(
              DateFormat("MMM").format(DateTime(c.year, c.month)),
              (c.bags + c.bulk).toDouble()))
          .toList());
  chartsData.add(compareData);

  CartesionChartData differenceData = CartesionChartData(
      title: compare.difference[0].year.toString(),
      data: compare.difference
          .map((c) => CustomChartData(
              DateFormat("MMM").format(DateTime(c.year, c.month)),
              (c.bags + c.bulk).toDouble()))
          .toList());
  chartsData.add(differenceData);
  return chartsData;
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/month_dispatch.dart';

class DispatchChart extends StatefulWidget {
  const DispatchChart({super.key, required this.data, required this.incoterm});
  final List<MonthDispatch> data;
  final List<String> incoterm;
  @override
  State<DispatchChart> createState() => _DispatchChartState();
}

class _DispatchChartState extends State<DispatchChart> {
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    tooltipBehavior = TooltipBehavior(
      enable: true,
      canShowMarker: false,
      header: '',
      format: 'point.x\npoint.y',
    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    List<MonthDispatch> data = widget.data;
    if (widget.data.length >= 5) {
      data = widget.data.sublist(widget.data.length - 5, widget.data.length);
    }

    final num maxValue =  data.isNotEmpty?
        data.map((e) => e.total).reduce((a, b) => a > b ? a : b): 0;

    return SizedBox(
      height: 150,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        tooltipBehavior: tooltipBehavior,
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(size: 0),
          axisLine: AxisLine(width: 0),
        ),
        primaryYAxis: NumericAxis(
          isVisible: false,
          maximum: maxValue * 1.15,
        ),
        series: <CartesianSeries>[
          ColumnSeries<MonthDispatch, String>(
            dataSource: data,
            xValueMapper: (e, _) => e.month,
            yValueMapper: (e, _) =>(widget.incoterm.isEmpty||widget.incoterm.length == 2)? e.total: widget.incoterm[0] == 'Pickup'?e.pickup:e.delivery,

            isTrackVisible: true,
            trackColor: Colors.grey.shade200,
            trackBorderWidth: 0,

            borderRadius: BorderRadius.circular(30),
            // trackBorderRadius: BorderRadius.circular(30),

            width: 0.35,
          )
        ],
      ),
    );
  }
}

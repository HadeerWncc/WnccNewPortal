import 'package:flutter/material.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/daily_quota_model.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/chart_data_entity.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/card_charts.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/card_data.dart';

class SelesQuotaSuccess extends StatefulWidget {
  const SelesQuotaSuccess(
      {super.key,
      required this.dailyQuotaModel,
      required this.controllers,
      required this.totalQuotaController,
      required this.totalBulkController,
      required this.totalBagsController,
      required this.tryToDistribute,
      required this.chartBagsData,
      required this.chartBagsDataPriority,
      required this.chartBulkData,
      required this.chartBulkDataPriority});
  final DailyQuotaModel dailyQuotaModel;
  final List<Map<String, TextEditingController>> controllers;
  final TextEditingController totalQuotaController;
  final TextEditingController totalBulkController;
  final TextEditingController totalBagsController;
  final void Function(BuildContext) tryToDistribute;
  final ChartDataEntity chartBagsData;
  final ChartDataEntity chartBagsDataPriority;
  final ChartDataEntity chartBulkData;
  final ChartDataEntity chartBulkDataPriority;
  @override
  State<SelesQuotaSuccess> createState() => _SelesQuotaSuccessState();
}

class _SelesQuotaSuccessState extends State<SelesQuotaSuccess> {
  String selectedQuota = 'Bags';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardData(
          onSelectedItem: (value) {
            selectedQuota = value;
            setState(() {});
          },
          salesQuotaList: widget.dailyQuotaModel.salesQuotas!,
          controllers: widget.controllers,
          totalsControllers: {
            "totalQuota": widget.totalQuotaController,
            "totalBulk": widget.totalBulkController,
            "totalBags": widget.totalBagsController,
          },
          tryToDistribute: (context) {
            widget.tryToDistribute(context);
          },
        ),
        (selectedQuota == "Bags")
            ? CardCharts(
                quota: ChartDataEntity(
                  pickup: widget.chartBagsData.pickup,
                  delivery: widget.chartBagsData.delivery,
                  remaining: widget.chartBagsData.remaining,
                ),
                priority: ChartDataEntity(
                  pickup: widget.chartBagsDataPriority.pickup,
                  delivery: widget.chartBagsDataPriority.delivery,
                  remaining: widget.chartBagsDataPriority.remaining,
                ),
                dispatch:
                    ChartDataEntity(pickup: 20, delivery: 40, remaining: 40),
              )
            : CardCharts(
                quota: ChartDataEntity(
                  pickup: widget.chartBulkData.pickup,
                  delivery: widget.chartBulkData.delivery,
                  remaining: widget.chartBulkData.remaining,
                ),
                priority: ChartDataEntity(
                  pickup: widget.chartBulkDataPriority.pickup,
                  delivery: widget.chartBulkDataPriority.delivery,
                  remaining: widget.chartBulkDataPriority.remaining,
                ),
                dispatch:
                    ChartDataEntity(pickup: 20, delivery: 40, remaining: 40),
              ),
      ],
    );
  }
}

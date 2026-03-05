 import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_data_row.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_total_row.dart';

Widget buildMonthData(
      DispatchDetailsModel month, int index, List<DispatchRegion> regions, BoxBorder totalBorder,  Map<int, bool> expandedMonths) {
    final isExpanded = expandedMonths[index] ?? false;

    num totalDelta = 0;
    num totalGCairo = 0;
    num totalUEgypt = 0;
    num totalBags = 0;
    num totalBulk = 0;
    num totalAll = 0;
    num totalExport = 0;

    for (var day in month.monthDays ?? []) {
      totalDelta += day.totalDelta?.total ?? 0;
      totalGCairo += day.totalGCairo?.total ?? 0;
      totalUEgypt += day.totalUEgypt?.total ?? 0;
      totalBags += day.totalBags?.total ?? 0;
      totalBulk += day.totalBulk?.total ?? 0;
      totalAll += day.total?.total ?? 0;
      totalExport += day.totalExport?.total ?? 0;
    }

    return Column(
      children: [
        buildTotalRow(
          regions: regions,
          monthDays: month.monthDays ?? [],
          totalDelta: totalDelta,
          totalGCairo: totalGCairo,
          totalUEgypt: totalUEgypt,
          totalBags: totalBags,
          totalBulk: totalBulk,
          totalAll: totalAll,
          totalExport: totalExport,
          totalBorder: totalBorder
        ),
        if (isExpanded)
          ...(month.monthDays?.map((day) => buildDataRow(day, regions)) ?? []),
      ],
    );
  }

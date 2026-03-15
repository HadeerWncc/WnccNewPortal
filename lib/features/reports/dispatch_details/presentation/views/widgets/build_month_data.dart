 import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_data_row.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_total_row.dart';

Widget buildMonthData(
      DispatchDetailsModel month, int index, List<DispatchRegion> regions, BoxBorder totalBorder,  Map<int, bool> expandedMonths, QuantityType quantityType){
    final isExpanded = expandedMonths[index] ?? false;

    num totalDelta = 0;
    num totalGCairo = 0;
    num totalUEgypt = 0;
    num totalBags = 0;
    num totalBulk = 0;
    num totalAll = 0;
    num totalExport = 0;

    for (MonthDay day in month.monthDays ?? []) {
      
      
      totalDelta += getQuantityValue(day.totalDelta,quantityType);
      totalGCairo +=  getQuantityValue(day.totalGCairo, quantityType);
      totalUEgypt += getQuantityValue(day.totalUEgypt,quantityType);
      totalBags += getQuantityValue(day.totalBags,quantityType);
      totalBulk += getQuantityValue(day.totalBulk,quantityType);
      totalAll += getQuantityValue(day.total,quantityType);
      totalExport += getQuantityValue(day.totalExport,quantityType);
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
          totalBorder: totalBorder,
          quantityType: quantityType,
        ),
        if (isExpanded)
          ...(month.monthDays?.map((day) => buildDataRow(day, regions,quantityType: quantityType)) ?? []),
      ],
    );
  }


  

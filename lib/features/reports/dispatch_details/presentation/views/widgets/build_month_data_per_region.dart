import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_data_row_per_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_total_row_per_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/dispatch_details_quantity.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/helper/get_dis_value.dart';

Widget buildMonthDataPerRegion(
  DispatchDetailsPerRegionModel month,
  int index,
  List<String> regions,
  BoxBorder totalBorder,
  Map<int, bool> expandedMonths,
  List<String> quantityType,
  List<String> quantityMatrial,
) {
  final isExpanded = expandedMonths[index] ?? false;

  num totalDelta = 0;
  num totalGCairo = 0;
  num totalUEgypt = 0;
  num totalCoastal = 0;
  num totalAll = 0;
  num totalExport = 0;
  Value defaultQuantity = const Value(
    deliveryQuantity: DispatchDetailsQuantity(
      bags: 0,
      bulk: 0,
      total: 0,
    ),
    pickupQuantity: DispatchDetailsQuantity(
      bags: 0,
      bulk: 0,
      total: 0,
    ),
    total: 0,
  );

  for (MonthDay day in month.monthDays ?? []) {
    totalDelta += getDisSortValue(
      day.dataValues!.where((d) => d.name == 'Delta').toList().isNotEmpty
          ? day.dataValues!
              .where((d) => d.name == 'Delta')
              .toList()[0]
              .quantity!
          : defaultQuantity,
      quantityType,
      quantityMatrial,
    );
    totalGCairo += getDisSortValue(
      day.dataValues!
              .where((d) => d.name == 'Greater Cairo')
              .toList()
              .isNotEmpty
          ? day.dataValues!
              .where((d) => d.name == 'Greater Cairo')
              .toList()[0]
              .quantity!
          : defaultQuantity,
      quantityType,
      quantityMatrial,
    );
    totalUEgypt += getDisSortValue(
      day.dataValues!.where((d) => d.name == 'Upper Egypt').toList().isNotEmpty
          ? day.dataValues!
              .where((d) => d.name == 'Upper Egypt')
              .toList()[0]
              .quantity!
          : defaultQuantity,
      quantityType,
      quantityMatrial,
    );
    totalCoastal += getDisSortValue(
      day.dataValues!.where((d) => d.name == 'Coastal').toList().isNotEmpty
          ? day.dataValues!
              .where((d) => d.name == 'Coastal')
              .toList()[0]
              .quantity!
          : defaultQuantity,
      quantityType,
      quantityMatrial,
    );
    totalAll += getDisSortValue(
      day.total!,
      quantityType,
      quantityMatrial,
    );
    totalExport += day.totalExport ?? 0;
  }

  return Column(
    children: [
      buildTotalRowPerRegion(
          // regions: regions,
          selectedCities: regions,
          monthDays: month.monthDays ?? [],
          totalDelta: totalDelta,
          totalGCairo: totalGCairo,
          totalUEgypt: totalUEgypt,
          totalCostal: totalCoastal,
          totalAll: totalAll,
          totalExport: totalExport,
          totalBorder: totalBorder,
          quantityType: quantityType,
          quantityMatrial: quantityMatrial),
      if (isExpanded)
        ...(month.monthDays?.map((day) => buildDataRowPerRegion(day,
                quantityType: quantityType,
                quantityMatrial: quantityMatrial,
                selectedCities: regions)) ??
            []),
    ],
  );
}

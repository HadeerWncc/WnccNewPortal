

import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_quantity.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/column_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/dispatch_row.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';

Map<String, List<DispatchRegion>> groupRegionsByArea(
  List<DispatchDetailsModel> months,
) {
  final Map<String, List<DispatchRegion>> result = {};

  if (months.isEmpty) return result;

  final firstDay =
      months.last.monthDays?.last;

  final regions = firstDay?.regions ?? [];

  for (final region in regions) {
    if (region.enableDispatchReporting != true) continue;

    final area = region.areaName ?? 'Unknown';

    result.putIfAbsent(area, () => []);
    result[area]!.add(region);
  }

  return result;
}


List<DispatchColumn> buildColumns(
  Map<String, List<DispatchRegion>> grouped,
) {
  final List<DispatchColumn> columns = [];

  for (final entry in grouped.entries) {
    final area = entry.key;
    final regions = entry.value;

    // ① region columns
    for (final r in regions) {
      columns.add(
        DispatchColumn(
          id: r.regionId ?? r.regionName ?? '',
          title: r.regionName ?? '',
          area: area,
          type: ColumnType.region,
          region: r,
        ),
      );
    }

    // ② area total column
    columns.add(
      DispatchColumn(
        id: '${area}_total',
        title: '$area Total',
        area: area,
        type: ColumnType.areaTotal,
      ),
    );
  }

  return columns;
}


num getQuantityValue(DispatchQuantity? q, QuantityType type) {
  if (q == null) return 0;

  switch (type) {
    case QuantityType.delivery:
      return q.deliveryQuantity ?? 0;
    case QuantityType.pickup:
      return q.pickupQuantity ?? 0;
    case QuantityType.total:
      return q.total ?? 0;
  }
}

List<DispatchRow> buildRowsFromMonths({
  required List<DispatchDetailsModel> months,
  required List<DispatchColumn> columns,
  required QuantityType quantityType,
}) {
  final rows = <DispatchRow>[];

  final now = DateTime.now();

  for (final month in months) {
    final isCurrentMonth =
        month.month == now.month && now.year == now.year;

    final days = month.monthDays ?? [];

    final iterableDays =
        isCurrentMonth ? days : [days.last]; // 👈 القديم = total بس

    for (final day in iterableDays) {
      final values = <String, num>{};

      for (final column in columns) {
        num value = 0;

        if (column.type == ColumnType.region) {
          final region = day.regions?.firstWhere(
            (r) => r.regionId == column.region?.regionId,
            orElse: () => column.region!,
          );

          value = getQuantityValue(region?.quantity, quantityType);
        } else {
          switch (column.area) {
            case 'Greater Cairo':
              value = getQuantityValue(day.totalGCairo, quantityType);
              break;
            case 'Delta':
              value = getQuantityValue(day.totalDelta, quantityType);
              break;
            case 'UEgypt':
              value = getQuantityValue(day.totalUEgypt, quantityType);
              break;
            case 'Coastal':
              value = getQuantityValue(day.totalCoastal, quantityType);
              break;
          }
        }

        values[column.id] = value;
      }

      rows.add(
        DispatchRow(
          label: isCurrentMonth
              ? (day.date ?? '')
              : '${month.monthLabel} Total',
          values: values,
        ),
      );
    }
  }

  return rows;
}


List<DataColumn> buildDataColumns(List<DispatchColumn> columns) {
  return [
    const DataColumn(label: Text('Date')), // أول عمود للتاريخ

    ...columns.map(
      (c) => DataColumn(
        label: Text(
          c.title,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ];
}


List<DataRow> buildDataRows(
  List<DispatchRow> rows,
  List<DispatchColumn> columns,
) {
  return rows.map((row) {
    return DataRow(
      cells: [
        /// التاريخ
        DataCell(Text(row.label)),

        /// باقي الأعمدة
        ...columns.map(
          (c) => DataCell(
            Text(
              row.values[c.id]?.toStringAsFixed(0) ?? '0',
            ),
          ),
        ),
      ],
    );
  }).toList();
}


Widget buildDispatchTable({
  required List<DispatchColumn> columns,
  required List<DispatchRow> rows,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: DataTable(
      columnSpacing: 24,
      dataRowMinHeight: 40,
      columns: buildDataColumns(columns),
      rows: buildDataRows(rows, columns),
    ),
  );
}











// Widget buildDispatchDetailsTable({
//   required List<DispatchDetailsModel> dispatchDetailsResponse,
//   required String lableName,
//   required int year,
// }) {
//   if (dispatchDetailsResponse.isEmpty) return const SizedBox();

//   final now = DateTime.now();
//   final int currentMonth = now.month;
//   final int currentYear = now.year;

//   // 1. تجهيز البيانات (Columns & Rows)
//   // نأخذ أسماء المناطق من أول شهر متاح فيه بيانات مناطق
//   List<String> regionNames = [];
//   var firstValidMonth = dispatchDetailsResponse
//       .firstWhere((m) => m.monthDays?.isNotEmpty ?? false);
//   regionNames = firstValidMonth.monthDays!.first.regions
//           ?.map((r) => r.regionName ?? "")
//           .toList() ??
//       [];

//   List<String> columns = [
//     ...regionNames,
//     'Bags',
//     'Delta',
//     'Bulk',
//     'Total',
//     'Export'
//   ];

//   // مؤشرات الأعمدة للتقسيم حسب الـ Style بتاعك
//   int bagsIndex = regionNames.length;
//   int totalIndex = columns.indexOf('Total');

//   // 2. بناء الـ Rows بناءً على الشرط (الشهر الحالي vs الشهور السابقة)
//   List<String> labels = [];
//   List<List<dynamic>> dataRows = [];

//   // متغيرات لإجمالي السنة YTD
//   double ytdBags = 0, ytdDelta = 0, ytdBulk = 0, ytdTotal = 0, ytdExport = 0;
//   List<double> ytdRegions = List.filled(regionNames.length, 0.0);

//   for (var monthData in dispatchDetailsResponse) {
//     bool isCurrentMonth =
//         (year == currentYear && monthData.month == currentMonth);

//     // حساب إجماليات هذا الشهر
//     double mBags = 0, mDelta = 0, mBulk = 0, mTotal = 0, mExport = 0;
//     List<double> mRegions = List.filled(regionNames.length, 0.0);

//     for (var day in monthData.monthDays ?? []) {
//       mBags += (day.totalBags ?? 0).toDouble();
//       mDelta += (day.totalDelta ?? 0).toDouble();
//       mBulk += (day.totalBulk ?? 0).toDouble();
//       mTotal += (day.total ?? 0).toDouble();
//       mExport += (day.totalExport ?? 0).toDouble();
//       // داخل الـ loop بتاع الأيام (day loop)
//       for (int i = 0; i < regionNames.length; i++) {
//         String currentRegionName = regionNames[i];

//         // بندور على المنطقة اللي ليها نفس الاسم في اليوم ده
//         var regionData = day.regions?.firstWhere(
//           (r) => r.regionName == currentRegionName,
//           orElse: () =>
//               const Region(quantity: 0), // لو ملهاش داتا في اليوم ده حط 0
//         );

//         double qty = (regionData?.quantity ?? 0).toDouble();

//         mRegions[i] += qty; // إجمالي الشهر للمنطقة دي
//         ytdRegions[i] += qty; // إجمالي السنة للمنطقة دي
//       }

//       // إذا كان الشهر الحالي، نضيف الأيام كصفوف منفصلة
//       if (isCurrentMonth) {
//         labels.add(day.date ?? "");
//         dataRows.add([
//           // 1. جلب قيم المناطق بناءً على قائمة الأسماء الفريدة
//           ...regionNames.map((name) {
//             // نبحث عن المنطقة التي تحمل هذا الاسم في قائمة مناطق اليوم الحالي
//             final region = day.regions?.firstWhere(
//               (r) => r.regionName == name,
//               orElse: () => const Region(quantity: 0), // إذا لم توجد، نضع صفر
//             );
//             return region?.quantity ?? 0;
//           }).toList(),

//           // 2. باقي البيانات الإجمالية لليوم
//           day.totalBags ?? 0,
//           day.totalDelta ?? 0,
//           day.totalBulk ?? 0,
//           day.total ?? 0,
//           day.totalExport ?? 0,
//         ]);
//       }
//     }

//     // إضافة إجمالي الشهر (دائماً يضاف للشهور السابقة، وبعد أيام الشهر الحالي)
//     labels.add("Total ${monthData.monthLabel ?? monthData.month}");
//     dataRows.add([...mRegions, mBags, mDelta, mBulk, mTotal, mExport]);

//     // تجميع الـ YTD
//     ytdBags += mBags;
//     ytdDelta += mDelta;
//     ytdBulk += mBulk;
//     ytdTotal += mTotal;
//     ytdExport += mExport;
//     for (int i = 0; i < regionNames.length; i++) ytdRegions[i] += mRegions[i];
//   }

//   // إضافة سطر الـ YTD النهائي
//   labels.add("Total Dispatch (YTD)");
//   dataRows
//       .add([...ytdRegions, ytdBags, ytdDelta, ytdBulk, ytdTotal, ytdExport]);

//   return IntrinsicHeight(
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // عمود التاريخ / التسمية
//         totalColumn(
//           values: labels,
//           lableName: lableName == 'c' ? 'Date' : lableName,
//         ),
//         Flexible(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 // الجدول الأول: المناطق
//                 DataTable(
//                   headingRowHeight: 45,
//                   dataRowMinHeight: 38,
//                   dataRowMaxHeight: 42,
//                   headingRowColor: WidgetStateProperty.all(tableHeaderColor),
//                   border: TableBorder.all(color: Colors.grey.shade300),
//                   columns: regionNames
//                       .map((name) => DataColumn(
//                           label: Center(
//                               child: Text(name.capitalize(),
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold)))))
//                       .toList(),
//                   rows: dataRows.asMap().entries.map((entry) {
//                     int idx = entry.key;
//                     var row = entry.value;
//                     bool isTotalRow = labels[idx].contains("Total");
//                     return DataRow(
//                       color: WidgetStateProperty.resolveWith((states) =>
//                           isTotalRow
//                               ? tableHeaderColor.withOpacity(0.2)
//                               : null),
//                       cells: row
//                           .sublist(0, bagsIndex)
//                           .map((cell) => DataCell(Center(
//                               child: Text(
//                                   NumberFormat.decimalPattern().format(cell),
//                                   style: TextStyle(
//                                       fontWeight: isTotalRow
//                                           ? FontWeight.bold
//                                           : FontWeight.normal)))))
//                           .toList(),
//                     );
//                   }).toList(),
//                 ),

//                 // عمود الـ Bags (باستخدام totalColumn كما في تصميمك)
//                 totalColumn(
//                   values: dataRows
//                       .map((r) =>
//                           NumberFormat.decimalPattern().format(r[bagsIndex]))
//                       .toList(),
//                   lableName: 'Bags',
//                 ),

//                 // الجدول الثاني: باقي الإجماليات (Delta, Bulk, Total, Export)
//                 DataTable(
//                   headingRowHeight: 45,
//                   dataRowMinHeight: 38,
//                   dataRowMaxHeight: 42,
//                   headingRowColor: WidgetStateProperty.all(tableHeaderColor),
//                   border: TableBorder.all(color: Colors.grey.shade300),
//                   columns: columns
//                       .sublist(bagsIndex + 1)
//                       .map((c) => DataColumn(
//                           label: Center(
//                               child: Text(c.capitalize(),
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold)))))
//                       .toList(),
//                   rows: dataRows.asMap().entries.map((entry) {
//                     int idx = entry.key;
//                     var row = entry.value;
//                     bool isTotalRow = labels[idx].contains("Total");
//                     return DataRow(
//                       color: WidgetStateProperty.resolveWith((states) =>
//                           isTotalRow
//                               ? tableHeaderColor.withOpacity(0.2)
//                               : null),
//                       cells: row
//                           .sublist(bagsIndex + 1)
//                           .map((cell) => DataCell(Center(
//                               child: Text(
//                                   NumberFormat.decimalPattern().format(cell),
//                                   style: TextStyle(
//                                       fontWeight: isTotalRow
//                                           ? FontWeight.bold
//                                           : FontWeight.normal)))))
//                           .toList(),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

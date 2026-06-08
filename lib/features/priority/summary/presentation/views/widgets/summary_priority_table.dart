import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/priority/summary/domain/entities/priority_summary_entity.dart';

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
    // التحقق من أن القائمة ليست فارغة لتجنب كراش .first
    if (data.isEmpty) return const SizedBox.shrink();

    Map<String, dynamic> dataMapping = mappingType == 'Quota'
        ? data.first.quotaMaping()
        : mappingType == 'priority'
            ? data.first.priorityMaping()
            : data.first.dispatchMaping();

    // استخدمنا SizedBox مع ارتفاع محدد لأن جداول DataTable2 تحتاج تحديد ارتفاع مناسب في الـ ListView
    return SizedBox(
      height: (data.length * 45) +
          60, // حساب ديناميكي للارتفاع بناءً على عدد الصفوف
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: dataMapping.length *
            100, // يعطي مرونة للسكرول الأفقي لو الأعمدة كتيرة
        headingRowHeight: 45,
        fixedLeftColumns: 1,

        headingRowColor: WidgetStateProperty.all(tableHeaderColor),
        border: TableBorder.all(color: Colors.grey.shade300),
        columns: dataMapping.keys.map((e) {
          if (e == 'SalesName') {
            return DataColumn2(
              fixedWidth: 140,
              label: Text(
                e,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              size: ColumnSize.M,
            );
          }
          return DataColumn2(
            label: Text(
              e,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            size: ColumnSize.M,
          );
        }).toList(),
        rows: data.map(
          (summary) {
            final summaryMap = mappingType == 'Quota'
                ? summary.quotaMaping()
                : mappingType == 'priority'
                    ? summary.priorityMaping()
                    : summary.dispatchMaping();

            return DataRow(
              cells: summaryMap.entries.map((entry) {
                return DataCell(
                  Text(
                    entry.value.toString(),
                    style: TextStyle(
                      fontWeight: entry.key == 'SalesName'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ).toList(),
      ),
    );
  }
}

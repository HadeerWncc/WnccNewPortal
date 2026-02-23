import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/get_month_until.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/domain/entities/compareing_entity.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/compersion_over_all_growth.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/monthly_comparsion_item.dart';

class MonthlyCompersion extends StatefulWidget {
  const MonthlyCompersion({super.key, required this.compareingEntity});
  final CompareingEntity compareingEntity;

  @override
  State<MonthlyCompersion> createState() => _MonthlyCompersionState();
}

class _MonthlyCompersionState extends State<MonthlyCompersion> {
  int compareMonth = 1;
  int selectedMonth = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color.fromARGB(255, 132, 141, 122))),
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Monthly Comparison',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${DateFormat("MMMM").format(DateTime(2026, selectedMonth))}  ${widget.compareingEntity.selectedYear[0].year} vs ${DateFormat("MMMM").format(DateTime(2026, compareMonth))}  ${widget.compareingEntity.compareYear[0].year}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          MonthlyCompersionItem(
            comaparingItem: widget.compareingEntity.selectedYear,
            months: getMonthsUntil(widget.compareingEntity.selectedYear.length),
            year: widget.compareingEntity.selectedYear[0].year,
            borderColor: kBtnColor,
            onMonthChange: (value) {
              selectedMonth = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          MonthlyCompersionItem(
            comaparingItem: widget.compareingEntity.compareYear,
            months: getMonthsUntil(widget.compareingEntity.compareYear.length),
            year: widget.compareingEntity.compareYear[0].year,
            borderColor: const Color.fromARGB(255, 43, 86, 139),
            onMonthChange: (value) {
              compareMonth = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          CompersionOverAllGrowth(
            borderColor: const Color.fromARGB(255, 166, 31, 31),
            selectedMonth: widget.compareingEntity.selectedYear
                .where((s) => s.month == selectedMonth)
                .toList()[0],
            compareMonth: widget.compareingEntity.compareYear
                .where((s) => s.month == compareMonth)
                .toList()[0],
          )
        ],
      ),
    );
  }
}

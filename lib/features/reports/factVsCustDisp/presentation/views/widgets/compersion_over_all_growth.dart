import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/widgets/marked_text.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/domain/entities/comparing_entity_item.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/over_all_growth_item.dart';

class CompersionOverAllGrowth extends StatelessWidget {
  const CompersionOverAllGrowth(
      {super.key,
      required this.borderColor,
      required this.selectedMonth,
      required this.compareMonth});
  final Color borderColor;
  final ComparingEntityItem selectedMonth;
  final ComparingEntityItem compareMonth;
  @override
  Widget build(BuildContext context) {
    num bagsGrowth = selectedMonth.bags - compareMonth.bags;
    num bulkGrowth = selectedMonth.bulk - compareMonth.bulk;
    num exportGrowth = selectedMonth.export - compareMonth.export;
    num clinkerGrowth = selectedMonth.clincker - compareMonth.clincker;
    num totalGrowth = bagsGrowth + bulkGrowth + exportGrowth + clinkerGrowth;
    num totalSelectedQuantity = selectedMonth.bags +
        selectedMonth.bulk +
        selectedMonth.export +
        selectedMonth.clincker;
    num totalCompareQuantity = compareMonth.bags +
        compareMonth.bulk +
        compareMonth.export +
        compareMonth.clincker;
    num growthPresentage =
        (totalSelectedQuantity - totalCompareQuantity).isNegative
            ? (totalGrowth / totalCompareQuantity * 100)
            : totalSelectedQuantity == 0
                ? 0
                : (totalGrowth / totalSelectedQuantity * 100);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              color: Color.fromARGB(255, 227, 244, 231),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MarkedText(
                  child:
                      'Overall Growth: ${totalGrowth.isNegative ? '$growthPresentage %' : '+ $growthPresentage %'}',
                  color: const Color(0xff17c653),
                  padding: const EdgeInsets.all(3),
                  fontSize: 11.5,
                ),
                MarkedText(
                  child:
                      'Overall Growth: ${NumberFormat.decimalPattern().format(totalGrowth)} tons',
                  color: const Color(0xff17c653),
                  padding: const EdgeInsets.all(3),
                  fontSize: 11.5,
                ),
              ],
            ),
          ),
          const SizedBox(height: 13),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OverAllGrowthItem(
                      title: 'Bags',
                      quantity:
                          '${NumberFormat.decimalPattern().format(bagsGrowth)} tons',
                      presentage: (bagsGrowth).isNegative
                          ? '${compareMonth.bags == 0 ? (0 * 100) : NumberFormat.decimalPattern().format((bagsGrowth / compareMonth.bags) * 100)} %'
                          : '+ ${selectedMonth.bags == 0 ? (0 * 100) : NumberFormat.decimalPattern().format((bagsGrowth / selectedMonth.bags) * 100)} %',
                      compareInfo:
                          '${NumberFormat.decimalPattern().format(compareMonth.bags)} → ${NumberFormat.decimalPattern().format(selectedMonth.bags)} tons',
                    ),
                    OverAllGrowthItem(
                      title: 'Bulk',
                      quantity:
                          '${NumberFormat.decimalPattern().format(bulkGrowth)} tons',
                      presentage: bulkGrowth.isNegative
                          ? '${compareMonth.bulk == 0 ? (0 * 100) : NumberFormat.decimalPattern().format((bulkGrowth / compareMonth.bulk) * 100)} %'
                          : '+ ${selectedMonth.bulk == 0 ? (0 * 100) : NumberFormat.decimalPattern().format((bulkGrowth / selectedMonth.bulk) * 100)} %',
                      compareInfo:
                          '${NumberFormat.decimalPattern().format(compareMonth.bulk)} → ${NumberFormat.decimalPattern().format(selectedMonth.bulk)} tons',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OverAllGrowthItem(
                      title: 'Export',
                      quantity:
                          '${NumberFormat.decimalPattern().format(exportGrowth)} tons',
                      presentage: exportGrowth.isNegative
                          ? '${compareMonth.export == 0 ? (0 * 100) : NumberFormat.decimalPattern().format((exportGrowth / compareMonth.export) * 100)} %'
                          : '+ ${selectedMonth.export == 0 ? (0 * 100) : NumberFormat.decimalPattern().format((exportGrowth / selectedMonth.export) * 100)} %',
                      compareInfo:
                          '${NumberFormat.decimalPattern().format(compareMonth.export)} → ${NumberFormat.decimalPattern().format(selectedMonth.export)} tons',
                    ),
                    OverAllGrowthItem(
                      title: 'Clinker',
                      quantity:
                          '${NumberFormat.decimalPattern().format(clinkerGrowth)} tons',
                      presentage: clinkerGrowth.isNegative
                          ? '${compareMonth.clincker == 0 ? (0 * 100) : NumberFormat.decimalPattern().format((clinkerGrowth / compareMonth.clincker) * 100)} %'
                          : '+ ${selectedMonth.clincker == 0 ? (0 * 100) : NumberFormat.decimalPattern().format((clinkerGrowth / selectedMonth.clincker) * 100)} %',
                      compareInfo:
                          '${NumberFormat.decimalPattern().format(compareMonth.clincker)} → ${NumberFormat.decimalPattern().format(selectedMonth.clincker)} tons',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class OverAllText extends StatelessWidget {
//   const OverAllText({
//     super.key,
//     required this.child,
//     required this.fontSize,
//   });
//   final String child;
//   final double fontSize;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       child,
//       style: TextStyle(
//         decorationThickness: 5,
//         backgroundColor: kBtnColor,
//         color: Colors.black,
//         fontSize: fontSize,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/features/factVsCustDisp/domain/entities/comparing_entity_item.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/compare_table.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/section_title.dart';

class ComareingLoading extends StatelessWidget {
  const ComareingLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle('Current Year'),
          const SizedBox(height: 8),
          CompareTable(curerentYear: [
            ComparingEntityItem(
                year: 2025, month: 1, bags: 1, bulk: 1, export: 1, clincker: 1),
            ComparingEntityItem(
                year: 2025, month: 1, bags: 1, bulk: 1, export: 1, clincker: 1),
            ComparingEntityItem(
                year: 2025, month: 1, bags: 1, bulk: 1, export: 1, clincker: 1),
          ]),
          const SizedBox(height: 30),
          sectionTitle('Selected Year'),
          const SizedBox(height: 8),
          CompareTable(curerentYear: [
            ComparingEntityItem(
              year: 2024,
                month: 1, bags: 1, bulk: 1, export: 1, clincker: 1),
            ComparingEntityItem(
                year: 2024, month: 1, bags: 1, bulk: 1, export: 1, clincker: 1),
            ComparingEntityItem(
                year: 2024, month: 1, bags: 1, bulk: 1, export: 1, clincker: 1),
          ]),
          const SizedBox(height: 30),
          sectionTitle('Differance'),
          const SizedBox(height: 8),
          CompareTable(curerentYear: [
            ComparingEntityItem(
              year: 0,
                month: 1, bags: 1, bulk: 1, export: 1, clincker: 1),
            ComparingEntityItem(
                year: 0, month: 1, bags: 1, bulk: 1, export: 1, clincker: 1),
            ComparingEntityItem(
                year: 0, month: 1, bags: 1, bulk: 1, export: 1, clincker: 1),
          ]),
        ],
      ),
    );
  }
}

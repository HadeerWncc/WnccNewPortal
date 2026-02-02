import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/loading/loading_fact_table.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/section_title.dart';

class FactoryLoading extends StatelessWidget {
  const FactoryLoading({super.key, required this.lableName});
  final String lableName;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle('Factory (FLS)'),
          const SizedBox(height: 8),
          LoadingFactTable(
            lableName: lableName,
          ),
          const SizedBox(height: 30),
          sectionTitle('Customer (P&L)'),
          const SizedBox(height: 8),
          LoadingFactTable(
            lableName: lableName,
          ),
        ],
      ),
    );
  }
}

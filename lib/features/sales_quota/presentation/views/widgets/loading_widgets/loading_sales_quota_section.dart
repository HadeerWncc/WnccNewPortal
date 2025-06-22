import 'package:flutter/material.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/loading_widgets/loading_selected_list.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/tables/loading_table.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/loading_widgets/loading_title.dart';

class LoadingSalesQuotaSection extends StatelessWidget {
  const LoadingSalesQuotaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sales Quota',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        LoadingSelectedList(),
        SizedBox(height: 30),
        Column(
          children: [
            LoadingTitle(),
            SizedBox(height: 25),
            LoadingTable(),
          ],
        )
      ],
    );
  }
}

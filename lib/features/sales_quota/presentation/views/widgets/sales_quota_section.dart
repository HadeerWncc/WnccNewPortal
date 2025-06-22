import 'package:flutter/material.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/sales_quota.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/custom_bags_table.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/custom_bulk_table.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/custom_sales_quota_title.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/custom_selected_list.dart';

class SalesQuotaSection extends StatefulWidget {
  const SalesQuotaSection({
    super.key,
    required this.salesQuotaList,
    required this.controllers,
    required this.getTotalBagsPickuAndDelivery,
    required this.onSelectedItem,
  });
  final List<SalesQuota> salesQuotaList;
  final List<Map<String, TextEditingController>> controllers;
  final void Function(num, num) getTotalBagsPickuAndDelivery;
  final void Function(String) onSelectedItem;
  @override
  State<SalesQuotaSection> createState() => _SalesQuotaSectionState();
}

class _SalesQuotaSectionState extends State<SalesQuotaSection> {
  String selectedQuota = 'Bags';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sales Quota',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        CustomSelectedList(
          selectedItem: (value) {
            selectedQuota = value;
            widget.onSelectedItem(value);
            setState(() {});
          },
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            CustomSalesQuotaTitle(
              title: selectedQuota,
            ),
            const SizedBox(height: 25),
            (selectedQuota == 'Bags')
                ? CustomBagsTable(
                    getTotalBagsPickuAndDelivery:
                        widget.getTotalBagsPickuAndDelivery,
                    salesQuotaList: widget.salesQuotaList
                        .where((sQ) => sQ.salesType != 2)
                        .toList(),
                    controllers: widget.controllers,
                  )
                : CustomBulkTable(
                    salesQuotaList: widget.salesQuotaList
                        .where((sQ) => sQ.salesType != 1)
                        .toList(),
                    controllers: widget.controllers,
                  ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/domain/entities/comparing_entity_item.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/shipment_breakdown_item.dart';

class ShipmentBreakDownSection extends StatelessWidget {
  const ShipmentBreakDownSection({
    super.key,
    required this.comaparingItem,
  });

  final ComparingEntityItem comaparingItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          NumberFormat.decimalPattern()
              .format(comaparingItem.bags + comaparingItem.bulk),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        const Text(
          'Shipment Breakdown',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShipmentBreakDownItem(
                  title:
                      NumberFormat.decimalPattern().format(comaparingItem.bags),
                  subTitle: 'Bags',
                ),
                ShipmentBreakDownItem(
                  title:
                      NumberFormat.decimalPattern().format(comaparingItem.bulk),
                  subTitle: 'Bulk',
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShipmentBreakDownItem(
                  title: NumberFormat.decimalPattern()
                      .format(comaparingItem.export),
                  subTitle: 'Export',
                ),
                ShipmentBreakDownItem(
                  title: NumberFormat.decimalPattern()
                      .format(comaparingItem.clincker),
                  subTitle: 'Clincker',
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

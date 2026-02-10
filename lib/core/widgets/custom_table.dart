import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/customer_cell.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
  children: [
    /// HEADER
    Row(
      children: [
        cell("Customer", header: true),
        cell("Bank", header: true),
        cell("Amount", header: true),
        cell("Amount", header: true),
        cell("Amount", header: true),
        cell("Amount", header: true),
        cell("Amount", header: true),
        cell("Amount", header: true),
      ],
    ),

    /// BODY
    Expanded(
      child: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) {
          // final p = payments[index];

          return Row(
            children: [
              cell('p.customer '),
              cell('p.houseBank '),
              cell('p.amount'),
              cell('p.amount'),
              cell('p.amount'),
              cell('p.amount'),
              cell('p.amount'),
              cell('p.amount'),
            ],
          );
        },
      ),
    ),
  ],
)
;
  }
}
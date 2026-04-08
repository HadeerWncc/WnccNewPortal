// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_per_sales_model/dispatch_per_sales_model.dart';
// import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
// import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_per_customer_model/dispatch_per_customer_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_per_sales_model/dispatch_per_sales_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_quantity.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';

Map<String, List<DispatchPerSalesModel>> groupBySales(
    List<DispatchPerSalesModel> list) {
  final Map<String, List<DispatchPerSalesModel>> grouped = {};

  for (var item in list) {
    final key = item.salesName ?? '';

    grouped.putIfAbsent(key, () => []);
    grouped[key]!.add(item);
  }
  return grouped;
}

Map<String, List<DispatchPerCustomerModel>> groupByCustomer(
    List<DispatchPerCustomerModel> list) {
  final Map<String, List<DispatchPerCustomerModel>> grouped = {};

  for (var item in list) {
    final key = item.customerId ?? '';

    grouped.putIfAbsent(key, () => []);
    grouped[key]!.add(item);
  }
  return grouped;
}

Widget buildDispatchPerSalesHeader() {
  return Container(
    color: const Color(0xFF2E6B1F),
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        headerItem("Sales", 2),
        headerItem("Branch", 2),
        headerItem("Bulk", 1),
        headerItem("Bags", 1),
        headerItem("Total", 1),
        headerItem("Mar", 1),
        headerItem("Today", 1),
      ],
    ),
  );
}

Widget buildDispatchPerCustomerHeader() {
  return Container(
    color: const Color(0xFF2E6B1F),
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        headerItem("Code", 2),
        headerItem("Customer", 5),
        headerItem("Region", 2),
        headerItem("Branch", 2),
        headerItem("Bulk", 1),
        headerItem("Bags", 1),
        headerItem("Total", 1),
        headerItem("Mar", 1),
        headerItem("Today", 1),
        headerItem("Sales", 3),
      ],
    ),
  );
}

Widget headerItem(String text, int flex) {
  return Expanded(
    flex: flex,
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

List<Widget> buildDispatchPerCustomerGroups(
    List<DispatchPerCustomerModel> data, QuantityType quantityType) {
  final grouped = groupByCustomer(data);
  final sortedEntries = grouped.entries.toList()
    ..sort((a, b) => b.key.compareTo(a.key));
  return sortedEntries.map((entry) {
    final code = entry.key;
    final custName = entry.value[0].customerName;
    final items = entry.value;

    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.grey.shade100,
                  alignment: Alignment.center,
                  child: Text(
                    int.parse(code).toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.grey.shade100,
                  alignment: Alignment.center,
                  child: Text(
                    custName ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              /// باقي الجدول
              Expanded(
                flex: 12,
                child: Column(
                  children: List.generate(items.length, (index) {
                    final item = items[index];

                    return Container(
                      decoration: BoxDecoration(
                        // color: index % 2 == 0
                        //     ? Colors.grey.shade100
                        //     : Colors.white,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                          left: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          cell(item.customerRegion, 2),
                          cell(item.branchRegionDesc, 2),
                          cell(getFormatted(item.totalBulk, quantityType), 1),
                          cell(getFormatted(item.totalBags, quantityType), 1),
                          cell(getFormatted(item.total, quantityType), 1),
                          cell(
                              getFormatted(item.totalMonthly, quantityType), 1),
                          cell(getFormatted(item.totalDaily, quantityType), 1),
                          cell(item.salesName, 3),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ));
  }).toList();
}

List<Widget> buildDispatchPerSalesGroups(
    List<DispatchPerSalesModel> data, QuantityType quantityType) {
  final grouped = groupBySales(data);
  final sortedEntries = grouped.entries.toList()
    ..sort((b, a) => b.key.compareTo(a.key));
  return sortedEntries.map((entry) {
    final salesName = entry.key;
    final items = entry.value;

    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.grey.shade100,
                  alignment: Alignment.center,
                  child: Text(
                    salesName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              /// باقي الجدول
              Expanded(
                flex: 7,
                child: Column(
                  children: List.generate(items.length, (index) {
                    final item = items[index];

                    return Container(
                      decoration: BoxDecoration(
                        // color: index % 2 == 0
                        //     ? Colors.grey.shade100
                        //     : Colors.white,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                          left: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          cell(item.branchRegionDesc, 2),
                          cell(getFormatted(item.totalBulk, quantityType), 1),
                          cell(getFormatted(item.totalBags, quantityType), 1),
                          cell(getFormatted(item.total, quantityType), 1),
                          cell(
                              getFormatted(item.totalMonthly, quantityType), 1),
                          cell(getFormatted(item.totalDaily, quantityType), 1),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ));
  }).toList();
}

Widget cell(dynamic value, int flex) {
  return Expanded(
    flex: flex,
    child: Center(child: Text(value?.toString() ?? '')),
  );
}

String getFormatted(DispatchQuantity? q, QuantityType type) {
  final value = getQuantityValue(q, type);
  return NumberFormat.decimalPatternDigits(decimalDigits: 0).format(value);
}

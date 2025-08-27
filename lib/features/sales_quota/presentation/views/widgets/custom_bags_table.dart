import 'package:flutter/material.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/sales_quota.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/custom_table_input_cell.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/table_header_cell.dart';

class CustomBagsTable extends StatelessWidget {
  const CustomBagsTable({
    super.key,
    required this.salesQuotaList,
    required this.controllers,
    required this.getTotalBagsPickuAndDelivery,
  });

  final List<SalesQuota> salesQuotaList;
  final List<Map<String, TextEditingController>> controllers;
  final void Function(num pickupBags, num deliveryBags)
      getTotalBagsPickuAndDelivery;
  @override
  Widget build(BuildContext context) {
    dynamic pickupBagsQuotaSum = 0;
    dynamic deliveryBagsQuotaSum = 0;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
          border: const TableBorder.symmetric(
              outside: BorderSide(color: Color.fromARGB(255, 221, 221, 221))),
          defaultColumnWidth: const IntrinsicColumnWidth(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            const TableRow(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 234, 234, 235)),
              children: [
                TableCell(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 60),
                    child: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TableHeaderCell(child: 'Pickup'),
                TableHeaderCell(child: 'Delivery'),
                TableHeaderCell(child: 'Total'),
                TableHeaderCell(child: 'Extra'),
                TableHeaderCell(child: 'Settelment'),
              ],
            ),
            ...List.generate(salesQuotaList.length, (rowIndex) {
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 20, right: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            salesQuotaList[rowIndex].salesName!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Opacity(
                            opacity: .5,
                            child: Text(
                              salesQuotaList[rowIndex].salesId!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomTableInputCell(
                    controller: controllers.where((controller) {
                      return controller['salesId']!.text ==
                          salesQuotaList[rowIndex].salesId;
                    }).first['pickupBagsQuota']!,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      calTotalBags(rowIndex, value);
                      pickupBagsQuotaSum = calTotalCol("pickup");
                      getTotalBagsPickuAndDelivery(
                          pickupBagsQuotaSum, deliveryBagsQuotaSum);
                    },
                  ),
                  CustomTableInputCell(
                    controller: controllers.where((controller) {
                      return controller['salesId']!.text ==
                          salesQuotaList[rowIndex].salesId;
                    }).first['deliveryBagsQuota']!,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      calTotalBags(rowIndex, value);
                      deliveryBagsQuotaSum = calTotalCol("delivery");
                      getTotalBagsPickuAndDelivery(
                          pickupBagsQuotaSum, deliveryBagsQuotaSum);
                    },
                  ),
                  CustomTableInputCell(
                    controller: controllers.where((controller) {
                      return controller['salesId']!.text ==
                          salesQuotaList[rowIndex].salesId;
                    }).first['totalBagsQuota']!,
                    keyboardType: TextInputType.number,
                    enable: false,
                  ),
                  CustomTableInputCell(
                    controller: controllers.where((controller) {
                      return controller['salesId']!.text ==
                          salesQuotaList[rowIndex].salesId;
                    }).first['extraBagsQuota']!,
                    keyboardType: TextInputType.number,
                  ),
                  CustomTableInputCell(
                    controller: controllers.where((controller) {
                      return controller['salesId']!.text ==
                          salesQuotaList[rowIndex].salesId;
                    }).first['settelementBagsQuota']!,
                    keyboardType: TextInputType.number,
                  ),
                ],
              );
            }),
          ]),
    );
  }

  void calTotalBags(int rowIndex, String value) {
    int pickupBags = int.tryParse(controllers
            .where((controller) {
              return controller['salesId']!.text ==
                  salesQuotaList[rowIndex].salesId;
            })
            .first['pickupBagsQuota']!
            .text) ??
        0;
    int deliveryBags = int.tryParse(controllers
            .where((controller) {
              return controller['salesId']!.text ==
                  salesQuotaList[rowIndex].salesId;
            })
            .first['deliveryBagsQuota']!
            .text) ??
        0;
    controllers
        .where((controller) {
          return controller['salesId']!.text ==
              salesQuotaList[rowIndex].salesId;
        })
        .first['totalBagsQuota']!
        .text = (pickupBags + deliveryBags).toString();
  }

  num calTotalCol(String type) {
    num total = 0;
    if (type == 'pickup') {
      total = controllers.fold(0.0, (sum, item) {
        final value = int.tryParse(item['pickupBagsQuota']!.text) ?? 0.0;
        return sum + value;
      });
    } else if (type == 'delivery') {
      total = controllers.fold(0.0, (sum, item) {
        final value = int.tryParse(item['deliveryBagsQuota']!.text) ?? 0.0;
        return sum + value;
      });
    }
    return total;
  }
}

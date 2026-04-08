import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/parse_to_int.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/sales_quota.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/custom_table_input_cell.dart';

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
              decoration: BoxDecoration(color: Color(0xff2b6617)),
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Text(
                      'Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                TableCell(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    'Pickup',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )),
                TableCell(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    'delivery',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )),
                TableCell(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    'Total',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )),
                TableCell(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    'Delivery Extra',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )),
                TableCell(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    'Pickup Extra',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )),
                TableCell(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    'Settelment',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )),
              ],
            ),
            ...List.generate(salesQuotaList.length, (rowIndex) {
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
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
                              parseToInt(salesQuotaList[rowIndex].salesId!)
                                  .toString(),
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
                    }).first['extraDeliveryBagsQuota']!,
                    keyboardType: TextInputType.number,
                  ),
                  CustomTableInputCell(
                    controller: controllers.where((controller) {
                      return controller['salesId']!.text ==
                          salesQuotaList[rowIndex].salesId;
                    }).first['extraPickupBagsQuota']!,
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

import 'package:flutter/material.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/sales_quota.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/custom_table_input_cell.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/table_header_cell.dart';

class CustomBulkTable extends StatelessWidget {
  const CustomBulkTable({
    super.key,
    required this.salesQuotaList,
    required this.controllers,
  });

  final List<SalesQuota> salesQuotaList;
  final List<Map<String, TextEditingController>> controllers;
  @override
  Widget build(BuildContext context) {
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
                    }).first['pickupBulkQuota'],
                    onChanged: (value) {
                      calBulkTotal(rowIndex, value);
                    },
                    keyboardType: TextInputType.number,
                  ),
                  CustomTableInputCell(
                    controller: controllers.where((controller) {
                      return controller['salesId']!.text ==
                          salesQuotaList[rowIndex].salesId;
                    }).first['deliveryBulkQuota'],
                    onChanged: (value) {
                      calBulkTotal(rowIndex, value);
                    },
                    keyboardType: TextInputType.number,
                  ),
                  CustomTableInputCell(
                    enable: false,
                    controller: controllers.where((controller) {
                      return controller['salesId']!.text ==
                          salesQuotaList[rowIndex].salesId;
                    }).first['totalBulkQuota'],
                    keyboardType: TextInputType.number,
                  ),
                  CustomTableInputCell(
                    controller: controllers.where((controller) {
                      return controller['salesId']!.text ==
                          salesQuotaList[rowIndex].salesId;
                    }).first['extraBulkQuota'],
                    keyboardType: TextInputType.number,
                  ),
                  CustomTableInputCell(
                    controller: controllers.where((controller) {
                      return controller['salesId']!.text ==
                          salesQuotaList[rowIndex].salesId;
                    }).first['settelementBulkQuota'],
                    keyboardType: TextInputType.number,
                  ),
                ],
              );
            }),
          ]),
    );
  }

  void calBulkTotal(int rowIndex, String value) {
    double pickupBulk = double.tryParse(controllers
            .where((controller) {
              return controller['salesId']!.text ==
                  salesQuotaList[rowIndex].salesId;
            })
            .first['pickupBulkQuota']!
            .text) ??
        0;
    double deliveryBulk = double.tryParse(controllers
            .where((controller) {
              return controller['salesId']!.text ==
                  salesQuotaList[rowIndex].salesId;
            })
            .first['deliveryBulkQuota']!
            .text) ??
        0;

    controllers
        .where((controller) {
          return controller['salesId']!.text ==
              salesQuotaList[rowIndex].salesId;
        })
        .first['totalBulkQuota']!
        .text = (pickupBulk + deliveryBulk).toString();
  }
}

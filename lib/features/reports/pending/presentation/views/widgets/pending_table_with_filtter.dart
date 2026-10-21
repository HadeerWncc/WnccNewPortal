import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/features/reports/pending/data/models/pending_model/pending_model.dart';

class PendingTableWithFulter extends StatefulWidget {
  const PendingTableWithFulter({
    super.key,
    required this.tableData,
    required this.searchText,
  });

  final List<PendingModel> tableData;
  final String searchText;
  @override
  State<PendingTableWithFulter> createState() => _PendingTableWithFulterState();
}

class _PendingTableWithFulterState extends State<PendingTableWithFulter> {
  String selectedSales = "All";
  String selectedRegion = "All";
  String selectedMatrial = "All";
  List<PendingModel> get filteredData {
    return widget.tableData.where((t) {
      final matchDoc = widget.searchText.isEmpty ||
          (t.delivery ?? "")
              .toLowerCase()
              .contains(widget.searchText.toLowerCase());

      final matchSales = selectedSales == "All" || t.salesName == selectedSales;

      final matchRegion =
          selectedRegion == "All" || t.branchName == selectedRegion;
      final matchMatrial =
          selectedMatrial == "All" || t.materialName == selectedMatrial;

      return matchDoc && matchSales && matchRegion && matchMatrial;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
  bool isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;

    final data = filteredData;
    Map<String, dynamic> pendingTotal = {
      'Customer': 'Total',
      'Customer Name': "",
      'Order No': '',
      'Product': '',
      'Quantity': data.fold(
        0.0,
        (sum, item) => sum + (item.deliveryQuantity ?? 0),
      ),
      'Region': '',
      'City': '',
      'Reciever': '',
      'Zone': '',
      'Sales': '',
      'Date': '',
    };
    return Column(
      children: [
        Wrap(
          spacing: 7,
          runSpacing: 7,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            CustomDropDownInput(
              selectedValue: "All",
              items: [
                "All",
                ...widget.tableData.map((t) => t.salesName ?? '').toSet()
              ],
              title: "Sales",
              hintText: "Sales",
              fontSize: 14,
              width: MediaQuery.of(context).size.width * (isLandScape?0.2:0.35) ,
              onChanged: (value) {
                selectedSales = value!;
                setState(() {});
              },
            ),
            CustomDropDownInput(
              selectedValue: "All",
              items: [
                "All",
                ...widget.tableData.map((t) => t.branchName ?? '').toSet()
              ],
              title: "Region",
              hintText: "Region",
              fontSize: 14,
              width: MediaQuery.of(context).size.width * (isLandScape?0.2:0.35),
              onChanged: (value) {
                selectedRegion = value!;
                setState(() {});
              },
            ),
            CustomDropDownInput(
              selectedValue: "All",
              items: [
                "All",
                ...widget.tableData.map((t) => t.materialName ?? '').toSet()
              ],
              title: "Matrial",
              hintText: "Matrial",
              fontSize: 14,
              width: MediaQuery.of(context).size.width * (isLandScape?0.25:0.5),
              onChanged: (value) {
                selectedMatrial = value!;
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        data.isEmpty
            ? const Center(
                child: Text('No Data Available'),
              )
            : Expanded(
                child: DataTable2(
                    minWidth: data.first.toDeliveryMap().length * 150,
                    isVerticalScrollBarVisible: false,
                    horizontalMargin: 0,
                    columnSpacing: 0,
                    fixedTopRows: 1,
                    fixedLeftColumns: 1,
                    fixedColumnsColor: fixedColumnsColor,
                    headingRowHeight: 45,
                    headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columns: data.first
                        .toDeliveryMap()
                        .keys
                        .toList()
                        .map(
                          (e) => (e == "Customer Name" || e == "Product")
                              ? DataColumn2(
                                  fixedWidth: 230,
                                  label: Center(
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : DataColumn(
                                  label: Center(
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                        )
                        .toList(),
                    rows: [
                      ...data.map(
                        (payment) {
                          final pendingMap = payment.toDeliveryMap();

                          return DataRow(
                            cells: pendingMap.values.map(
                              (value) {
                                return DataCell(
                                  Center(
                                    child: Text(value.toString()),
                                  ),
                                );
                              },
                            ).toList(),
                          );
                        },
                      ),
                      DataRow(
                        cells: pendingTotal.values.map(
                          (value) {
                            return DataCell(
                              Center(
                                child: Text(value.toString()),
                              ),
                            );
                          },
                        ).toList(),
                      )
                    ]),
              ),
      ],
    );
  }
}

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/reports/loading_details/data/models/loading_details_model.dart';

class LoadingDetailsTableWithFulter extends StatefulWidget {
  const LoadingDetailsTableWithFulter({
    super.key,
    required this.tableData,
  });

  final List<LoadingDetailsModel> tableData;

  @override
  State<LoadingDetailsTableWithFulter> createState() => _LoadingDetailsTableWithFulterState();
}

class _LoadingDetailsTableWithFulterState extends State<LoadingDetailsTableWithFulter> {
  String searchText = "";
  String selectedSales = "All";
  String selectedProduct = "All";
  List<LoadingDetailsModel> get filteredData {
    return widget.tableData.where((t) {
      final matchDoc = searchText.isEmpty ||
          (t.shipmentNo ?? "").toLowerCase().contains(searchText.toLowerCase());

      final matchSales =
          selectedSales == "All" || t.salesName == selectedSales;

      final matchProduct = selectedProduct == "All" || t.materialName == selectedProduct;

      return matchDoc && matchSales && matchProduct;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final data = filteredData;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomPlaceholderInput(
              labelText: 'ShipNo',
              width: MediaQuery.of(context).size.width * 0.3,
              icon: const Icon(
                Symbols.document_search,
                color: Colors.grey,
              ),
              onChanged: (value) {
                searchText = value;
                setState(() {});
              },
            ),
            CustomDropDownInput(
              selectedValue: "All",
              items: [
                "All",
                ...widget.tableData.map((t) => t.salesName ?? '').toSet()
              ],
              title: "Sales",
              hintText: "Sales",
              width: MediaQuery.of(context).size.width * 0.28,
              onChanged: (value) {
                selectedSales = value!;
                setState(() {});
              },
            ),
            CustomDropDownInput(
              selectedValue: "All",
              items: [
                "All",
                ...widget.tableData.map((t) => t.materialName ?? '').toSet()
              ],
              title: "Product",
              hintText: "Product",
              width: MediaQuery.of(context).size.width * 0.35,
              onChanged: (value) {
                selectedProduct = value!;
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
                  minWidth: data.first.toMap().length * 150,
                  isVerticalScrollBarVisible: false,
                  horizontalMargin: 0,
                  columnSpacing: 0,
                  fixedTopRows: 1,
                  fixedLeftColumns: 1,
                  fixedColumnsColor: tableHeaderColor,
                  headingRowHeight: 45,
                  headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: data.first
                      .toMap()
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
                  rows: data.map(
                    (payment) {
                      final paymentMap = payment.toMap();
                      return DataRow(
                        cells: paymentMap.values.map(
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
                  ).toList(),
                ),
              ),
      ],
    );
  }
}

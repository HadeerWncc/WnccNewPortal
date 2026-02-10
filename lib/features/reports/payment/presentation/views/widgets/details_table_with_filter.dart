import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/reports/payment/data/models/payment_details_model.dart';

class DetailsTableWithFulter extends StatefulWidget {
  const DetailsTableWithFulter({
    super.key,
    required this.tableData,
  });

  final List<PaymentDetailsModel> tableData;

  @override
  State<DetailsTableWithFulter> createState() => _DetailsTableWithFulterState();
}

class _DetailsTableWithFulterState extends State<DetailsTableWithFulter> {
  String searchText = "";
  String selectedSales = "All";
  String selectedBank = "All";
  List<PaymentDetailsModel> get filteredData {
    return widget.tableData.where((t) {
      final matchDoc = searchText.isEmpty ||
          (t.documentNo ?? "").toLowerCase().contains(searchText.toLowerCase());

      final matchSales =
          selectedSales == "All" || t.salesRepName == selectedSales;

      final matchBank = selectedBank == "All" || t.houseBank == selectedBank;

      return matchDoc && matchSales && matchBank;
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
              labelText: 'DocNo',
              width: MediaQuery.of(context).size.width * 0.31,
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
                ...widget.tableData.map((t) => t.salesRepName ?? '').toSet()
              ],
              title: "Sales",
              hintText: "Sales",
              width: MediaQuery.of(context).size.width * 0.31,
              onChanged: (value) {
                selectedSales = value!;
                setState(() {});
              },
            ),
            CustomDropDownInput(
              selectedValue: "All",
              items: [
                "All",
                ...widget.tableData.map((t) => t.houseBank ?? '').toSet()
              ],
              title: "Banks",
              hintText: "Banks",
              width: MediaQuery.of(context).size.width * 0.31,
              onChanged: (value) {
                selectedBank = value!;
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
                        (e) => (e == "Customer Name")
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
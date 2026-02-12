import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/core/widgets/custom_toggle_button.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_chck_buttons.dart';

class DetailsLoading extends StatelessWidget {
  const DetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomChckButtons(
                    buttons: ["EGP", "USD"],
                    activeTab: 1,
                  ),
                  CustomToggleButton(),
                ],
              ),
              const SizedBox(height: 10),
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
                  ),
                  CustomDropDownInput(
                    selectedValue: "All",
                    items: const [
                      "All",
                    ],
                    title: "Sales",
                    hintText: "Sales",
                    width: MediaQuery.of(context).size.width * 0.31,
                  ),
                  CustomDropDownInput(
                    selectedValue: "All",
                    items: const ["All"],
                    title: "Banks",
                    hintText: "Banks",
                    width: MediaQuery.of(context).size.width * 0.31,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: DataTable2(
                    minWidth: 6 * 150,
                    horizontalMargin: 0,
                    columnSpacing: 0,
                    fixedTopRows: 1,
                    fixedLeftColumns: 1,
                    fixedColumnsColor: tableHeaderColor,
                    headingRowHeight: 45,
                    headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columns: [
                      "Customer",
                      "Customer Name",
                      "Doc No",
                      "Region",
                      "Amount",
                      "Bank"
                    ]
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
                    rows: const [
                      DataRow(cells: [
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(""),
                          ),
                        ),
                      ]),
                    ]),
              ),
            ],
          )),
    );
  }
}

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/reports/loading_details/domain/entities/loading_details_summary_entity.dart';
import 'package:wncc_portal/features/reports/loading_details/presentation/views/widgets/loading_details_summary.dart';

class LoadingDetailsLoadingWidget extends StatelessWidget {
  const LoadingDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ===== Summary =====
            LoadingDetailsSummary(
              loadingDetailsSummaryEntity: LoadingDetailsSummaryEntity(
                  wadie: 0, masry: 0, bulk: 0, export: 0, total: 0),
            ),
            const SizedBox(height: 7),

            /// ===== Tabs =====
            const CustomChckButtons(
              buttons: ["Check In", "Loading", "Both"],
              activeTab: 0,
              onTap: null,
            ),
            const SizedBox(height: 10),

            /// ===== Filters & Table =====
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: orientation == Orientation.landscape ? 400 : 600,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            /// ===== Search =====
                            CustomPlaceholderInput(
                              labelText: 'ShipNo',
                              fontSize: 14,
                              width: MediaQuery.of(context).size.width * 0.31,
                              icon: const Icon(Symbols.document_search,
                                  color: Colors.grey),
                              onChanged: null,
                            ),
                            const SizedBox(width: 5),

                            /// ===== Sales Dropdown =====
                            CustomDropDownInput(
                              selectedValue: "All",
                              items: const ["All"],
                              fontSize: 14,
                              title: "Sales",
                              hintText: "Sales",
                              width: MediaQuery.of(context).size.width * 0.35,
                              onChanged: null,
                            ),
                            const SizedBox(width: 5),

                            /// ===== Product Dropdown =====
                            CustomDropDownInput(
                              selectedValue: "All",
                              items: const ["All"],
                              title: "Product",
                              fontSize: 14,
                              hintText: "Product",
                              width: MediaQuery.of(context).size.width * 0.45,
                              onChanged: null,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: DataTable2(
                            minWidth: 1000,
                            horizontalMargin: 0,
                            columnSpacing: 0,
                            fixedTopRows: 1,
                            fixedLeftColumns: 1,
                            fixedColumnsColor: fixedColumnsColor,
                            headingRowHeight: 45,
                            headingRowColor:
                                WidgetStateProperty.all(tableHeaderColor),
                            border:
                                TableBorder.all(color: Colors.grey.shade300),
                            columns: const [
                              DataColumn2(
                                fixedWidth: 230,
                                label: Center(
                                  child: Text(
                                    '',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Center(
                                  child: Text(
                                    '',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Center(
                                  child: Text(
                                    '',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Center(
                                  child: Text(
                                    '',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              DataColumn2(
                                fixedWidth: 230,
                                label: Center(
                                  child: Text(
                                    '',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Center(
                                  child: Text(
                                    '',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                            rows: const [
                              DataRow(
                                cells: [
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

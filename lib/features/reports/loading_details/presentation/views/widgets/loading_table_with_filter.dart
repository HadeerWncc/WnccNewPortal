import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/reports/loading_details/data/models/loading_details_model.dart';
import 'package:wncc_portal/features/reports/loading_details/presentation/manager/loading_details_cubit/loading_details_cubit.dart';

class LoadingDetailsTableWithFilter extends StatelessWidget {
  const LoadingDetailsTableWithFilter({
    super.key,
    required this.tableData,
    required this.allData, // كل البيانات للاستخدام في الـ dropdown
  });

  final List<LoadingDetailsModel> tableData;
  final List<LoadingDetailsModel> allData;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoadingDetailsCubit>();

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              /// ===== Search =====
              CustomPlaceholderInput(
                labelText: 'ShipNo',
                width: MediaQuery.of(context).size.width * 0.31,
                icon: const Icon(Symbols.document_search, color: Colors.grey),
                onChanged: (value) {
                  cubit.search(value);
                },
              ),
              const SizedBox(width: 5),

              /// ===== Sales Dropdown =====
              CustomDropDownInput(
                selectedValue: "All",
                items: [
                  "All",
                  ...allData.map((e) => e.salesName ?? "").toSet()
                ],
                title: "Sales",
                hintText: "Sales",
                width: MediaQuery.of(context).size.width * 0.31,
                onChanged: (value) {
                  cubit.changeSales(value!);
                },
              ),
              const SizedBox(width: 5),

              /// ===== Product Dropdown =====
              CustomDropDownInput(
                selectedValue: "All",
                items: [
                  "All",
                  ...allData.map((e) => e.materialName ?? "").toSet()
                ],
                title: "Product",
                hintText: "Product",
                width: MediaQuery.of(context).size.width * 0.35,
                onChanged: (value) {
                  cubit.changeProduct(value!);
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        /// ===== Table =====
        tableData.isEmpty
            ? const Center(child: Text("No Data Available"))
            : Expanded(
                child: DataTable2(
                  minWidth: tableData.first.toMap().length * 150,
                  horizontalMargin: 0,
                  columnSpacing: 0,
                  fixedTopRows: 1,
                  fixedLeftColumns: 1,
                  fixedColumnsColor: tableHeaderColor,
                  headingRowHeight: 45,
                  headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: tableData.first
                      .toMap()
                      .keys
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
                  rows: tableData
                      .map(
                        (row) => DataRow(
                          cells: row
                              .toMap()
                              .values
                              .map((value) => DataCell(
                                  Center(child: Text(value.toString()))))
                              .toList(),
                        ),
                      )
                      .toList(),
                ),
              ),
      ],
    );
  }
}

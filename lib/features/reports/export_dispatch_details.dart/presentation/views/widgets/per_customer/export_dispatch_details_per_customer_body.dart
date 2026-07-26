import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/tables/loading_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/helper/get_dis_value.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/presentation/manager/cubits/export_dispatch_per_customer_cubit/export_dispatch_per_customer_cubit.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/presentation/manager/helper/get_totals.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/presentation/views/widgets/per_customer/export_dispatch_details_per_customer_header.dart';
// import 'package:collection/collection.dart';

class ExportDispatchDetailsPerCustomerBody extends StatefulWidget {
  const ExportDispatchDetailsPerCustomerBody({super.key});

  @override
  State<ExportDispatchDetailsPerCustomerBody> createState() =>
      _ExportDispatchDetailsPerCustomerBodyState();
}

class _ExportDispatchDetailsPerCustomerBodyState
    extends State<ExportDispatchDetailsPerCustomerBody> {
  List<String> incotermList = [];
  List<String> typeList = [];
  List<String> brandList = [];
  List<String> customers = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const DispatchDetailsHeaderTabs(activeTab: 0),
        // const SizedBox(height: 5),
        ExportDispatchDetailsPerCustomerHeader(
          date: DateTime.now(),
          onChangeincoterm: (incotermValues) {
            setState(() {
              incotermList = incotermValues;
            });
          },
          onChangeType: (typeValues) {
            setState(() {
              typeList = typeValues;
            });
          },
          onChangeBrands: (brands) {
            setState(() {
              brandList = brands;
            });
          },
        ),
        const SizedBox(height: 10),
        BlocBuilder<ExportDispatchPerCustomerCubit,
            ExportDispatchPerCustomerState>(builder: (context, state) {
          if (state is ExportDispatchPerCustomerSuccess) {
            customers = state.exportDispatchList
                .expand((item) => item.dispatches ?? [])
                .map<String>((dispatch) => dispatch.name)
                .toSet()
                .toList();
            List<String> tableHeaderNames =
                state.exportDispatchList[0].mode == 2
                    ? ['Day', ...customers, 'Total']
                    : ['Month', ...customers, 'Total'];
            return state.exportDispatchList.isNotEmpty
                ? Expanded(
                    child: DataTable2(
                        minWidth: (customers.length + 2) * 200,
                        isVerticalScrollBarVisible: false,
                        horizontalMargin: 0,
                        columnSpacing: 0,
                        fixedTopRows: 1,
                        fixedLeftColumns: 1,
                        fixedColumnsColor: tableHeaderColor,
                        headingRowHeight: 45,
                        headingRowColor:
                            WidgetStateProperty.all(tableHeaderColor),
                        border: TableBorder.all(color: Colors.grey.shade300),
                        columns: tableHeaderNames
                            .map(
                              (e) => (e == 'Day' || e == 'Month')
                                  ? DataColumn2(
                                      fixedWidth: 100,
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
                          ...state.exportDispatchList.map(
                            (exportDispatch) {
                              return DataRow(cells: [
                                // Date
                                DataCell(
                                  Center(
                                    child: Text(exportDispatch.mode == 2
                                        ? DateFormat("d,MMM").format(
                                            DateTime.parse(
                                                exportDispatch.date.toString()))
                                        : exportDispatch.displayDate
                                            .toString()),
                                  ),
                                ),

                                // Customers
                                ...customers.map((c) {
                                  return DataCell(
                                    Center(
                                      child: Text(
                                        getDisValue(
                                            getCustomerValue(
                                                exportDispatch, c, brandList),
                                            incotermList,
                                            typeList),
                                      ),
                                    ),
                                  );
                                }),

                                // Total
                                DataCell(
                                  Center(
                                    child: Text(
                                      getDisValue(
                                          getDayTotal(
                                              exportDispatch, brandList),
                                          incotermList,
                                          typeList),
                                    ),
                                  ),
                                ),
                              ]);
                            },
                          ),
                          DataRow(
                            color:
                                WidgetStateProperty.all(Colors.grey.shade200),
                            cells: [
                              const DataCell(
                                Center(
                                  child: Text(
                                    'Total',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              ...customers.map((c) => DataCell(
                                    Center(
                                      child: Text(
                                        getDisValue(
                                            getCustomerTotal(
                                                state.exportDispatchList,
                                                c,
                                                brandList),
                                            incotermList,
                                            typeList),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                              DataCell(
                                Center(
                                  child: Text(
                                    getDisValue(
                                        getGrandTotal(state.exportDispatchList,
                                            customers, brandList),
                                        incotermList,
                                        typeList),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                  )
                : const Center(child: Text("No Data Avilable"));
          } else if (state is ExportDispatchPerCustomerFailure) {
            return Center(
                child: Text(
              state.error,
              style: const TextStyle(color: Colors.red),
            ));
          }
          return const LoadingTable();
        }),
      ],
    );
  }
}

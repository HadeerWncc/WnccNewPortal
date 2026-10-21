import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/tables/loading_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/helper/get_dis_value.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/presentation/manager/cubits/export_dispatch_per_brand_cubit/export_dispatch_per_brand_cubit.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/presentation/manager/helper/get_totals.dart';
import 'package:wncc_portal/features/reports/export_dispatch_details.dart/presentation/views/widgets/per_brand/export_dispatch_details_per_brand_header.dart';

class ExportDispatchDetailsPerBrandBody extends StatefulWidget {
  const ExportDispatchDetailsPerBrandBody({super.key});

  @override
  State<ExportDispatchDetailsPerBrandBody> createState() =>
      _ExportDispatchDetailsPerBrandBodyState();
}

class _ExportDispatchDetailsPerBrandBodyState
    extends State<ExportDispatchDetailsPerBrandBody> {
  List<String> incotermList = [];
  List<String> typeList = [];
  // List<String> brandList = [];
  List<String> brands = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const DispatchDetailsHeaderTabs(activeTab: 0),
        // const SizedBox(height: 5),
        ExportDispatchDetailsPerBrandHeader(
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
        ),
        const SizedBox(height: 10),
        BlocBuilder<ExportDispatchPerBrandCubit, ExportDispatchPerBrandState>(
            builder: (context, state) {
          if (state is ExportDispatchPerBrandSuccess) {
            brands = state.expDisPerBrand
                .expand((item) => item.dispatches ?? [])
                .map<String>((dispatch) => dispatch.name)
                .toSet()
                .toList();
            List<String> tableHeaderNames = state.expDisPerBrand[0].mode == 2
                ? ['Day', ...brands, 'Total']
                : ['Month', ...brands, 'Total'];
            return state.expDisPerBrand.isNotEmpty
                ? Expanded(
                    child: DataTable2(
                        minWidth: (brands.length + 2) * 200,
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
                          ...state.expDisPerBrand.map(
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
                                ...brands.map((c) {
                                  return DataCell(
                                    Center(
                                      child: Text(
                                        getDisValue(
                                            getCustomerValue(
                                                exportDispatch, c, []),
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
                                          getDayTotal(exportDispatch, []),
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
                              ...brands.map((c) => DataCell(
                                    Center(
                                      child: Text(
                                        getDisValue(
                                            getCustomerTotal(
                                                state.expDisPerBrand, c, []),
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
                                        getGrandTotal(
                                            state.expDisPerBrand, brands, []),
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
          } else if (state is ExportDispatchPerBrandFailure) {
            return Center(
                child: Text(
              state.error,
              style: const TextStyle(color: Colors.red),
            ));
          }
          return const Expanded(child: LoadingTable());
        }),
      ],
    );
  }
}

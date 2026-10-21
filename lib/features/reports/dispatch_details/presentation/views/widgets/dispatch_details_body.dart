import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/tables/loading_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/flat_dispatch_details_cubit/flat_dispatch_details_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/dispatch_details_header_tabs.dart';

class DispatchDetailsBody extends StatelessWidget {
  const DispatchDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const DispatchDetailsHeaderTabs(activeTab: 1),
          const SizedBox(height: 8),
          BlocBuilder<FlatDispatchDetailsCubit, FlatDispatchDetailsState>(
            builder: (context, state) {
              if (state is FlatDispatchDetailsSuccess) {
                return Expanded(
                  child: DataTable2(
                    minWidth: state.dispatchDetails.first.toMap().length * 150,
                    isVerticalScrollBarVisible: false,
                    horizontalMargin: 0,
                    columnSpacing: 0,
                    fixedTopRows: 1,
                    fixedLeftColumns: 1,
                    fixedColumnsColor: tableHeaderColor,
                    headingRowHeight: 45,
                    headingRowColor: WidgetStateProperty.all(kBtnColor),
                    headingTextStyle: const TextStyle(color: Colors.white),
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columns: state.dispatchDetails.first
                        .toMap()
                        .keys
                        .toList()
                        .map(
                          (e) => (e == "Customer")
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
                    rows: state.dispatchDetails.map(
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
                );
              } else {
                return const Expanded(child: LoadingTable());
              }
            },
          ),
        ],
      ),
    );
  }
}

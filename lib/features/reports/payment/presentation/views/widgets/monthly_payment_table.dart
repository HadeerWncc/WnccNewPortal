import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/build_table_data.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payment_cubit/payments_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/payment_loaing.dart';

class MonthlyPaymentTable extends StatelessWidget {
  const MonthlyPaymentTable({
    super.key,
    required this.currency,
  });
  final String currency;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentsCubit, PaymentsState>(
      builder: (context, state) {
        if (state is PaymentsSuccess) {
          final tableData = buildTableData(state.payments, currency);
          return DataTable2(
            horizontalMargin: 0,
            columnSpacing: 0,
            headingRowHeight: 45,
            minWidth: tableData.headers.length * 150,
            fixedLeftColumns: 1,
            fixedTopRows: 1,
            fixedColumnsColor: tableHeaderColor,
            headingRowColor: WidgetStateProperty.all(tableHeaderColor),
            border: TableBorder.all(color: Colors.grey.shade300),
            columns: tableData.headers
                .map(
                  (e) => DataColumn(
                    label: Center(
                      child: Text(
                        e ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
                .toList(),
            rows: tableData.rows
                .map(
                  (row) => DataRow(
                    color: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (tableData.rows.indexOf(row) ==
                            tableData.rows.length - 1) {
                          return tableHeaderColor;
                        }
                        return null;
                      },
                    ),
                    cells: row
                        .map((c) => DataCell(
                              Center(
                                child: Text(
                                  (c is String)
                                      ? c
                                      : NumberFormat.decimalPattern()
                                          .format(c ?? 0),
                                  style: TextStyle(
                                      fontWeight:
                                          (tableData.rows.indexOf(row) ==
                                                  tableData.rows.length - 1)
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )
                .toList(),
          );
        } else if (state is PaymentsFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return const PaymentLoaing();
      },
    );
  }
}

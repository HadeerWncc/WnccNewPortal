
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/table_column.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/build_table_data.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubit/payments_cubit.dart';

class MonthlyPaymentTable extends StatelessWidget {
  const MonthlyPaymentTable({
    super.key,
    required this.currency,
  });
  final String currency;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: BlocBuilder<PaymentsCubit, PaymentsState>(
        builder: (context, state) {
          if (state is PaymentsSuccess) {
            final tableData = buildTableData(state.payments, currency);
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                totalColumn(
                  values: [
                    ...state.payments.map((e) => (e.mode == 1)
                        ? DateFormat('MMM').format(DateTime(1, e.month!))
                        : e.day!.toString()),
                    "Total"
                  ],
                  lableName: 'Date',
                ),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        DataTable(
                          headingRowHeight: 45,
                          dataRowMinHeight: 38,
                          dataRowMaxHeight: 42,
                          headingRowColor:
                              WidgetStateProperty.all(tableHeaderColor),
                          border: TableBorder.all(color: Colors.grey.shade300),
                          columns: tableData.headers
                              .map(
                                (e) => DataColumn(
                                  label: Center(
                                    child: Text(
                                      e ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          rows: tableData.rows
                              .map(
                                (row) => DataRow(
                                  color:
                                      WidgetStateProperty.resolveWith<Color?>(
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
                                            Text(
                                              NumberFormat.decimalPattern()
                                                  .format(c ?? 0),
                                              style: TextStyle(
                                                  fontWeight: (tableData.rows
                                                              .indexOf(row) ==
                                                          tableData
                                                                  .rows.length -
                                                              1)
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is PaymentsFailure) {
            return Center(child: Text(state.errorMessage));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

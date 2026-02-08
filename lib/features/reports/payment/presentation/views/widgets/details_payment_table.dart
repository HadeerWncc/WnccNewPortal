import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/table_column.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payments_details_cubit/payments_details_cubit.dart';

class DetailsPaymentTable extends StatelessWidget {
  const DetailsPaymentTable({super.key, required this.currency});
  final String currency;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: BlocBuilder<PaymentsDetailsCubit, PaymentsDetailsState>(
        builder: (context, state) {
          if (state is PaymentsDetailsSuccess) {
            if(state.paymentDetails.isEmpty){
              return const Center(child: Text('No Data Available'),);
            }
            final tableData = state.paymentDetails
                .where((p) => p.currency == currency)
                .toList();
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                totalColumn(
                  values: tableData.map((e) => e.customer ?? '').toList(),
                  lableName: 'Customer',
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
                          columns:  tableData.first
                                  .toMap().keys
                                  .toList()
                                  .map(
                                    (e) => DataColumn(
                                      label: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            e,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                          rows:  tableData.map(
                                  (payment) {
                                    final paymentMap = payment.toMap();
                                    return DataRow(
                                      cells: paymentMap.values.map(
                                        (value) {
                                          return DataCell(
                                            Center(
                                              child: Text(
                                                
                                                value.toString()),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                    );
                                  },
                                ).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is PaymentsDetailsFailure) {
            return Center(child: Text(state.errorMsg));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

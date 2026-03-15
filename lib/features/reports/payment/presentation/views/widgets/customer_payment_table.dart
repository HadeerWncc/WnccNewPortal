import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/reports/payment/domain/entities/customer_deposit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payment_per_customer_cubit/payment_per_customer_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/payment_loaing.dart';

class CustomerPaymentTable extends StatelessWidget {
  const CustomerPaymentTable({
    super.key,
    required this.currency,
    required this.showCharts, this.payerId,
  });
  final String currency;
  final bool showCharts;
  final String? payerId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentPerCustomerCubit, PaymentPerCustomerState>(
      builder: (context, state) {
        if (state is PaymentPerCustomerSuccess) {
          List<CustomerDeposit> customerDepositList = state.customerDeposit;
          if(payerId != null){
            customerDepositList = customerDepositList.where((c)=>c.customer.contains(payerId!)).toList();
          }
          // final charts = buildChartsData(state.payments, currency);
          // final stackedData = buildStackedData(state.payments, currency);
          // final tableData = buildTableData(state.payments, currency);
          // final tops = getTop(state.payments, currency);
          // final totals = getCurrencyTotals(state.payments);

          // final chartData = totals.entries
          //     .map((e) => CurrencyChartData(e.key, e.value))
          //     .toList();
          return (showCharts)
              ? Column(
                  children: [
                    // ColumnChart(
                    //   barChart: charts.banks,
                    //   title:
                    //       '${(state.payments[0].mode == 1) ? 'Annual' : 'Monthly'} Comparison (Banks)',
                    // ),
                    // const SizedBox(height: 10),
                    // StackedLineChart(
                    //   stackedData: stackedData,
                    //   title: 'Period Trend (Selected Period)',
                    // ),
                    // const SizedBox(height: 10),
                    // InsightCardsSection(
                    //   topTwo: tops,
                    //   title1:
                    //       state.payments[0].mode == 1 ? 'Top Month' : 'Top Day',
                    //   title2: 'Top Bank',
                    // ),
                    // const SizedBox(height: 10),
                    // CurrencyDonutCard(chartData: chartData)
                  ],
                )
              : DataTable2(
                  horizontalMargin: 0,
                  scrollController: ScrollController(keepScrollOffset: false),
                  columnSpacing: 0,
                  headingRowHeight: 45,
                  minWidth: 900,
                  fixedLeftColumns: 1,
                  fixedTopRows: 1,
                  fixedColumnsColor: tableHeaderColor,
                  headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: [
                    const DataColumn2(
                        label: Center(
                          child: Text(
                            "Customer",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        fixedWidth: 90),
                    const DataColumn2(
                      label: Center(
                        child: Text(
                          "Customer Name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      fixedWidth: 210,
                    ),
                    DataColumn2(
                        fixedWidth: 120,
                        label: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Today",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "(${DateFormat("d/M/yyyy").format(DateTime.now())})",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 114, 114, 114),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        )),
                    DataColumn2(
                      label: Center(
                        child: Text(
                          '${DateFormat("MMMM").format(DateTime.now())} Deposite',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      fixedWidth: 120,
                    ),
                    // DataColumn(label: Text("Currency")),
                    const DataColumn2(
                        label: Center(
                          child: Text(
                            "Sales",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        fixedWidth: 130),
                  ],
                  rows: customerDepositList.map((e) {
                    return DataRow(
                      cells: [
                        DataCell(Center(child: Text(e.customer))),
                        DataCell(Center(child: Text(e.customerName))),
                        DataCell(
                          Center(
                            child: Text(currency == 'EGP'
                                ? e.todayDepositEgp
                                : e.todayDepositUsd),
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(currency == 'EGP'
                                ? e.monthDepositEgp
                                : e.monthDepositUsd),
                          ),
                        ),
                        // DataCell(Text(e.currency)),
                        DataCell(Center(child: Text(e.salesRepName))),
                      ],
                    );
                  }).toList(),
                );
        } else if (state is PaymentPerCustomerFailure) {
          return Center(child: Text(state.error));
        }
        return const PaymentLoaing();
      },
    );
  }
}

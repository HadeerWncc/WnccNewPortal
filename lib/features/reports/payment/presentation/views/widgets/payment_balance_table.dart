import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/payment/data/models/customer_balance.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/balance_table_with_filter.dart';

class PaymentBalanceTable extends StatelessWidget {
  const PaymentBalanceTable(
      {super.key, required this.paymentBalance});
  final List<CustomerBalance> paymentBalance;

  @override
  Widget build(BuildContext context) {
   
    return BalanceTableWithFilter(
      tableData: paymentBalance,
    );
  }
}

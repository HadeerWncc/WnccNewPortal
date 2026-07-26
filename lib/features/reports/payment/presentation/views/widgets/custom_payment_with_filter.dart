import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/payment/domain/entities/customer_deposit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payment_per_customer_cubit/payment_per_customer_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/customer_payment_table.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/payment_loaing.dart';

class CustomerPaymentWithFilter extends StatelessWidget {
  const CustomerPaymentWithFilter({
    super.key,
    required this.openCharts,
    required this.activeTab,
    required this.selectedPayer,
    required this.orientation,
  });

  final bool openCharts;
  final int activeTab;
  final String? selectedPayer;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentPerCustomerCubit, PaymentPerCustomerState>(
      builder: (context, state) {
        if (state is PaymentPerCustomerSuccess) {
          List<CustomerDeposit> customerDepositList = state.customerDeposit;
          if (selectedPayer != "All" && selectedPayer != "") {
            customerDepositList = customerDepositList
                .where((c) => c.customer == selectedPayer!)
                .toList();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomerPaymentTable(
                  currency: activeTab == 0 ? "EGP" : "USD",
                  showCharts: openCharts,
                  customerDepositList: customerDepositList,
                ),
              ),
              // const SizedBox(height: 20),
            ],
          );
        } else if (state is PaymentPerCustomerFailure) {
          return Center(child: Text(state.error));
        }
        return const PaymentLoaing();
      },
    );
  }
}

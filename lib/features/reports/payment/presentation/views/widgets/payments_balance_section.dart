import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/payment/data/models/customer_balance.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/customer_balance_cubit/customer_balance_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/details_loading.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payment_balance_table.dart';

class PaymentsBalanceSection extends StatefulWidget {
  const PaymentsBalanceSection({super.key});

  @override
  State<PaymentsBalanceSection> createState() => _PaymentsBalanceSectionState();
}

class _PaymentsBalanceSectionState extends State<PaymentsBalanceSection> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return BlocBuilder<CustomerBalanceCubit, CustomerBalanceState>(
      builder: (context, state) {
        if (state is CustomerBalanceSuccess) {
          List<CustomerBalance> sortingBanalnce = state.customerBalance;
          sortingBanalnce.sort((a,b)=>b.amountBalance!.compareTo(a.amountBalance!));
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      const SizedBox(height: 10),
                      
                        SizedBox(
                          height:
                              orientation == Orientation.landscape ? 400 : 600,
                          child: PaymentBalanceTable(
                            paymentBalance: sortingBanalnce,
                          ),
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is CustomerBalanceFailure) {
          return Center(child: Text(state.error));
        }
        return const DetailsLoading();
      },
    );
  }
}

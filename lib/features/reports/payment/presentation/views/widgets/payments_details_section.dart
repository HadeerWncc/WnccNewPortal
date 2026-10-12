import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payments_details_cubit/payments_details_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/details_payment_table.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/details_loading.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payments_details_header.dart';

class PaymentsDetailsSection extends StatefulWidget {
  const PaymentsDetailsSection({super.key});

  @override
  State<PaymentsDetailsSection> createState() => _PaymentsDetailsSectionState();
}

class _PaymentsDetailsSectionState extends State<PaymentsDetailsSection> {
  int activeTab = 0;
  bool openCharts = false;
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return BlocBuilder<PaymentsDetailsCubit, PaymentsDetailsState>(
      builder: (context, state) {
        if (state is PaymentsDetailsSuccess) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          PaymentsDetailsHeader(
                            onChangeActiveTap: (numOfActiveTab) {
                              activeTab = numOfActiveTab;
                              setState(() {});
                            },
                            onToggleChange: (toggleValue) {
                              openCharts = toggleValue;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      if (openCharts)
                        DetailsPaymentTable(
                          currency: activeTab == 0 ? "EGP" : "USD",
                          showCharts: openCharts,
                          paymentDetails: state.paymentDetails,
                        )
                      else
                        SizedBox(
                          height:
                              orientation == Orientation.landscape ? 400 : 600,
                          child: DetailsPaymentTable(
                            currency: activeTab == 0 ? "EGP" : "USD",
                            showCharts: openCharts,
                            paymentDetails: state.paymentDetails,
                          ),
                        ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is PaymentsDetailsFailure) {
          return Center(child: Text(state.errorMsg));
        }
        return const DetailsLoading();
      },
    );
  }
}

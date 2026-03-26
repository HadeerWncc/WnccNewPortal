import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_toggle_button.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/fields/loading_input.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';
import 'package:wncc_portal/features/reports/payment/domain/entities/customer_deposit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payment_per_customer_cubit/payment_per_customer_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/customer_payment_header.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/customer_payment_table.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/payment_loaing.dart';

class CustomerPaymentTablesSection extends StatefulWidget {
  const CustomerPaymentTablesSection({
    super.key,
  });

  @override
  State<CustomerPaymentTablesSection> createState() =>
      _CustomerPaymentTablesSectionState();
}

class _CustomerPaymentTablesSectionState
    extends State<CustomerPaymentTablesSection> {
  int activeTab = 0;
  bool openCharts = false;
  String selectedSales = "All";
  String? selectedPayer = "All";

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            CustomerPaymentHeader(
              onChangePayer: (value) {
                selectedPayer = value;
                setState(() {});
              },
            ),
            const SizedBox(width: 7),
            BlocBuilder<PaymentPerCustomerCubit, PaymentPerCustomerState>(
              builder: (context, state) {
                if (state is PaymentPerCustomerSuccess) {
                  final cubit = context.read<PaymentPerCustomerCubit>();

                  return CustomDropDownInput(
                    selectedValue: "All",
                    items: ["All", ...state.sales],
                    title: "Sales",
                    hintText: "Sales",
                    width: MediaQuery.of(context).size.width * 0.28,
                    onChanged: (value) {
                      cubit.changeSales(value!);
                    },
                  );
                } else {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: const LoadingInput(),
                  );
                }
              },
            ),
            const SizedBox(width: 7),
            CustomChckButtons(
                buttons: const ["EGP", "USD"],
                activeTab: activeTab,
                onTap: (value) {
                  if (value == "EGP") {
                    activeTab = 0;
                  } else {
                    activeTab = 1;
                  }
                  setState(() {});
                }),
            const SizedBox(width: 7),
            CustomToggleButton(
                onToggle: (value) => setState(() => openCharts = value)),
          ],
        ),
        const SizedBox(height: 10),
        if (!openCharts) ...[
          sectionTitle('Payments Per Customer'),
          const SizedBox(height: 8),
        ],
        Expanded(
          child: CustomerPaymentWithFilter(
              openCharts: openCharts,
              activeTab: activeTab,
              selectedPayer: selectedPayer,
              orientation: orientation),
        ),
      ],
    );
  }
}

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

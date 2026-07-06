import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/tables/loading_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/cubits/dispatch_details_v2_per_customer_cubit/dispatch_details_v2_per_customer_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/dispatch_details_per_customer_header.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/dispatch_details_per_customer_success_v2.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/per_sales_header_tabs.dart';

class DispatchDetailsVsPerCustBody extends StatefulWidget {
  const DispatchDetailsVsPerCustBody({super.key, required this.user});
  final UserModel user;
  @override
  State<DispatchDetailsVsPerCustBody> createState() =>
      _DispatchDetailsVsPerCustBodyState();
}

class _DispatchDetailsVsPerCustBodyState
    extends State<DispatchDetailsVsPerCustBody> {
  String viewActiveTab = "";
  // String disChnlTab = "";
  // List<String> incoterm = [];
  // List<String> type = [];
  @override
  void initState() {
    viewActiveTab = "Dates";
    // disChnlTab = "Both";
    // incoterm = [];
    // type = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PerSalesHeaderTabs(),
        const SizedBox(height: 5),
        DispatchDetailsPerCustomerHeader(
          // disChnlTab: 'Both',
          date: DateTime.now(),
          viewActiveTab: viewActiveTab,
          // incotermTabs: const [],
          // typeTabs: const [],
          onViewChange: (value) {
            viewActiveTab = value;
            setState(() {});
          },
          user: widget.user,
        ),
        const SizedBox(height: 10),
        BlocBuilder<DispatchDetailsV2PerCustomerCubit,
            DispatchDetailsV2PerCustomerState>(builder: (context, state) {
          if (state is DispatchDetailsV2PerCustomerSuccess) {
            // List<DispatchDetailsVsModel> dist_per_sales_list = state.dispatchDetails
            return state.dispatchDetails.length > 1
                ? DispatchDetailsPerCustomerSuccessV2(
                    dispatchList: state.dispatchDetails,
                    viewType: viewActiveTab,
                    year: DateTime.parse(
                            state.dispatchDetails[0].months[0].date.toString())
                        .year)
                : const Center(child: Text("No Data Avilable"));
          } else if (state is DispatchDetailsV2PerCustomerFailure) {
            return Center(
                child: Text(
              state.error,
              style: const TextStyle(color: Colors.red),
            ));
          }
          return const LoadingTable();
        }),
      ],
    );
  }
}

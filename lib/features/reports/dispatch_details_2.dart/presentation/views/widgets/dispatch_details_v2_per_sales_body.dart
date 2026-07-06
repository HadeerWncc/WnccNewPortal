import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/tables/loading_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/cubits/dispatch_details_v2_per_sales_cubit/dispatch_details_v2_per_sales_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/dispatch_details_per_sales_header.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/per_sales_header_tabs.dart';

import 'dispatch_details_per_sales_success.dart';

class DispatchDetailsV2PerSalesBody extends StatefulWidget {
  const DispatchDetailsV2PerSalesBody({super.key, required this.user});
  final UserModel user;
  @override
  State<DispatchDetailsV2PerSalesBody> createState() =>
      _DispatchDetailsV2PerSalesBodyState();
}

class _DispatchDetailsV2PerSalesBodyState
    extends State<DispatchDetailsV2PerSalesBody> {
  String viewActiveTab = "";
  @override
  void initState() {
    viewActiveTab = "Dates";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PerSalesHeaderTabs(),
        const SizedBox(height: 5),
        DispatchDetailsPerSalesHeader(
          user: widget.user,
          date: DateTime.now(),
          viewActiveTab: viewActiveTab,
          onViewChange: (value) {
            viewActiveTab = value;
            setState(() {});
          },
        ),
        const SizedBox(height: 10),
        BlocBuilder<DispatchDetailsV2PerSalesCubit,
            DispatchDetailsV2PerSalesState>(builder: (context, state) {
          if (state is DispatchDetailsV2PerSalesSuccess) {
            return state.dispatchDetails.isNotEmpty
                ? Expanded(
                    child: DispatchDetailsPerSalesSuccessV2(
                        dispatchList: state.dispatchDetails,
                        viewType: viewActiveTab,
                        year: DateTime.parse(state
                                .dispatchDetails[0].months[0].date
                                .toString())
                            .year),
                  )
                : const Center(child: Text("No Data Avilable"));
          } else if (state is DispatchDetailsV2PerSalesFailure) {
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

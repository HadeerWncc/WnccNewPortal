import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/tables/loading_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/cubits/dispatch_detasils_v2_per_region_cubit/dispatch_detasils_v2_per_region_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/dispatch_details_per_region_header.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/dispatch_details_per_region_success_v2.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/per_sales_header_tabs.dart';

class DispatchDetailsV2PerRegionBody extends StatefulWidget {
  const DispatchDetailsV2PerRegionBody({super.key});
  @override
  State<DispatchDetailsV2PerRegionBody> createState() =>
      _DispatchDetailsV2PerRegionBodyState();
}

class _DispatchDetailsV2PerRegionBodyState
    extends State<DispatchDetailsV2PerRegionBody> {
  List<String> incotermList = [];
  List<String> typeList = [];
  List<String> regionsList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PerSalesHeaderTabs(),
        const SizedBox(height: 5),
        DispatchDetailsPerRegionHeader(
          date: DateTime.now(),
          onChangeincoterm: (incotermValues) {
            setState(() {
              incotermList = incotermValues;
            });
          },
          onChangeType: (typeValues) {
            setState(() {
              typeList = typeValues;
            });
          },
          onSelectRegions: (regions) {
            setState(() {
              regionsList = regions;
            });
          },
        ),
        const SizedBox(height: 10),
        BlocBuilder<DispatchDetasilsV2PerRegionCubit,
            DispatchDetasilsV2PerRegionState>(builder: (context, state) {
              
          if (state is DispatchDetasilsV2PerRegionSuccess) {
            
            return state.dispatchDetails.isNotEmpty
                ? Expanded(
                    child: DispatchDetailsPerRegionSuccessV2(
                      dispatchList: state.dispatchDetails,
                      incotrem: incotermList,
                      types:typeList,
                      regions: regionsList,
                      year: DateTime.parse(state
                                .dispatchDetails[0].monthDate
                                .toString())
                            .year,
                    ),
                  )
                : const Center(child: Text("No Data Avilable"));
          } else if (state is DispatchDetasilsV2PerRegionFailure) {
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

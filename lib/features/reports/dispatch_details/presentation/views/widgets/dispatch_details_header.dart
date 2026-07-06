import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/dispatch_details_cubit/dispatch_details_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/data_value.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/custom_year_picker.dart';

class DispatchDetailsHeader extends StatelessWidget {
  const DispatchDetailsHeader(
      {super.key,
      required this.selectedItems,
      this.onChanged,
      required this.group});
  final List<String> selectedItems;
  final Function(List<String>, List<DataValue>)? onChanged;
  final int group;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            CustomYearPicker(
              title: 'Select Year',
              onChange: (value) {
                BlocProvider.of<DispatchDetailsCubit>(context)
                      .getDispatchDetailsPerRegion(value);
                // if (group == 0) {
                //   BlocProvider.of<DispatchDetailsCubit>(context)
                //       .getDispatchDetailsPerRegion(value);
                // } else if (group == 1) {
                //   BlocProvider.of<DispatchDetailsV2PerSalesCubit>(context)
                //       .getDispatchDetailsV2PerSales(value,0,);
                // } else {}
              },
            ), 
            // BlocBuilder<DispatchDetailsCubit, DispatchDetailsState>(
            //         builder: (context, state) {
            //           if (state is DispatchDetailsSuccess) {
            //             return SizedBox(
            //               width: MediaQuery.of(context).size.width * .44,
            //               child: MultiSelectDropDown(
            //                 items: state.dispatchDetailsList.first.monthDays
            //                         ?.first.dataValues
            //                         ?.expand((d) => (d.relationValues ?? [])
            //                             .map((r) => RegionWithArea(
            //                                   regionName: r.name ?? "",
            //                                   areaName: d.name ?? "Others",
            //                                 )))
            //                         .toList() ??
            //                     [],
            //                 selectedItems: selectedItems,
            //                 onChanged: (values) {
            //                   onChanged?.call(
            //                     values,
            //                     state.dispatchDetailsList.first.monthDays?.first
            //                             .dataValues ??
            //                         [],
            //                   );
            //                 },
            //               ),
            //             );
            //           }
            //           return SizedBox(
            //             width: MediaQuery.of(context).size.width * .44,
            //             child: const LoadingBtn(title: 'select items'),
            //           );
            //         },
            //       )
                
                   
          ]),
    );
  }
}

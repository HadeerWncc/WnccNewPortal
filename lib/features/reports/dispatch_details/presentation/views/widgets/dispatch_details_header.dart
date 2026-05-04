import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/buttons/loading_btn.dart';
import 'package:wncc_portal/core/widgets/multi_select_drop_down.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/data_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/region_with_area.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/dispatch_details_cubit/dispatch_details_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/dispatch_details_per_customer_cubit/dispatch_details_per_customer_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/dispatch_details_per_sales_cubit/dispatch_details_per_sales_cubit.dart';
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
                if (group == 0) {
                  BlocProvider.of<DispatchDetailsCubit>(context)
                      .getDispatchDetailsPerRegion(value);
                } else if (group == 1) {
                  BlocProvider.of<DispatchDetailsPerSalesCubit>(context)
                      .getDispatchDetailsPerSales(value);
                } else {}
              },
            ),
            group == 0
                ? BlocBuilder<DispatchDetailsCubit, DispatchDetailsState>(
                    builder: (context, state) {
                      if (state is DispatchDetailsSuccess) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * .44,
                          child: MultiSelectDropDown(
                            items: state.dispatchDetailsList.first.monthDays
                                    ?.first.dataValues
                                    ?.expand((d) => (d.relationValues ?? [])
                                        .map((r) => RegionWithArea(
                                              regionName: r.name ?? "",
                                              areaName: d.name ?? "Others",
                                            )))
                                    .toList() ??
                                [],
                            selectedItems: selectedItems,
                            onChanged: (values) {
                              onChanged?.call(
                                values,
                                state.dispatchDetailsList.first.monthDays?.first
                                        .dataValues ??
                                    [],
                              );
                            },
                          ),
                        );
                      }
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * .44,
                        child: const LoadingBtn(title: 'select items'),
                      );
                    },
                  )
                : group == 1
                    ? BlocBuilder<DispatchDetailsPerSalesCubit,
                        DispatchDetailsPerSalesState>(
                        builder: (context, state) {
                          if (state is DispatchDetailsPerSalesSuccess) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * .44,
                              child: MultiSelectDropDown(
                                items: state.dispatchDetails.first.monthDays
                                        ?.first.dataValues!
                                        .map((v) => RegionWithArea(
                                              regionName: v.name ?? "",
                                              areaName: "Others",
                                            ))
                                        .toList() ??
                                    [],
                                selectedItems: state.dispatchDetails.first
                                        .monthDays?.first.dataValues!
                                        .map((v) => v.name ?? '')
                                        .toList() ??
                                    [],
                                onChanged: (values) {
                                  onChanged?.call(
                                    values,
                                    state.dispatchDetails.first.monthDays?.first
                                            .dataValues ??
                                        [],
                                  );
                                },
                              ),
                            );
                          }
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * .44,
                            child: const LoadingBtn(title: 'select items'),
                          );
                        },
                      )
                    : BlocBuilder<DispatchDetailsPerCustomerCubit,
                        DispatchDetailsPerCustomerState>(
                        builder: (context, state) {
                          if (state is DispatchDetailsPerCustomerSuccess) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * .44,
                              child: MultiSelectDropDown(
                                items: state.dispatchDetails.first.monthDays
                                        ?.first.dataValues!
                                        .map((v) => RegionWithArea(
                                              regionName: v.name ?? "",
                                              areaName: "Others",
                                            ))
                                        .toList() ??
                                    [],
                                selectedItems: state.dispatchDetails.first
                                        .monthDays?.first.dataValues!
                                        .map((v) => v.name ?? '')
                                        .toList() ??
                                    [],
                                onChanged: (values) {
                                  onChanged?.call(
                                    values,
                                    state.dispatchDetails.first.monthDays?.first
                                            .dataValues ??
                                        [],
                                  );
                                },
                              ),
                            );
                          }
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * .44,
                            child: const LoadingBtn(title: 'select items'),
                          );
                        },
                      )
          ]),
    );
  }
}

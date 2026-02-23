import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_toggle_button.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/manager/constants/const_list.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/manager/cubits/fact_vs_cust_compare_cubit/fact_vs_cust_compare_cubit.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/custom_year_picker.dart';

class CompareHeader extends StatefulWidget {
  const CompareHeader({super.key, this.onToggle});
  final Function(bool openChart)? onToggle;
  @override
  State<CompareHeader> createState() => _CompareHeaderState();
}

class _CompareHeaderState extends State<CompareHeader> {
  DateTime selectedDate = DateTime.now();
  DateTime compareDate = DateTime(DateTime.now().year - 1, 1, 1);
  bool openCharts = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(spacing: 8, runSpacing: 8, children: [
        CustomToggleButton(onToggle: (value) {
          setState(() => openCharts = value);
          widget.onToggle?.call(value);
        }),
        SizedBox(
          width: MediaQuery.of(context).size.width * .4,
          child: CustomDropDownInput(
            title: 'Select',
            items: factreportOptionsList,
            selectedValue: 'Compare',
            onChanged: (value) {
              // Handle dropdown change
              if (value == 'Hourly') {
                GoRouter.of(context).push(AppRouter.factVsCustDispatchHourly);
              } else if (value == 'Daily') {
                GoRouter.of(context).push(AppRouter.factVsCustDispatchDaily);
              } else if (value == 'Monthly') {
                GoRouter.of(context).push(AppRouter.factVsCustDispatchMonthly);
              }
            },
          ),
        ),
        openCharts
            ? const SizedBox()
            : CustomYearPicker(
                title: 'Compare Year',
                initialDate: compareDate,
                onChange: (value) {
                  compareDate = value;
                  setState(() {});
                  BlocProvider.of<FactVsCustCompareCubit>(context)
                      .getFactVsCustDispCompare(selectedDate, value);
                },
              ),
        openCharts
            ? const SizedBox()
            : CustomYearPicker(
                title: 'Selected Year',
                initialDate: selectedDate,
                onChange: (value) {
                  selectedDate = value;
                  setState(() {});
                  BlocProvider.of<FactVsCustCompareCubit>(context)
                      .getFactVsCustDispCompare(value, compareDate);
                },
              ),
      ]),
    );
  }
}

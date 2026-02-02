import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/manager/const/const_list.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/manager/cubits/fact_vs_cust_cubit/fact_vs_cust_cubit.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/custom_year_picker.dart';

class MonthlyHeader extends StatelessWidget {
  const MonthlyHeader({super.key});

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
        SizedBox(
          width: 180,
          child: CustomDropDownInput(
            title: 'Select',
            items: factVsCustDispOptions,
            selectedValue: 'Monthly',
            onChanged: (value) {
              // Handle dropdown change
              if (value == 'Hourly') {
                GoRouter.of(context).push(AppRouter.factVsCustDispatchHourly);
              } else if (value == 'Daily') {
                GoRouter.of(context).push(AppRouter.factVsCustDispatchDaily);
              } else if (value == 'Compare') {
                GoRouter.of(context).push(AppRouter.factVsCustDispatchCompare);
              }
            },
          ),
        ),
        CustomYearPicker(
          title: 'Select Year',
          onChange: (value) {
            BlocProvider.of<FactVsCustCubit>(context)
                .getFactVsCustDisp(1, value);
          },
        ),
      ]),
    );
  }
}

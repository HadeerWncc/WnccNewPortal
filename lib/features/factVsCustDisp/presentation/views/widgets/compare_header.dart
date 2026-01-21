import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/manager/const/const_list.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/custom_year_picker.dart';

class CompareHeader extends StatelessWidget {
  const CompareHeader({super.key});

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
          children: [
            CustomDropDownInput(
              title: 'Select',
              items: factVsCustDispOptions,
              selectedValue: 'Compare',
              onChanged: (value) {
                // Handle dropdown change
                if (value == 'Hourly') {
                  GoRouter.of(context).push(AppRouter.factVsCustDispatchHourly);
                } else if (value == 'Daily') {
                  GoRouter.of(context).push(AppRouter.factVsCustDispatchDaily);
                }
                else if (value == 'Monthly') {
                  GoRouter.of(context).push(AppRouter.factVsCustDispatchMonthly);
                }
              },
            ),
            CustomYearPicker(
              title: 'Select Year',
              onChange: (value) {
                // BlocProvider.of<FactVsCustCubit>(context)
                //     .getFactVsCustDisp(1, value);
              },
            ),
          ]),
    );
  }
}
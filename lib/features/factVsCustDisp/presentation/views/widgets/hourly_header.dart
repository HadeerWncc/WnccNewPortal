import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/date_picker.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/manager/const/const_list.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/manager/cubits/fact_vs_cust_cubit/fact_vs_cust_cubit.dart';

class HourlyHeader extends StatelessWidget {
  const HourlyHeader({
    super.key,
  });

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
          spacing: 8, // مسافة أفقية بين العناصر
          runSpacing: 8,
          children: [
            CustomDropDownInput(
              title: 'Select',
              items: factVsCustDispOptions,
              selectedValue: 'Hourly',
              onChanged: (value) {
                // Handle dropdown change
                if (value == 'Daily') {
                  GoRouter.of(context).push(AppRouter.factVsCustDispatchDaily);
                } else if (value == 'Monthly') {
                  GoRouter.of(context)
                      .push(AppRouter.factVsCustDispatchMonthly);
                }
                else if(value == 'Compare'){
                  GoRouter.of(context)
                      .push(AppRouter.factVsCustDispatchCompare);
                }
              },
            ),
            DatePicker(
              title: 'Select Date',
              onChange: (value) {
                BlocProvider.of<FactVsCustCubit>(context).getFactVsCustDisp(3, value);
              },
            ),
          ]),
    );
  }
}

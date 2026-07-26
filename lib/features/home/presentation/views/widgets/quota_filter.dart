import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/core/widgets/custom_range_date_picker.dart';
import 'package:wncc_portal/core/widgets/date_picker.dart';
import 'package:wncc_portal/features/home/presentation/manager/cubites/home_cubit/home_cubit.dart';

class QuotaFilter extends StatelessWidget {
  const QuotaFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 200,
              child: CustomRangeDatePicker(
                title: 'Select Date',
                onChange: (value) {
                  BlocProvider.of<HomeCubit>(context)
                      .getHomeSummary(value.start, value.end, '1000049');
                },
              ),
            ),
            const SizedBox(width: 10),
            CustomPlaceholderInput(
              width: 100,
              labelText: 'Code',
              controller: TextEditingController(),
            ),
            const SizedBox(width: 10),
            // const Icon(Icons.waving_hand, color: Colors.amber,),
          ],
        ),
        const SizedBox(height: 10),

        SizedBox(
          width: 150,
          child: CustomButtonWithIcon(
            onTap: () {},
            child: 'Search',
            textColor: Colors.white,
            bgColor: const Color(0xff029ff8),
            onHoverColor: const Color.fromARGB(255, 2, 125, 197),
            icon: Symbols.search,
          ),
        ),
        const SizedBox(height: 10),

        // Text(
        //   'Your quota today is ${formatNum(quota)}',
        //   style: TextStyle(
        //     fontSize: 16,
        //     color: mode == 0 ? Colors.white : homeColor,
        //   ),
        // ),
        // const SizedBox(height: 12),
        // LinearPercentIndicator(
        //   padding: const EdgeInsets.symmetric(horizontal: 0),
        //   lineHeight: 3,
        //   percent: (priority / quota) > 1 ? 1 : (priority / quota),
        //   barRadius: const Radius.circular(20),
        //   backgroundColor: mode == 0 ? Colors.white : homeColor,
        //   progressColor: const Color.fromARGB(255, 18, 177, 87),
        //   animation: true,
        // ),
        // const SizedBox(height: 10),
        // Text(
        //   '${formatNum(priority)}/${formatNum(quota)} completed . ${parseToInt(formatNum((priority / quota) * 100))}%',
        //   style: TextStyle(
        //     color: mode == 0 ? Colors.white : homeColor,
        //     fontSize: 13,
        //     fontWeight: FontWeight.bold,
        //   ),
        // )
      ],
    );
  }
}
